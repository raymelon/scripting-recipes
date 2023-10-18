@echo off
ping google.com -n 1 >nul
if errorlevel 1 (
    echo No internet connection.
) else (
    echo Internet connection is active.
)
