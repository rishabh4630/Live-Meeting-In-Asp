"""
Live Meeting - Cross-Platform Web Version
==========================================
Original project: ASP.NET Web Forms (C#) + SQL Server (Windows only).
This version: Python + Flask + SQLite, so it runs on Windows, macOS and
Linux with the same code. SQLite replaces SQL Server and the browser
replaces Web Forms.

Run:
    macOS/Linux : ./run_mac_linux.sh   (or: python3 app.py)
    Windows     : run_windows.bat      (or: py app.py)
Then open http://127.0.0.1:5000 in any browser.

What this version covers (mirroring the original):
    * User registration / login / logout, profile edit, change password
    * Admin masters: Country, State, City, Industry, Income, Interest,
      Occupation (add / delete, admin only)
    * Admin views: all users, feedback, login history
    * Internal mail: Compose, Inbox, Sent, Draft, Saved, Reply, Forward,
      Delete (this is mail inside the app, not real email delivery)
    * Appointments: create / list / cancel, calendar view by date
    * Text chat rooms: create / join a room, post messages
      (TEXT CHAT ONLY. This is not video calling, and the site never
      claims otherwise.)

Seed data in this file is DEMO data only, not real people or meetings.
Demo accounts (change the passwords after first login in a real deploy):
    Admin : admin@livemeeting.demo / Admin123
    Priya : priya@demo.local       / Demo1234
    Rahul : rahul@demo.local       / Demo1234
Passwords are stored hashed with Werkzeug, never in plain text.
"""

import html
import os
import re
import sqlite3
from datetime import date

from flask import Flask, flash, g, redirect, render_template_string, request, session, url_for
from werkzeug.security import check_password_hash, generate_password_hash

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DATABASE = os.path.join(BASE_DIR, "live_meeting.db")

app = Flask(__name__)
app.secret_key = "live-meeting-dev-key-change-me"

MASTER_KINDS = ["country", "state", "city", "industry", "income", "interest", "occupation"]
MAIL_FOLDERS = ["inbox", "sent", "draft", "saved"]
EMAIL_RE = re.compile(r"^[^@\s]+@[^@\s]+\.[^@\s]+$")


def get_db():
    if "db" not in g:
        g.db = sqlite3.connect(DATABASE)
        g.db.row_factory = sqlite3.Row
    return g.db


@app.teardown_appcontext
def close_db(_exc=None):
    db = g.pop("db", None)
    if db is not None:
        db.close()


def init_db():
    db = get_db()
    db.executescript("""
    CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL, email TEXT UNIQUE NOT NULL,
        password_hash TEXT NOT NULL, role TEXT NOT NULL DEFAULT 'user',
        country TEXT DEFAULT '', state TEXT DEFAULT '', city TEXT DEFAULT '',
        industry TEXT DEFAULT '', occupation TEXT DEFAULT '',
        interest TEXT DEFAULT '', income TEXT DEFAULT '',
        created_at TEXT DEFAULT (datetime('now'))
    );
    CREATE TABLE IF NOT EXISTS masters (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        kind TEXT NOT NULL, name TEXT NOT NULL,
        UNIQUE(kind, name)
    );
    CREATE TABLE IF NOT EXISTS mails (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        sender_id INTEGER, recipient_id INTEGER,
        subject TEXT NOT NULL, body TEXT NOT NULL,
        sender_folder TEXT NOT NULL DEFAULT 'sent',
        recipient_folder TEXT NOT NULL DEFAULT 'inbox',
        created_at TEXT DEFAULT (datetime('now'))
    );
    CREATE TABLE IF NOT EXISTS appointments (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER NOT NULL, title TEXT NOT NULL,
        with_user TEXT NOT NULL, appt_date TEXT NOT NULL,
        appt_time TEXT NOT NULL, notes TEXT DEFAULT '',
        status TEXT NOT NULL DEFAULT 'Scheduled',
        created_at TEXT DEFAULT (datetime('now'))
    );
    CREATE TABLE IF NOT EXISTS chat_rooms (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT UNIQUE NOT NULL, created_by INTEGER,
        created_at TEXT DEFAULT (datetime('now'))
    );
    CREATE TABLE IF NOT EXISTS chat_messages (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        room_id INTEGER NOT NULL, user_id INTEGER NOT NULL,
        body TEXT NOT NULL, created_at TEXT DEFAULT (datetime('now'))
    );
    CREATE TABLE IF NOT EXISTS feedback (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER, name TEXT NOT NULL, message TEXT NOT NULL,
        created_at TEXT DEFAULT (datetime('now'))
    );
    CREATE TABLE IF NOT EXISTS login_history (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER NOT NULL, login_at TEXT DEFAULT (datetime('now')),
        ip TEXT DEFAULT ''
    );
    """)
    # PRAGMA migration guards (older DBs gain new columns without a reset)
    cols = [r[1] for r in db.execute("PRAGMA table_info(users)").fetchall()]
    for col, ddl in [("interest", "TEXT DEFAULT ''"), ("income", "TEXT DEFAULT ''")]:
        if col not in cols:
            db.execute(f"ALTER TABLE users ADD COLUMN {col} {ddl}")
    seed(db)
    db.commit()


def seed(db):
    def user(email, name, pw, role="user", city="Lucknow", country="India"):
        db.execute(
            "INSERT OR IGNORE INTO users (name, email, password_hash, role, city, country)"
            " VALUES (?, ?, ?, ?, ?, ?)",
            (name, email, generate_password_hash(pw), role, city, country))

    user("admin@livemeeting.demo", "Admin", "Admin123", role="admin", city="Delhi")
    user("priya@demo.local", "Priya Verma", "Demo1234", city="Lucknow")
    user("rahul@demo.local", "Rahul Sharma", "Demo1234", city="Delhi")
    seed_masters = {
        "country": ["India", "USA", "UK"],
        "state": ["Uttar Pradesh", "Delhi", "Maharashtra"],
        "city": ["Lucknow", "Delhi", "Mumbai"],
        "industry": ["IT", "Healthcare", "Education"],
        "income": ["Below 5 LPA", "5-10 LPA", "Above 10 LPA"],
        "interest": ["Music", "Sports", "Reading"],
        "occupation": ["Developer", "Teacher", "Doctor"],
    }
    for kind, names in seed_masters.items():
        for n in names:
            db.execute("INSERT OR IGNORE INTO masters (kind, name) VALUES (?, ?)", (kind, n))
    db.execute("INSERT OR IGNORE INTO chat_rooms (name) VALUES ('General Chat')")
    # Seed mail + appointment + chat message only once (guard by count)
    if db.execute("SELECT COUNT(*) FROM mails").fetchone()[0] == 0:
        priya = db.execute("SELECT id FROM users WHERE email='priya@demo.local'").fetchone()
        rahul = db.execute("SELECT id FROM users WHERE email='rahul@demo.local'").fetchone()
        admin = db.execute("SELECT id FROM users WHERE email='admin@livemeeting.demo'").fetchone()
        if priya and rahul and admin:
            db.execute(
                "INSERT INTO mails (sender_id, recipient_id, subject, body) VALUES (?, ?, ?, ?)",
                (admin[0], priya[0], "Welcome to Live Meeting",
                 "Welcome! Use Mail for messages, Appointments for meetings, and Chat rooms for live text chat."))
            db.execute(
                "INSERT INTO mails (sender_id, recipient_id, subject, body) VALUES (?, ?, ?, ?)",
                (priya[0], rahul[0], "Hello",
                 "Hi Rahul, shall we meet tomorrow to discuss the project?"))
            db.execute(
                "INSERT INTO mails (sender_id, recipient_id, subject, body, sender_folder, recipient_folder)"
                " VALUES (?, NULL, ?, ?, 'draft', 'draft')",
                (priya[0], "Draft note", "This is a saved draft."))
            db.execute(
                "INSERT INTO appointments (user_id, title, with_user, appt_date, appt_time, notes)"
                " VALUES (?, ?, ?, ?, ?, ?)",
                (priya[0], "Project discussion", "Rahul Sharma", "2026-11-05", "11:00",
                 "Discuss the project plan."))
            room = db.execute("SELECT id FROM chat_rooms WHERE name='General Chat'").fetchone()
            if room:
                db.execute(
                    "INSERT INTO chat_messages (room_id, user_id, body) VALUES (?, ?, ?)",
                    (room[0], priya[0], "Hello everyone! This is a text chat room."))
    # NOTE: init_db runs at import, so seeding happens on first start too.


with app.app_context():
    init_db()


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

def current_user():
    uid = session.get("user_id")
    if not uid:
        return None
    return get_db().execute("SELECT * FROM users WHERE id=?", (uid,)).fetchone()


def admin_email():
    # Owner admin, set only via environment (never in code). Unset = nobody auto-admin.
    return os.environ.get("ADMIN_EMAIL", "").strip().lower()


def require_login():
    if not current_user():
        flash("Please log in first.")
        return redirect(url_for("login"))
    return None


def require_admin():
    u = current_user()
    if not u:
        flash("Please log in first.")
        return redirect(url_for("login"))
    if u["role"] != "admin":
        flash("Admin only.")
        return redirect(url_for("home"))
    return None


def valid_password(pw):
    return (len(pw) >= 8 and re.search(r"[A-Z]", pw) and re.search(r"[a-z]", pw)
            and re.search(r"[0-9]", pw))


def esc(v):
    return html.escape("" if v is None else str(v))


def nav(u):
    links = [('<a href="/">Home</a>'), ('<a href="/chat">Chat</a>'),
             ('<a href="/appointments">Appointments</a>'), ('<a href="/mail">Mail</a>'),
             ('<a href="/feedback">Feedback</a>'), ('<a href="/about">About</a>')]
    if u:
        links.append('<a href="/profile">Profile</a>')
        if u["role"] == "admin":
            links.append('<a href="/masters">Masters</a>')
            links.append('<a href="/admin">Admin</a>')
        links.append(f'<span class="pill">{esc(u["name"])} ({esc(u["role"])})</span>')
        links.append('<a href="/logout">Logout</a>')
    else:
        links.append('<a href="/login">Login</a>')
        links.append('<a href="/signup">Sign Up</a>')
    return '<nav>' + " ".join(links) + "</nav>"


def page(title, body, u=None):
    if u is None:
        u = current_user()
    msgs = ""
    # flash messages are rendered by the caller via get_flashed_messages in layout below
    from flask import get_flashed_messages
    for m in get_flashed_messages():
        msgs += f'<p class="flash">{esc(m)}</p>'
    return render_template_string(LAYOUT, title=title, nav=nav(u), body=msgs + body)


LAYOUT = """<!doctype html><html lang="en"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{{ title }} - Live Meeting</title>
<style>:root{--bg:#0F1117;--surface:#1B1E2A;--surface2:#232636;--line:#2E3247;--ink:#ECEEF4;--muted:#9AA0B5;--violet:#8B5CF6;--violet2:#A78BFA;--pink:#EC4899;--amber:#F59E0B}
*{box-sizing:border-box}body{margin:0;font-family:system-ui,-apple-system,Segoe UI,Roboto,sans-serif;background:var(--bg);color:var(--ink)}
h1,h2,h3{font-weight:750;letter-spacing:-.02em}
header{position:sticky;top:0;z-index:10;background:rgba(15,17,23,.92);backdrop-filter:blur(10px);color:#fff;padding:16px 20px;border-bottom:1px solid var(--line)}
header a{color:#fff;text-decoration:none}header>a:first-child strong{font-size:1.3rem}header>a:first-child strong::before{content:"● ";color:var(--violet2)}
header>div{color:var(--muted);margin-top:4px;font-size:.9rem}
nav{display:flex;gap:8px;flex-wrap:wrap;margin-top:12px}
nav a{color:#C6CADD;cursor:pointer;padding:8px 14px;border-radius:999px;border:1px solid transparent;font-weight:600}nav a:hover{background:var(--surface2);border-color:var(--line);color:#fff}
main{max-width:980px;margin:0 auto;padding:28px 20px}
.hero{background:linear-gradient(135deg,#1E1B4B,#4C1D95 55%,#831843);color:#fff;border:1px solid #3B3560;border-radius:24px;padding:36px;margin-bottom:22px;box-shadow:0 20px 50px rgba(139,92,246,.25)}
.hero h1{margin:0 0 8px;font-size:2rem}.hero p{color:#DDD6FE}
.card{background:var(--surface);border:1px solid var(--line);border-radius:18px;padding:20px;margin-bottom:18px;box-shadow:0 12px 30px rgba(0,0,0,.35)}
.grid{display:grid;grid-template-columns:repeat(3,1fr);gap:14px}
label{display:block;margin:10px 0 4px;font-weight:650;color:#DDD6FE}
input,select,textarea{width:100%;padding:11px;border:1px solid var(--line);border-radius:12px;font:inherit;background:var(--surface2);color:var(--ink)}input:focus,select:focus,textarea:focus{outline:2px solid var(--violet);border-color:var(--violet)}
button,.btn{display:inline-block;background:linear-gradient(100deg,var(--violet),var(--pink));color:#fff;border:0;border-radius:999px;padding:11px 22px;font:inherit;font-weight:700;cursor:pointer;text-decoration:none;box-shadow:0 8px 22px rgba(139,92,246,.35)}
button.secondary,.btn.secondary{background:var(--surface2);color:var(--ink);border:1px solid var(--line);box-shadow:none}
table{width:100%;border-collapse:collapse}th,td{padding:9px 10px;border-bottom:1px solid var(--line);text-align:left}
.table-wrap{overflow-x:auto}.flash{background:#2A2410;border:1px solid var(--amber);color:#FDE68A;padding:10px 14px;border-radius:12px}
.pill{background:rgba(139,92,246,.22);border:1px solid var(--violet);color:#DDD6FE;border-radius:999px;padding:3px 10px;font-size:.85rem}
.muted{color:var(--muted)}footer{padding:20px;text-align:center;color:var(--muted)}
.chatlog{display:flex;flex-direction:column;gap:10px;margin:14px 0}
.msg{border:1px solid var(--line);border-radius:16px;padding:10px 14px;background:var(--surface2);max-width:85%}
.msg.mine{background:linear-gradient(100deg,var(--violet),#7C3AED);border-color:transparent;margin-left:auto}
@media(max-width:520px){.grid{grid-template-columns:1fr}main{padding:16px 12px}.hero{padding:22px 18px}}.daily{display:grid;grid-template-columns:repeat(3,1fr);gap:14px;margin-bottom:18px}@media(max-width:520px){.daily{grid-template-columns:1fr}}main{padding:32px 24px;animation:fadeUp .45s ease}
@keyframes fadeUp{from{opacity:0;transform:translateY(10px)}to{opacity:1;transform:none}}
.hero{padding:44px 40px;border-radius:28px;box-shadow:0 24px 60px rgba(139,92,246,.30), inset 0 1px 0 rgba(255,255,255,.12);position:relative;overflow:hidden}
.hero::after{content:"";position:absolute;right:-70px;top:-70px;width:240px;height:240px;background:radial-gradient(circle,rgba(236,72,153,.45),transparent 70%);pointer-events:none}
.hero>p:first-child{display:inline-block;background:rgba(255,255,255,.14);border:1px solid rgba(255,255,255,.25);border-radius:999px;padding:6px 12px;font-size:.8rem;letter-spacing:.08em}
.hero h1{font-size:2.4rem;line-height:1.15}
.card{border-radius:20px;padding:24px;box-shadow:0 16px 40px rgba(0,0,0,.45);transition:transform .18s ease, box-shadow .18s ease}
.card:hover{transform:translateY(-2px);box-shadow:0 20px 48px rgba(0,0,0,.52)}
.grid{gap:16px}
button,.btn{padding:12px 24px;box-shadow:0 10px 26px rgba(139,92,246,.4);transition:filter .15s ease, transform .15s ease}
button:hover,.btn:hover{filter:brightness(1.12)}
button:active,.btn:active{transform:scale(.98)}
input,select,textarea{padding:12px}
th{font-size:.8rem;text-transform:uppercase;letter-spacing:.06em;color:var(--muted)}
nav a{transition:background .15s ease, border-color .15s ease}
@media(prefers-reduced-motion:reduce){main{animation:none}.card,.card:hover{transform:none;transition:none}}
@media(max-width:520px){.hero{padding:26px 20px}.hero h1{font-size:1.7rem}main{padding:20px 14px}}html{scroll-behavior:smooth}
::selection{background:#8B5CF6;color:#fff}
header{background:rgba(15,17,23,.78);backdrop-filter:blur(14px);-webkit-backdrop-filter:blur(14px);box-shadow:0 8px 30px rgba(0,0,0,.35)}
nav a{background:rgba(255,255,255,.05);border:1px solid rgba(255,255,255,.09)}
nav a:hover{background:rgba(139,92,246,.22);border-color:rgba(167,139,250,.6)}
.card{background:linear-gradient(180deg,#22263A,#1B1E2A);border:1px solid rgba(255,255,255,.09)}
.hero::before{content:"";position:absolute;left:-70px;bottom:-90px;width:240px;height:240px;background:radial-gradient(circle,rgba(139,92,246,.4),transparent 70%);pointer-events:none}
.grid .card b{font-size:1.8rem;background:linear-gradient(100deg,#A78BFA,#EC4899);-webkit-background-clip:text;background-clip:text;color:transparent}
button,.btn{box-shadow:0 10px 26px rgba(139,92,246,.4), inset 0 1px 0 rgba(255,255,255,.25)}
input:focus,select:focus,textarea:focus{box-shadow:0 0 0 4px rgba(139,92,246,.25)}
.pill{background:rgba(139,92,246,.22);border:1px solid rgba(167,139,250,.55);color:#DDD6FE}
::-webkit-scrollbar{width:10px;height:10px}
::-webkit-scrollbar-thumb{background:#2E3247;border-radius:999px}
::-webkit-scrollbar-track{background:transparent}
@media(prefers-reduced-motion:reduce){html{scroll-behavior:auto}}</style></head><body>
<header><a href="/"><strong>Live Meeting</strong></a><div>Text chat, mail and appointments — in one place.</div>{{ nav|safe }}</header>
<main>{{ body|safe }}</main>
<footer>Live Meeting web version &middot; Text chat only — this is not video calling &middot; Demo data only</footer>
</body></html>"""


def field(label, name, value="", typ="text", required=False):
    req = " required" if required else ""
    return (f'<label>{label}</label>'
            f'<input type="{typ}" name="{name}" value="{esc(value)}"{req}>')


# ---------------------------------------------------------------------------
# Home / About / Contact
# ---------------------------------------------------------------------------

@app.route("/")
def home():
    db = get_db()
    u = current_user()
    stats = {
        "users": db.execute("SELECT COUNT(*) FROM users").fetchone()[0],
        "rooms": db.execute("SELECT COUNT(*) FROM chat_rooms").fetchone()[0],
        "mails": db.execute("SELECT COUNT(*) FROM mails").fetchone()[0],
        "appts": db.execute("SELECT COUNT(*) FROM appointments WHERE status='Scheduled'").fetchone()[0],
    }
    rooms = db.execute("SELECT * FROM chat_rooms ORDER BY name").fetchall()
    room_cards = "".join(
        f'<div class="card"><h3>{esc(r["name"])}</h3>'
        f'<p><a class="btn" href="/chat/{r["id"]}">Join chat</a></p></div>' for r in rooms)
    daily_city = (u["city"] if u and u["city"] else "Lucknow").replace('"', "").replace("'", "")
    daily_tz = {"USA": "America/New_York", "UK": "Europe/London"}.get(u["country"] if u else "", "Asia/Kolkata")
    body = f"""<div class="hero"><p>BUS &amp; MEETING — TEXT CHAT, MAIL &amp; APPOINTMENTS</p>
    <h1>Meet, message and plan — in one place.</h1>
    <p>Register, send internal mail, book appointments and join a live text chat room.
    This is text chat only, not video calling.</p>
    <p><a class="btn" href="/chat">Open Chat</a> <a class="btn secondary" href="/appointments">Appointments</a></p></div>
    <div class="daily"><div class="card"><h3>Today in your city</h3><p id="daily-weather" class="muted">Loading weather...</p></div><div class="card"><h3>Meeting icebreaker</h3><p id="daily-tip" class="muted">Loading...</p></div><div class="card"><h3>Meeting time now</h3><p id="daily-clock" class="muted">Loading time...</p></div></div>
    <div class="grid">
      <div class="card"><h3>Users</h3><p><b>{stats["users"]}</b></p></div>
      <div class="card"><h3>Chat rooms</h3><p><b>{stats["rooms"]}</b></p></div>
      <div class="card"><h3>Messages &amp; mail</h3><p><b>{stats["mails"]}</b></p></div>
      <div class="card"><h3>Scheduled appointments</h3><p><b>{stats["appts"]}</b></p></div>
    </div>
    <h2>Chat rooms</h2><div class="grid">{room_cards or "<p>No rooms yet.</p>"}</div>
    <div class="card"><h2>What this is</h2><p class="muted">A web remake of the original
    ASP.NET Live Meeting project. The original used SQL Server and Web Forms;
    this version uses SQLite and Flask, so it runs on Windows, macOS and Linux.
    Chat here is live text chat in a room — it does not start a video call.</p></div>
    <script>
    function esc(s){{return String(s==null?"":s).replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/"/g,"&quot;");}}
    function wmoLabel(c){{if(c===0)return "Clear sky";if(c===1)return "Mainly clear";if(c===2)return "Partly cloudy";if(c===3)return "Overcast";if(c===45||c===48)return "Foggy";if(c===51||c===53||c===55)return "Drizzle";if(c===61||c===63||c===65)return "Rain";if(c===71||c===73||c===75)return "Snow";if(c===80||c===81||c===82)return "Rain showers";if(c===95)return "Thunderstorm";return "Weather update";}}
    (function(){{
      var city="{daily_city}";
      var w=document.getElementById("daily-weather"),tip=document.getElementById("daily-tip");
      if(!w||!tip)return;
      fetch("https://geocoding-api.open-meteo.com/v1/search?name="+encodeURIComponent(city)+"&count=1").then(function(r){{return r.json();}}).then(function(g){{
        if(!g.results||!g.results.length)throw new Error("no city");
        var lat=g.results[0].latitude,lon=g.results[0].longitude,name=g.results[0].name;
        return fetch("https://api.open-meteo.com/v1/forecast?latitude="+lat+"&longitude="+lon+"&current=temperature_2m,weather_code&timezone=auto").then(function(r){{return r.json();}}).then(function(f){{
          w.innerHTML="<b>"+esc(name)+"</b><br>"+Math.round(f.current.temperature_2m)+"°C, "+wmoLabel(f.current.weather_code)+" — good to know before you step out for a meeting.";
          fetch("https://air-quality-api.open-meteo.com/v1/air-quality?latitude="+lat+"&longitude="+lon+"&current=pm2_5,us_aqi").then(function(r){{return r.json();}}).then(function(a){{
            if(a.current&&a.current.us_aqi!=null){{
              var q=a.current.us_aqi, label=q<=50?"Good":q<=100?"Moderate":q<=150?"Unhealthy for sensitive groups":q<=200?"Unhealthy":q<=300?"Very unhealthy":"Hazardous";
              w.innerHTML+="<br>Air quality: AQI "+Math.round(q)+" ("+label+"), PM2.5 "+Math.round(a.current.pm2_5)+" µg/m³.";
            }}
          }}).catch(function(){{}});
          fetch("https://api.open-meteo.com/v1/forecast?latitude="+lat+"&longitude="+lon+"&daily=sunrise,sunset&timezone=auto&forecast_days=1").then(function(r){{return r.json();}}).then(function(s){{
            if(s.daily&&s.daily.sunrise&&s.daily.sunrise.length){{
              w.innerHTML+="<br>Sunrise "+esc(s.daily.sunrise[0].slice(11,16))+", sunset "+esc(s.daily.sunset[0].slice(11,16))+".";
            }}
          }}).catch(function(){{}});
        }});
      }}).catch(function(){{w.innerHTML="Weather unavailable right now.";}});
      fetch("https://api.adviceslip.com/advice").then(function(r){{return r.json();}}).then(function(d){{
        tip.innerHTML="“"+esc(d.slip.advice)+"”";
      }}).catch(function(){{tip.innerHTML="Icebreaker unavailable right now.";}});
      var ck=document.getElementById("daily-clock");
      if(ck){{
        var tz="{daily_tz}";
        var zones=["Asia/Kolkata","America/New_York","Europe/London"];
        zones.sort(function(a,b){{return (a===tz?-1:0)-(b===tz?-1:0);}});
        var done=0;
        zones.forEach(function(z){{
          fetch("https://timeapi.io/api/time/current/zone?timeZone="+encodeURIComponent(z)).then(function(r){{return r.json();}}).then(function(d){{
            var short=z.split("/")[1].replace("_"," ");
            var line="<b>"+esc(d.time)+"</b> · "+esc(short);
            if(z===tz){{line="<b>"+esc(d.time)+"</b> · "+esc(d.dayOfWeek)+" · "+esc(short)+" (yours)";}}
            ck.innerHTML=(done===0?"":ck.innerHTML+"<br>")+line;
            done++;
          }}).catch(function(){{done++;if(done===zones.length&&!ck.innerHTML)ck.innerHTML="Time unavailable right now.";}});
        }});
      }}
    }})();
    </script>"""
    return page("Home", body, u)


@app.route("/about")
def about():
    return page("About", """<div class="card"><h2>About Live Meeting</h2>
    <p>Live Meeting is a small collaboration app: user accounts, internal mail,
    appointments with a calendar view, admin masters, feedback, and live text
    chat rooms. It is a student/demo remake of an ASP.NET Web Forms project.</p>
    <p class="muted">No real contact details are published here. This is demo data only.</p>
    <h3>Thought of the day</h3><p id="about-quote" class="muted">Loading...</p></div>
    <script>
    (function(){
      var q=document.getElementById("about-quote");
      if(!q)return;
      fetch("https://zenquotes.io/api/random").then(function(r){return r.json();}).then(function(d){
        if(!d||!d.length)throw new Error("no quote");
        q.innerHTML="“"+d[0].q+"” — "+d[0].a;
      }).catch(function(){q.innerHTML="Quote unavailable right now.";});
    })();
    </script>""")


# ---------------------------------------------------------------------------
# Auth
# ---------------------------------------------------------------------------

@app.route("/signup", methods=["GET", "POST"])
def signup():
    if request.method == "POST":
        name = request.form.get("name", "").strip()
        email = request.form.get("email", "").strip().lower()
        pw = request.form.get("password", "")
        if not name or not EMAIL_RE.match(email):
            flash("Please enter your name and a valid email address.")
        elif not valid_password(pw):
            flash("Password must be 8+ characters with uppercase, lowercase and a digit.")
        else:
            db = get_db()
            try:
                role = "admin" if (admin_email() and email == admin_email()) else "user"
                db.execute(
                    "INSERT INTO users (name, email, password_hash, role) VALUES (?, ?, ?, ?)",
                    (name, email, generate_password_hash(pw), role))
                db.commit()
                flash("Account created. Please log in.")
                return redirect(url_for("login"))
            except sqlite3.IntegrityError:
                flash("That email is already registered.")
    return page("Sign Up", f"""<div class="card"><h2>Sign Up</h2><form method="post">
    {field("Full name", "name", required=True)}
    {field("Email", "email", typ="email", required=True)}
    {field("Password", "password", typ="password", required=True)}
    <p class="muted">Password: 8+ characters with uppercase, lowercase and a digit.</p>
    <p><button>Create account</button></p></form>
    <p>Already have an account? <a href="/login">Log in</a></p></div>""")


@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        email = request.form.get("email", "").strip().lower()
        pw = request.form.get("password", "")
        db = get_db()
        user = db.execute("SELECT * FROM users WHERE email=?", (email,)).fetchone()
        if user and check_password_hash(user["password_hash"], pw):
            if admin_email() and email == admin_email() and user["role"] != "admin":
                db.execute("UPDATE users SET role='admin' WHERE id=?", (user["id"],))
                db.commit()
            session["user_id"] = user["id"]
            db.execute("INSERT INTO login_history (user_id, ip) VALUES (?, ?)",
                       (user["id"], request.remote_addr or ""))
            db.commit()
            flash(f"Welcome, {user['name']}!")
            return redirect(url_for("home"))
        flash("Invalid email or password.")
    return page("Login", f"""<div class="card"><h2>Login</h2><form method="post">
    {field("Email", "email", typ="email", required=True)}
    {field("Password", "password", typ="password", required=True)}
    <p><button>Log in</button></p></form>
    <p class="muted">Demo admin: admin@livemeeting.demo / Admin123 (demo only).</p>
    <p>No account? <a href="/signup">Sign up</a></p></div>""")


@app.route("/logout")
def logout():
    session.clear()
    flash("Logged out.")
    return redirect(url_for("home"))


@app.route("/profile", methods=["GET", "POST"])
def profile():
    u = current_user()
    if not u:
        return require_login()
    db = get_db()
    if request.method == "POST":
        if "change_pw" in request.form:
            cur = request.form.get("current_password", "")
            new = request.form.get("new_password", "")
            if not check_password_hash(u["password_hash"], cur):
                flash("Current password is incorrect.")
            elif not valid_password(new):
                flash("New password must be 8+ characters with uppercase, lowercase and a digit.")
            else:
                db.execute("UPDATE users SET password_hash=? WHERE id=?",
                           (generate_password_hash(new), u["id"]))
                db.commit()
                flash("Password changed.")
        else:
            db.execute(
                "UPDATE users SET name=?, country=?, state=?, city=?, industry=?,"
                " occupation=?, interest=?, income=? WHERE id=?",
                (request.form.get("name", u["name"]).strip(),
                 request.form.get("country", ""), request.form.get("state", ""),
                 request.form.get("city", ""), request.form.get("industry", ""),
                 request.form.get("occupation", ""), request.form.get("interest", ""),
                 request.form.get("income", ""), u["id"]))
            db.commit()
            flash("Profile updated.")
        return redirect(url_for("profile"))
    u = current_user()
    return page("Profile", f"""<div class="card"><h2>Profile</h2>
    <p>{esc(u["name"])} &middot; {esc(u["email"])} &middot; {esc(u["role"])}</p>
    <form method="post">
    {field("Full name", "name", u["name"], required=True)}
    {field("Country", "country", u["country"])}{field("State", "state", u["state"])}
    {field("City", "city", u["city"])}{field("Industry", "industry", u["industry"])}
    {field("Occupation", "occupation", u["occupation"])}{field("Interest", "interest", u["interest"])}
    {field("Income", "income", u["income"])}
    <p><button>Save profile</button></p></form></div>
    <div class="card"><h2>Change password</h2><form method="post">
    <input type="hidden" name="change_pw" value="1">
    {field("Current password", "current_password", typ="password", required=True)}
    {field("New password", "new_password", typ="password", required=True)}
    <p><button>Change password</button></p></form></div>""")


# ---------------------------------------------------------------------------
# Mail
# ---------------------------------------------------------------------------

@app.route("/mail")
def mail_list():
    u = current_user()
    if not u:
        return require_login()
    folder = request.args.get("folder", "inbox")
    if folder not in MAIL_FOLDERS:
        folder = "inbox"
    db = get_db()
    if folder == "inbox":
        rows = db.execute(
            "SELECT m.*, s.name AS sender_name FROM mails m LEFT JOIN users s ON s.id=m.sender_id"
            " WHERE m.recipient_id=? AND m.recipient_folder='inbox' ORDER BY m.id DESC", (u["id"],)).fetchall()
    elif folder == "sent":
        rows = db.execute(
            "SELECT m.*, r.name AS sender_name FROM mails m LEFT JOIN users r ON r.id=m.recipient_id"
            " WHERE m.sender_id=? AND m.sender_folder='sent' ORDER BY m.id DESC", (u["id"],)).fetchall()
    elif folder == "draft":
        rows = db.execute("SELECT * FROM mails WHERE sender_id=? AND sender_folder='draft'"
                          " ORDER BY id DESC", (u["id"],)).fetchall()
    else:  # saved
        rows = db.execute(
            "SELECT m.*, s.name AS sender_name FROM mails m LEFT JOIN users s ON s.id=m.sender_id"
            " WHERE (m.recipient_id=? AND m.recipient_folder='saved')"
            " OR (m.sender_id=? AND m.sender_folder='saved') ORDER BY m.id DESC",
            (u["id"], u["id"])).fetchall()
    tabs = " ".join(
        f'<a class="btn{" secondary" if f != folder else ""}" href="/mail?folder={f}">{f.title()}</a>'
        for f in MAIL_FOLDERS)
    rows_html = "".join(
        f'<tr><td><a href="/mail/{r["id"]}">{esc(r["subject"])}</a></td>'
        f'<td>{esc(r["sender_name"] or "Draft")}</td><td>{esc(r["created_at"])}</td></tr>'
        for r in rows)
    return page("Mail", f"""<div class="card"><h2>Mail — {folder.title()}</h2>
    <p>{tabs} <a class="btn" href="/mail/new">Compose</a></p>
    <div class="table-wrap"><table><tr><th>Subject</th><th>From / To</th><th>Date</th></tr>
    {rows_html or '<tr><td colspan="3">No mail here yet.</td></tr>'}</table></div></div>""")


@app.route("/mail/new", methods=["GET", "POST"])
def mail_new():
    u = current_user()
    if not u:
        return require_login()
    pre_to = request.args.get("to", "")
    pre_subject = request.args.get("subject", "")
    pre_body = request.args.get("body", "")
    if request.method == "POST":
        to_email = request.form.get("to_email", "").strip().lower()
        subject = request.form.get("subject", "").strip() or "(No subject)"
        body = request.form.get("body", "").strip()
        db = get_db()
        if request.form.get("draft"):
            db.execute(
                "INSERT INTO mails (sender_id, recipient_id, subject, body, sender_folder, recipient_folder)"
                " VALUES (?, NULL, ?, ?, 'draft', 'draft')", (u["id"], subject, body))
            db.commit()
            flash("Draft saved.")
            return redirect(url_for("mail_list", folder="draft"))
        recip = db.execute("SELECT id FROM users WHERE email=?", (to_email,)).fetchone()
        if not recip:
            flash("No user with that email. Mail was not sent.")
        else:
            db.execute(
                "INSERT INTO mails (sender_id, recipient_id, subject, body) VALUES (?, ?, ?, ?)",
                (u["id"], recip[0], subject, body))
            db.commit()
            flash("Mail sent.")
            return redirect(url_for("mail_list", folder="sent"))
    return page("Compose mail", f"""<div class="card"><h2>Compose mail</h2><form method="post">
    {field("To (email)", "to_email", pre_to, typ="email", required=True)}
    {field("Subject", "subject", pre_subject)}
    <label>Message</label><textarea name="body" rows="6" required>{esc(pre_body)}</textarea>
    <p><button>Send</button> <button class="secondary" name="draft" value="1">Save draft</button></p>
    </form><p class="muted">Internal mail only — this does not send real email.</p></div>""")


@app.route("/mail/<int:mid>")
def mail_view(mid):
    u = current_user()
    if not u:
        return require_login()
    db = get_db()
    m = db.execute(
        "SELECT m.*, s.name AS sender_name, s.email AS sender_email, r.name AS recip_name, r.email AS recip_email"
        " FROM mails m LEFT JOIN users s ON s.id=m.sender_id LEFT JOIN users r ON r.id=m.recipient_id"
        " WHERE m.id=?", (mid,)).fetchone()
    if not m or (m["sender_id"] != u["id"] and m["recipient_id"] != u["id"]):
        flash("Mail not found.")
        return redirect(url_for("mail_list"))
    return page("Mail", f"""<div class="card"><h2>{esc(m["subject"])}</h2>
    <p class="muted">From: {esc(m["sender_name"] or "Draft")} ({esc(m["sender_email"] or "")})<br>
    To: {esc(m["recip_name"] or "Draft")} ({esc(m["recip_email"] or "")})<br>
    Date: {esc(m["created_at"])}</p><p>{esc(m["body"])}</p>
    <p><a class="btn" href="/mail/new?to={esc(m["sender_email"] or "")}&subject=Re: {esc(m["subject"])}&body=">Reply</a>
    <a class="btn secondary" href="/mail/new?subject=Fwd: {esc(m["subject"])}&body={esc(m["body"])}">Forward</a>
    <form method="post" action="/mail/{mid}/save" style="display:inline"><button class="secondary">Save</button></form>
    <form method="post" action="/mail/{mid}/delete" style="display:inline"><button class="secondary">Delete</button></form></p>
    <p><a href="/mail">Back to Mail</a></p></div>""")


@app.route("/mail/<int:mid>/save", methods=["POST"])
def mail_save(mid):
    u = current_user()
    if not u:
        return require_login()
    db = get_db()
    if u["id"]:
        db.execute("UPDATE mails SET recipient_folder='saved' WHERE id=? AND recipient_id=?", (mid, u["id"]))
        db.execute("UPDATE mails SET sender_folder='saved' WHERE id=? AND sender_id=?", (mid, u["id"]))
        db.commit()
    flash("Mail saved.")
    return redirect(url_for("mail_list", folder="saved"))


@app.route("/mail/<int:mid>/delete", methods=["POST"])
def mail_delete(mid):
    u = current_user()
    if not u:
        return require_login()
    db = get_db()
    m = db.execute("SELECT * FROM mails WHERE id=?", (mid,)).fetchone()
    if m and (m["sender_id"] == u["id"] or m["recipient_id"] == u["id"]):
        # Soft-delete for this user; remove the row only when both sides deleted it.
        db.execute("UPDATE mails SET recipient_folder='deleted' WHERE id=? AND recipient_id=?", (mid, u["id"]))
        db.execute("UPDATE mails SET sender_folder='deleted' WHERE id=? AND sender_id=?", (mid, u["id"]))
        db.execute("DELETE FROM mails WHERE id=? AND sender_folder='deleted' AND recipient_folder='deleted'", (mid,))
        db.commit()
    flash("Mail deleted.")
    return redirect(url_for("mail_list"))


# ---------------------------------------------------------------------------
# Appointments + Calendar
# ---------------------------------------------------------------------------

@app.route("/appointments")
def appointments():
    u = current_user()
    if not u:
        return require_login()
    sel_date = request.args.get("date", "")
    db = get_db()
    q = "SELECT * FROM appointments WHERE user_id=? "
    args = [u["id"]]
    if sel_date:
        q += "AND appt_date=? "
        args.append(sel_date)
    q += "ORDER BY appt_date, appt_time"
    rows = db.execute(q, args).fetchall()
    rows_html = "".join(
        f'<tr><td>{esc(r["title"])}</td><td>{esc(r["with_user"])}</td>'
        f'<td>{esc(r["appt_date"])} {esc(r["appt_time"])}</td><td>{esc(r["status"])}</td><td class="fc" data-date="{esc(r["appt_date"])}">Loading...</td>'
        f'<td><form method="post" action="/appointments/{r["id"]}/cancel">'
        f'<button class="secondary">Cancel</button></form></td></tr>' for r in rows)
    appt_city = (u["city"] if u and u["city"] else "Lucknow").replace('"', "").replace("'", "")
    _body = f"""<div class="card" id="appt-page" data-city="{appt_city}"><h2>Appointments</h2>
    <form method="get"><label>Calendar — show date</label>
    <input type="date" name="date" value="{esc(sel_date)}">
    <p><button>Show</button> <a class="btn secondary" href="/appointments/new">New appointment</a></p></form>
    <div class="table-wrap"><table><tr><th>Title</th><th>With</th><th>Date &amp; time</th><th>Status</th><th>Forecast</th><th></th></tr>
    {rows_html or '<tr><td colspan="6">No appointments yet.</td></tr>'}</table></div></div>"""
    _body += """<script>
    function wmoLabel2(c){if(c===0)return "Clear sky";if(c===1)return "Mainly clear";if(c===2)return "Partly cloudy";if(c===3)return "Overcast";if(c===45||c===48)return "Foggy";if(c===51||c===53||c===55)return "Drizzle";if(c===61||c===63||c===65)return "Rain";if(c===71||c===73||c===75)return "Snow";if(c===80||c===81||c===82)return "Rain showers";if(c===95)return "Thunderstorm";return "Weather update";}
    (function(){
      var pg=document.getElementById("appt-page");
      var city=pg?pg.getAttribute("data-city"):"Lucknow";
      var cells=document.querySelectorAll("td.fc");
      if(!cells.length)return;
      var dates=[];
      cells.forEach(function(c){if(dates.indexOf(c.getAttribute("data-date"))<0)dates.push(c.getAttribute("data-date"));});
      var today=new Date();today.setHours(0,0,0,0);
      var max=new Date(today);max.setDate(max.getDate()+16);
      fetch("https://geocoding-api.open-meteo.com/v1/search?name="+encodeURIComponent(city)+"&count=1").then(function(r){return r.json();}).then(function(g){
        if(!g.results||!g.results.length)throw new Error("no city");
        var lat=g.results[0].latitude,lon=g.results[0].longitude;
        dates.forEach(function(ds){
          var d=new Date(ds+"T00:00:00");
          if(isNaN(d.getTime())||d<today||d>max){
            cells.forEach(function(c){if(c.getAttribute("data-date")===ds)c.textContent="Forecast within 16 days only";});
            return;
          }
          fetch("https://api.open-meteo.com/v1/forecast?latitude="+lat+"&longitude="+lon+"&daily=temperature_2m_max,temperature_2m_min,weather_code&timezone=auto&start_date="+ds+"&end_date="+ds).then(function(r){return r.json();}).then(function(f){
            if(!f.daily||!f.daily.time||!f.daily.time.length)throw new Error("no forecast");
            var txt=Math.round(f.daily.temperature_2m_min[0])+"°–"+Math.round(f.daily.temperature_2m_max[0])+"°C, "+wmoLabel2(f.daily.weather_code[0]);
            cells.forEach(function(c){if(c.getAttribute("data-date")===ds)c.textContent=txt;});
          }).catch(function(){
            cells.forEach(function(c){if(c.getAttribute("data-date")===ds)c.textContent="Forecast unavailable";});
          });
        });
      }).catch(function(){
        cells.forEach(function(c){c.textContent="Forecast unavailable";});
      });
    })();
    </script>"""
    return page("Appointments", _body)


@app.route("/appointments/new", methods=["GET", "POST"])
def appointment_new():
    u = current_user()
    if not u:
        return require_login()
    if request.method == "POST":
        title = request.form.get("title", "").strip()
        with_user = request.form.get("with_user", "").strip()
        appt_date = request.form.get("appt_date", "")
        appt_time = request.form.get("appt_time", "")
        notes = request.form.get("notes", "")
        if not title or not with_user or not appt_date or not appt_time:
            flash("Title, With, Date and Time are all required.")
        else:
            db = get_db()
            db.execute(
                "INSERT INTO appointments (user_id, title, with_user, appt_date, appt_time, notes)"
                " VALUES (?, ?, ?, ?, ?, ?)", (u["id"], title, with_user, appt_date, appt_time, notes))
            db.commit()
            flash("Appointment created.")
            return redirect(url_for("appointments"))
    return page("New appointment", f"""<div class="card"><h2>New appointment</h2><form method="post">
    {field("Title", "title", required=True)}{field("With (person)", "with_user", required=True)}
    {field("Date", "appt_date", date.today().isoformat(), typ="date", required=True)}
    {field("Time", "appt_time", "11:00", typ="time", required=True)}
    <label>Notes</label><textarea name="notes" rows="4"></textarea>
    <p><button>Create appointment</button></p></form></div>""")


@app.route("/appointments/<int:aid>/cancel", methods=["POST"])
def appointment_cancel(aid):
    u = current_user()
    if not u:
        return require_login()
    db = get_db()
    db.execute("UPDATE appointments SET status='Cancelled' WHERE id=? AND user_id=?", (aid, u["id"]))
    db.commit()
    flash("Appointment cancelled.")
    return redirect(url_for("appointments"))


# ---------------------------------------------------------------------------
# Chat (text only)
# ---------------------------------------------------------------------------

@app.route("/chat", methods=["GET", "POST"])
def chat_list():
    u = current_user()
    if not u:
        return require_login()
    db = get_db()
    if request.method == "POST":
        name = request.form.get("name", "").strip()
        if name:
            try:
                db.execute("INSERT INTO chat_rooms (name, created_by) VALUES (?, ?)", (name, u["id"]))
                db.commit()
                flash("Chat room created.")
            except sqlite3.IntegrityError:
                flash("A room with that name already exists.")
        return redirect(url_for("chat_list"))
    rooms = db.execute("SELECT * FROM chat_rooms ORDER BY name").fetchall()
    cards = "".join(
        f'<div class="card"><h3>{esc(r["name"])}</h3>'
        f'<p><a class="btn" href="/chat/{r["id"]}">Join chat</a></p></div>' for r in rooms)
    return page("Chat rooms", f"""<div class="card"><h2>Chat rooms</h2>
    <p class="muted">Text chat only — these rooms do not start a video call.</p>
    <form method="post">{field("New room name", "name", required=True)}
    <p><button>Create room</button></p></form></div>
    <div class="grid">{cards or "<p>No rooms yet.</p>"}</div>""")


@app.route("/chat/<int:rid>", methods=["GET", "POST"])
def chat_room(rid):
    u = current_user()
    if not u:
        return require_login()
    db = get_db()
    room = db.execute("SELECT * FROM chat_rooms WHERE id=?", (rid,)).fetchone()
    if not room:
        flash("Room not found.")
        return redirect(url_for("chat_list"))
    if request.method == "POST":
        body = request.form.get("body", "").strip()
        if body:
            db.execute("INSERT INTO chat_messages (room_id, user_id, body) VALUES (?, ?, ?)",
                       (rid, u["id"], body))
            db.commit()
        return redirect(url_for("chat_room", rid=rid))
    msgs = db.execute(
        "SELECT m.*, us.name AS user_name FROM chat_messages m JOIN users us ON us.id=m.user_id"
        " WHERE m.room_id=? ORDER BY m.id", (rid,)).fetchall()
    msgs_html = "".join(
        f"<div class=\"msg{' mine' if m['user_id']==u['id'] else ''}\"><b>{esc(m['user_name'])}</b> <span class=\"muted\">{esc(m['created_at'])}</span><br>"
        f'{esc(m["body"])}</div>' for m in msgs)
    return page(f"Chat — {room['name']}", f"""<div class="card"><h2>{esc(room["name"])}</h2>
    <p class="muted">Text chat only — not a video meeting.</p>
    <div class="chatlog">{msgs_html or "<p>No messages yet. Say hello!</p>"}</div>
    <form method="post"><label>Message</label>
    <input type="text" name="body" required>
    <p><button>Send message</button> <a class="btn secondary" href="/chat">All rooms</a></p></form></div>""")


# ---------------------------------------------------------------------------
# Masters + Admin + Feedback
# ---------------------------------------------------------------------------

@app.route("/masters", methods=["GET", "POST"])
def masters():
    err = require_admin()
    if err:
        return err
    db = get_db()
    if request.method == "POST":
        kind = request.form.get("kind", "")
        name = request.form.get("name", "").strip()
        if kind in MASTER_KINDS and name:
            try:
                db.execute("INSERT INTO masters (kind, name) VALUES (?, ?)", (kind, name))
                db.commit()
                flash("Master added.")
            except sqlite3.IntegrityError:
                flash("That master already exists.")
        return redirect(url_for("masters"))
    rows = db.execute("SELECT * FROM masters ORDER BY kind, name").fetchall()
    opts = "".join(f'<option value="{k}">{k.title()}</option>' for k in MASTER_KINDS)
    rows_html = "".join(
        f'<tr><td>{esc(r["kind"])}</td><td>{esc(r["name"])}</td>'
        f'<td><form method="post" action="/masters/{r["id"]}/delete">'
        f'<button class="secondary">Delete</button></form></td></tr>' for r in rows)
    return page("Masters", f"""<div class="card"><h2>Masters (admin only)</h2>
    <form method="post"><label>Kind</label><select name="kind">{opts}</select>
    {field("Name", "name", required=True)}<p><button>Add master</button></p></form>
    <div class="table-wrap"><table><tr><th>Kind</th><th>Name</th><th></th></tr>
    {rows_html or '<tr><td colspan="3">No masters yet.</td></tr>'}</table></div></div>""")


@app.route("/masters/<int:mid>/delete", methods=["POST"])
def master_delete(mid):
    err = require_admin()
    if err:
        return err
    db = get_db()
    db.execute("DELETE FROM masters WHERE id=?", (mid,))
    db.commit()
    flash("Master deleted.")
    return redirect(url_for("masters"))


@app.route("/admin")
def admin():
    err = require_admin()
    if err:
        return err
    db = get_db()
    users = db.execute("SELECT * FROM users ORDER BY id").fetchall()
    fb = db.execute("SELECT f.*, u.name AS user_name FROM feedback f"
                    " LEFT JOIN users u ON u.id=f.user_id ORDER BY f.id DESC").fetchall()
    hist = db.execute(
        "SELECT h.*, u.name AS user_name FROM login_history h JOIN users u ON u.id=h.user_id"
        " ORDER BY h.id DESC LIMIT 50").fetchall()
    users_html = "".join(
        f'<tr><td>{r["id"]}</td><td>{esc(r["name"])}</td><td>{esc(r["email"])}</td>'
        f'<td>{esc(r["role"])}</td><td>{esc(r["city"])}</td></tr>' for r in users)
    fb_html = "".join(
        f'<tr><td>{esc(r["user_name"] or r["name"])}</td><td>{esc(r["message"])}</td>'
        f'<td>{esc(r["created_at"])}</td></tr>' for r in fb)
    hist_html = "".join(
        f'<tr><td>{esc(r["user_name"])}</td><td>{esc(r["login_at"])}</td>'
        f'<td>{esc(r["ip"])}</td></tr>' for r in hist)
    return page("Admin", f"""<div class="card"><h2>Admin — Users</h2>
    <div class="table-wrap"><table><tr><th>ID</th><th>Name</th><th>Email</th><th>Role</th><th>City</th></tr>
    {users_html}</table></div></div>
    <div class="card"><h2>Admin — Feedback</h2>
    <div class="table-wrap"><table><tr><th>From</th><th>Message</th><th>Date</th></tr>
    {fb_html or '<tr><td colspan="3">No feedback yet.</td></tr>'}</table></div></div>
    <div class="card"><h2>Admin — Login history</h2>
    <div class="table-wrap"><table><tr><th>User</th><th>Login at</th><th>IP</th></tr>
    {hist_html or '<tr><td colspan="3">No logins yet.</td></tr>'}</table></div></div>""")


@app.route("/feedback", methods=["GET", "POST"])
def feedback():
    u = current_user()
    if request.method == "POST":
        name = request.form.get("name", "").strip() or (u["name"] if u else "Guest")
        message = request.form.get("message", "").strip()
        if message:
            db = get_db()
            db.execute("INSERT INTO feedback (user_id, name, message) VALUES (?, ?, ?)",
                       (u["id"] if u else None, name, message))
            db.commit()
            flash("Thanks! Your feedback was saved.")
            return redirect(url_for("feedback"))
        flash("Please write a message.")
    return page("Feedback", f"""<div class="card"><h2>Feedback</h2><form method="post">
    {field("Your name", "name", u["name"] if u else "")}
    <label>Message</label><textarea name="message" rows="5" required></textarea>
    <p><button>Send feedback</button></p></form></div>""")


if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000, debug=False)
