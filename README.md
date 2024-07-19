# CrowdStrikeFixer
A Linux ISO that attemps delete the Crowd Strike faulty driver file

First off, i've never used CrowdStrike so idk which areas its used in, so this ISO may not be appropriate for this problem.

Requirements:
Access to the bootloader

    A USB drive

How it works:

-It normally loads the system then starts a script.

-Scripts mounts every partition available.

-Searches for Windows\System32\drivers\CrowdStrike\C-00000291*.sys in every partition and if founds it deletes it. (if the file starts with C-00000291 and ends with .sys it will delete it)

-Unmounts everything.

-Shutdowns the computer.

That's basicly it. It sadly has no output on the screen (i made this midnight maybe will fix tomorrow) so it will look like it's loading then immediatelyshutting down.

Script seems to work in file deleting aspect but idk if it will fix the problem

Here is the link to the repo: GitHub It runs the fixer.sh script (/etc/systemd/system/delete_crowdstrike.sh in the iso) 


Donation:
https://www.buymeacoffee.com/semihaslan
