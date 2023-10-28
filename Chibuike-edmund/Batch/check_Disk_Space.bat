@echo off
for /f "usebackq tokens=2 delims=," %%I in (`dir ^| find "Bytes free"`) do set free_space=%%I
echo Free Space: %free_space%
