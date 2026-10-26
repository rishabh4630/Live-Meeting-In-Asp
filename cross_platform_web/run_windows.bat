@echo off
REM Live Meeting (web version) - Windows launcher
cd /d "%~dp0"
py -m pip install -q -r requirements.txt
py app.py
