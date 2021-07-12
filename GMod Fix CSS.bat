@echo off
@if exist "%cd%\CSS.zip" (goto 2step) else (goto get)

:get
@cd wget
@cd bin
@echo Downloading CSS Textures for GMod
@echo.
@curl --output CSS.zip https://codeload.github.com/bouletmarc/css_content/zip/refs/heads/master
@move CSS.zip %~dp0
goto 2step 

:2step
@if exist "%~dp0\css-content-gmodcontent" (goto is1) else (goto extract)

:extract
@echo Extracting files:
@echo.
powershell -command "Expand-Archive %~dp0\CSS.zip %~dp0\"
goto is1

:is1
@if exist "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod" (goto isa1) else (goto is2)

:isa1
@cd C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\addons\
@md CSS_Game_Content
@xcopy /s /i "%~dp0\css_content-master" "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\addons\CSS_Game_Content"
goto end

:is2 
@if exist "D:\SteamLibrary\steamapps\common\GarrysMod" (goto isa2) else (goto ism)

:isa2
@cd D:\SteamLibrary\steamapps\common\GarrysMod\garrysmod\addons\
@md CSS_Game_Content
@xcopy /s /i %~dp0\css_content-master D:\SteamLibrary\steamapps\common\GarrysMod\garrysmod\addons\CSS_Game_Content
goto end

:ism
SET /P folderName=Please enter the directory where Garry's Mod is located (X:\SteamLibrary\steamapps\common\GarrysMod\):
@if exist "%folderName%" (goto isam) else (goto ism)

:isam
@cd %folderName%\garrysmod\addons%
@md CSS_Game_Content
@xcopy /s /i %~dp0\css_content-master %folderName%\garrysmod\addons\CSS_Game_Content\%
goto end

:end
echo Install Successful.
pause
exit