@echo off
REM Apply Claude Code Settings
REM This script copies all Claude Code settings to the user's .claude directory

setlocal

echo ================================================
echo  Claude Code Settings Installation
echo ================================================
echo.

REM Define the target directory
set "CLAUDE_DIR=%USERPROFILE%\.claude"

echo Target directory: %CLAUDE_DIR%
echo.

REM Check if .claude directory exists, create if needed
if not exist "%CLAUDE_DIR%" (
    echo Creating .claude directory...
    mkdir "%CLAUDE_DIR%"
    if errorlevel 1 (
        echo ERROR: Failed to create .claude directory
        pause
        exit /b 1
    )
)

REM Copy all files and directories
echo Copying all settings to %CLAUDE_DIR%...
echo.

xcopy /E /Y /I "agents" "%CLAUDE_DIR%\agents\"
xcopy /E /Y /I "commands" "%CLAUDE_DIR%\commands\"
copy /Y "statusline.ps1" "%CLAUDE_DIR%\statusline.ps1" >nul

if errorlevel 1 (
    echo ERROR: Some files failed to copy
    pause
    exit /b 1
)

echo.
echo ================================================
echo  Installation Complete!
echo ================================================
echo.
echo All Claude Code settings have been copied to:
echo %CLAUDE_DIR%
echo.
echo Please restart Claude Code for changes to take effect.
echo.
pause
