# Fedora xulrunner 1.9.2 build script #
This is completely untested and made up from what
I took from my bash history, so it may melt your machine.
This was made to address the issue of Aptana and Eclipse using this
antiquated version of xulrunner and Fedora 16 no longer having RPMs for it.
This will allow you to do commits/team operations in Aptana using git.
 
## Install ##
`./go_baby_go.sh` 
 This will output a directory name "fedora-xulrunner-192" in the repo root.
Copy this directory to your Aptana root and add the following to your "AptanaStudio3.ini"
`-Dorg.eclipse.swt.browser.XULRunnerPath=YOUR_FULL_PATH/fedora-xulrunner-192` 
 Be sure to change the "YOUR_FULL_PATH" part.
 
#### Credits ####
Firefox source and patches are taken from https://aur.archlinux.org/packages.php?ID=53282
and are under their own respective licenses. The script go_baby_go.sh 
is licensed under the MIT BSD license.
