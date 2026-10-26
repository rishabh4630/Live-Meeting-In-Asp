# Live Meeting in ASP

A collaboration app originally built with **ASP.NET Web Forms (C#) +
SQL Server**: user accounts, internal mail, appointments with a calendar
view, admin masters, feedback, login history, and live text chat rooms.

> **Honest note:** "Live Meeting" here means live **text chat** rooms plus
> appointments and mail. It is **not** video calling (no Zoom/Meet-style
> video), and neither the original nor the web version claims otherwise.

## What is in this repo

| Folder / file | Contents |
|---|---|
| `Code-LiveMeeting/` | Original ASP.NET Web Forms code (53 aspx pages, 88 cs files, masters, user controls) |
| `Database-ClientServerLiveMeeting/` | `SqlScript.sql` (SQL Server script, UTF-16). The `.mdf` / `.ldf` / `.bak` database files are **not** in this text copy — they are binary and need the GitHub web UI to upload. |
| `Doc-Live Meeting/` | Original documentation (SRS, UML, ER diagram, DFD, Abstract, presentations). Binary docs (`.doc` / `.ppt`) are **not** in this text copy. |
| `cross_platform_web/` | Python + Flask + SQLite web version (see below) |
| `Web.config` | Root config (no connection secret in it) |

## Security note

The original `Code-LiveMeeting/Web.config` contained a SQL Server
connection string with a real user id and password. In this copy the
whole connection-string value was replaced with the placeholder
`YOUR_SQLSERVER_PASSWORD`. **Never put a real database password in code
or in chat.** The original password is not recorded anywhere in this repo.

## Cross-platform web version

The original is Windows-only (needs .NET Framework + SQL Server). The
web version in `cross_platform_web/` runs on Windows, macOS and Linux:

```bash
# macOS / Linux
bash cross_platform_web/run_mac_linux.sh
# or: cd cross_platform_web && python3 app.py

# Windows
cross_platform_web\run_windows.bat
# or: cd cross_platform_web && py app.py
```

Then open http://127.0.0.1:5000

Features: signup/login (hashed passwords), profile edit + change
password, admin masters (Country, State, City, Industry, Income,
Interest, Occupation), admin users / feedback / login-history views,
internal mail (Inbox, Sent, Draft, Saved, Reply, Forward, Delete),
appointments + calendar by date, and text chat rooms.

Demo accounts (demo only):

| Role  | Email                  | Password |
|-------|------------------------|----------|
| Admin | admin@livemeeting.demo | Admin123 |
| User  | priya@demo.local       | Demo1234 |
| User  | rahul@demo.local       | Demo1234 |

Full instructions: [`cross_platform_web/README.md`](cross_platform_web/README.md)

## Live demo (static, browser only)

Demo link (placeholder — **not live yet**, it goes live when the
`gh-pages` branch is published):

https://rishabh4630.github.io/Live-Meeting-In-Asp/

The static demo mirrors the Flask app in the browser: signup/login,
mail, appointments, chat rooms, masters and admin views, with data
stored only in that browser's localStorage. A demo note on the site
states this. No real email is sent and no video call is started.

## Original stack vs web stack

| | Original | Web version |
|---|---|---|
| Language | C# (ASP.NET Web Forms) | Python (Flask) |
| Database | SQL Server | SQLite |
| UI | Web Forms pages | Browser HTML/CSS/JS |
| Chat | ChatEngine / ChatRoom (in-memory) | SQLite chat rooms (Flask) / localStorage (demo) |
| Mail | Internal mail tables | Internal mail tables (no real SMTP) |

## Left out on purpose

- **Real video calling** — the original has no video engine; adding one
  would need WebRTC + a signalling server, which is out of scope for a
  faithful remake and is not claimed anywhere.
- **Real email delivery** — mail stays inside the app, as in the original
  design; no SMTP credentials are used.
- **Binary originals** (.mdf, .ldf, .bak, .msi, .dll, .doc, .ppt,
  images) — excluded from the text copy; see the binary list in the
  build report for web-UI upload if wanted.
