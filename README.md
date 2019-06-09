# GitHub Release Mirror
Many packages download prebuilt binaries from their GitHub Release. That has some disadvantages:
 * No reproducible builds. If the project is removed from GitHub, the prebuilt binaries are gone.
 * Required internet connection. If you can't access the internet or GitHub is down, you can't download binaries from there.
 * Fast internet connection. Downloading from GitHub is always slower than downloading from a server in your local network.
 
Especially in an enterprise environment, it's not always the best solution to depend on external servers. On the other hand, you don't want to recompile every external library on every build. 
 
This project is a simple mirror, that downloads and keeps releases of GitHub Projects on your own server.
 
## Installation

The easiest way is, to use docker, but you can also use the [mirror.sh](mirror.sh) script manually.
Recurring updates are run by cron, where every mirrored project has it's own cronjob, so you should overwrite this project's crontab with your own, in order to manage your mirrored projects.
 1. Create a crontab with a cronjob for each project. (E.g. mirroring node-sass and electron releases)
  ```bash
  0 3 * * * /opt/mirror.sh sass/node-sass
  0 4 * * * /opt/mirror.sh electron/electron.
  ```
  2. Create a folder, where the downloaded release can be stored permanently.
  3. Run docker:
  ```bash
  docker run \ 
    -p 80:80 \
    -v /path/to/your/crontab:/etc/cron.d/mirror-cron \
    -v /path/to/your/storage/folder:/mirror
    --name github-release-mirror \
    richardklose/github-release-mirror
  ```
  4. Use it, e.g. in `.npmrc` for node-sass and electron:
  ```bash
  sass_binary_site=http://<ip-of-your-server>/sass/node-sass
  electron_mirror=http://<ip-of-your-server>/electron/electron/v
  ```
  You can also browse the downloaded files by opening your servers IP in a browser.
