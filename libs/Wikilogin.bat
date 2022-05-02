@if (@CodeSection == @Batch) @then


@echo off
set SendKeys=CScript //nologo //E:JScript "%~F0"
rem Use %SendKeys% to send keys to the keyboard buffer
rem set SendKeys=CScript //nologo //E:JScript "%~F0"
rem START CHROME "https://login.classy.org/"
rem the script only works if the application in question is the active window. Set a 
rem timer to wait for it to load!
"C:\Program Files\Internet Explorer\iexplore.exe" http://linwiki-uschall10.srx.bsh.de/mediawiki/index.php/Hauptseite
timeout /t 10
rem use the tab key to move the cursor to the login and password inputs. Most htmls 
rem interact nicely with the tab key being pressed to access quick links.
rem %SendKeys% "{TAB}"
rem now you can have it send the actual username/password to input box
%SendKeys% "Kennwort2"
%SendKeys% "{ENTER}"
timeout /t 3
%SendKeys% "{TAB}"
%SendKeys% "{TAB}"
%SendKeys% "{TAB}"
%SendKeys% "http://linwiki-uschall10.srx.bsh.de/mediawiki/index.php/Quality_Checks"
%SendKeys% "{ENTER}"

goto :EOF

@end
// JScript section

var WshShell = WScript.CreateObject("WScript.Shell");
WshShell.SendKeys(WScript.Arguments(0));