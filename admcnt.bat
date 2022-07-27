@echo off
cls
title Admin Center 0.20.1 Release Candidate 1
color 3f
echo Loading Admin Center...
echo Loading Admin Center...
pause
timeout 3
cls

:ml
cls
set "prompt="
set /p "prompt=Command: "
if "%prompt%" == "cmd" goto cmd
if "%prompt%" == "whoami" goto whoami
if "%prompt%" == "start" goto run
if "%prompt%" == "run" goto commandbeingrem
if "%prompt%" == "logout" goto logout
if "%prompt%" == "shutdown" goto shutdown
if "%prompt%" == "restart" goto restart
if "%prompt%" == "exit" goto exit
if "%prompt%" == "call" goto call
if "%prompt%" == "help" goto help
if "%prompt%" == "sysinfo" goto systeminfo
if "%prompt%" == "cmdc" goto cmdc
if "%prompt%" == "calc" goto calc
if "%prompt%" == "calculator" goto calc
if "%prompt%" == "ping" goto ping
if "%prompt%" == "ver" goto ver
goto ml

:cmd
start cmd.exe
goto ml

:logout
logoff
goto logout

:shutdown
shutdown -s -t 0
goto shutdown

:restart
shutdown -r -t 0
goto restart

:exit
cls
exit
goto exit

:run
goto securityunav
echo What do you want to run?
set /p "wtr=Program: "
if "%command%" == "taskkill /f /im svchost.exe" goto invalidcommand
if "%command%" == "powershell wininit" goto invalidcommand
start %wtr%
goto ml

:call
goto securityunav
echo What do you want to call?
set /p "wtr=Program: "
cls
if "%command%" == "taskkill /f /im svchost.exe" goto invalidcommand
if "%command%" == "powershell wininit" goto invalidcommand
call %wtr%
goto ml

:whoami
whoami
pause > nul
goto ml

:systeminfo
echo Scanning System Info...
systeminfo
pause
goto ml

:help
echo.
echo Version: 0.20.1 Release Candidate 1/snapshot
echo.
echo System Info and Running Apps commands
echo.
echo cmd - Opens Command Prompt.
echo whoami - Writes the current PC name and current username.
echo start - Starts a program. (Unavailable due to security updates)
echo run - Starts a program. (Unavailable due to security updates)
echo call - Calls a program. (If it isn't a batch file, it waits until the program closes) (Unavailable due to security updates)
echo sysinfo - Gives you system information.
echo ver - Displays Windows and App Version
echo.
echo.
echo Shutting down, Logging Out and exiting program commands
echo.
echo logout - Signs out user.
echo shutdown - Shuts down PC.
echo restart - Restarts PC.
echo exit - Exits from the program.
echo.
echo Native Support for Command Prompt using the cmdc command
echo Calculate Values using the calc or calculator command
echo.
pause > nul
echo Changelog:
echo Modified the ping command and removed the slowping command
pause > nul
goto ml

:cmdc
goto securityunav
cls
echo Run a Native CMD Command
set /p "command=Type a command: "
if "%command%" == "taskkill /f /im svchost.exe" goto invalidcommand
if "%command%" == "powershell wininit" goto invalidcommand
cmd /c %command%
goto ml

:calc
set /p "eq=Equation: "
set /a "result=%eq%"
echo.
echo %eq% = %result%
pause > nul
goto ml

:ping
ping localhost
echo Pong!
pause > nul
goto ml

:ver
cls
echo Windows Version:
ver
echo.
echo Admin Center Version:
echo.
echo 0.20.1 Release Candidate 1
pause > nul
goto ml

:invalidcommand
cls
echo The command you just wrote is not a valid command!
pause > nul
goto ml

:securityunav
cls
echo This command is temporarily unavailable due to security.
echo The official patch will be out by 0.20.2.
pause > nul
goto ml

:commandbeingrem
cls
echo This command will be non-usable in the Next Release Candidate/Release. Please remove this command from your scripts
pause > nul
goto ml