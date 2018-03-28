Scripts to automate!

Torrent CLI script:

Script to download torrents over jenkins

Requirements:

1) Transmission CLI
2) Link of torrent / magnet link
3) Built for jenkins, might require some modification if you don't use it

Usage:

1) -ep is for Encryption Preffered, it'll use encryption when the other peer does and not when the other one doesn't you may change it to -er for encryption required; it won't use peers which don't support encryption

2) -w is the (where to download) download directory leave it as-if preferably

3) -b is the blocklist of bad peers, it's required everytime cuz the list might change and because transmission won't use it without specifying

4) You may limit upload script by -u option (in KBPS)

5) You'll need to stop the job once your download has finished else it'll keep acting like a seeder (if you want to do that, leave the job on)

6) Once downloaded, refer to your download with the job build number

7) Jenkins must have rights to make DIRs and Files whereever you put this script (unless you change Working directory in script)

8) Specify string 'link' in job parameters, it takes torrent link and magnet links 
