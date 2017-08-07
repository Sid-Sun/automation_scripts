Scripts to ease Android building, SFTP etc by automation.

Requirements:
(1) Knowing what you're doing.
(2) Not being a retard.
(3) Not being a Kanger.

How to use build_sftp:
-> Script to build and upload the output zip via SFTP

Modifications that MAYBE needed:

(1) Setting the correct ccache dir in line #5
(2) Setting the ccache limit, preset to 70GB line #6
(3) Setting the desired output (out) dir line #9
(4) Setting the desired KBUILD USER && HOST line #12 & #13 respectively
(5) Setting the number of threads your processor can handle. line #16 #24 && #25
(6) Setting the correct lunch patter aosp_$device-userdebug; line #23
(7) Setting the correct SFTP variable from line #29 -> #32; #31 & #32 maybr fine left unchanged
(8) Generating SSH key & adding it to your SFTP server. Password automation isn't possible over CLI (or I don't know it, AFAIK, it's possible only on FTP)