# Live Meeting — Cross-Platform Web Version

A Python + Flask + SQLite remake of the original ASP.NET Web Forms + SQL
Server project, so it runs on Windows, macOS and Linux with the same code.
SQLite replaces SQL Server; the browser replaces Web Forms.

## Run

```bash
# macOS / Linux
bash run_mac_linux.sh
# or: python3 app.py

# Windows
run_windows.bat
# or: py app.py
```

Then open http://127.0.0.1:5000 in a browser.

## Features

- Sign up / log in / log out, profile edit, change password
  (passwords are hashed with Werkzeug; signup needs 8+ characters with
  uppercase, lowercase and a digit)
- Admin masters: Country, State, City, Industry, Income, Interest,
  Occupation — add / delete (admin only)
- Admin views: all users, feedback, login history (login time is recorded
  on every successful login)
- Internal mail: Compose, Inbox, Sent, Draft, Saved, Reply, Forward, Delete.
  This is mail inside the app only — it does not send real email.
- Appointments: create / list / cancel, plus a calendar view by date
- Text chat rooms: create / join a room, post messages.
  **Text chat only — this is not video calling, and the site never claims
  otherwise.**
- Feedback form (admin sees all feedback on the Admin page)

## Demo accounts (demo only)

| Role  | Email                  | Password |
|-------|------------------------|----------|
| Admin | admin@livemeeting.demo | Admin123 |
| User  | priya@demo.local       | Demo1234 |
| User  | rahul@demo.local       | Demo1234 |

Seed data is demo data only. Existing databases gain new seed rows on
restart via `INSERT OR IGNORE`; new columns are added with PRAGMA guards,
so an old database does not need to be deleted.

## Original project

The original ASP.NET + SQL Server code is in the repo root (text files
only). Its SQL Server connection string password was replaced with the
placeholder `YOUR_SQLSERVER_PASSWORD` before any public copy — never put
a real database password in code. Binary originals (.mdf, .ldf, .bak,
.msi, .dll, .doc, .ppt, images) are not in this folder; they need the
GitHub web UI if they are to be uploaded at all.
