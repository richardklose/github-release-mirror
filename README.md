<h1 align="center">Welcome to github-release-mirror 👋</h1>
<p>
  <img src="https://img.shields.io/badge/version-0.0.1-blue.svg?cacheSeconds=2592000" />
  <a href="https://github.com/richardklose/github-release-mirror/blob/master/LICENSE">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg" target="_blank" />
  </a>
  <a href="https://cloud.docker.com/repository/docker/richardklose/github-release-mirror">
    <img alt="Docker: richardklose/github-release-mirror" src="https://img.shields.io/docker/cloud/build/richardklose/github-release-mirror.svg" target="_blank" />
  </a>
  <a href="https://twitter.com/richard_klose">
    <img alt="Twitter: richard_klose" src="https://img.shields.io/twitter/follow/richard_klose.svg?style=social" target="_blank" />
  </a>
</p>

> Mirroring releases of GitHub projects made easy

### 🏠 [Homepage](https://github.com/richardklose/github-release-mirror)

Many packages download prebuilt binaries from their GitHub Release. That has some disadvantages:
 * No reproducible builds. If the project is removed from GitHub, the prebuilt binaries are gone.
 * Required internet connection. If you can't access the internet or GitHub is down, you can't download binaries from there.
 * Fast internet connection. Downloading from GitHub is always slower than downloading from a server in your local network.

Especially in an enterprise environment, it's not always the best solution to depend on external servers. On the other hand, you don't want to recompil$

This project is a simple mirror, that downloads and keeps releases of GitHub Projects on your own server.

## Install

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

## Usage

Use it, e.g. in `.npmrc` for node-sass and electron:
  ```bash
  sass_binary_site=http://<ip-of-your-server>/sass/node-sass
  electron_mirror=http://<ip-of-your-server>/electron/electron/v
  ```
  You can also browse the downloaded files by opening your servers IP in a browser.

## Author

👤 **Richard Klose &lt;richard@klose.dev&gt;**

* Twitter: [@richard_klose](https://twitter.com/richard_klose)
* Github: [@richardklose](https://github.com/richardklose)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/richardklose/github-release-mirror/issues).

## Show your support

Give a ⭐️ if this project helped you!

## 📝 License

Copyright © 2019 [Richard Klose &lt;richard@klose.dev&gt;](https://github.com/richardklose).<br />
This project is [MIT](https://github.com/richardklose/github-release-mirror/blob/master/LICENSE) licensed.

## Support on Beerpay
Hey dude! Help me out for a couple of :beers:!

[![Beerpay](https://beerpay.io/richardklose/github-release-mirror/badge.svg?style=beer-square)](https://beerpay.io/richardklose/github-release-mirror)  [![Beerpay](https://beerpay.io/richardklose/github-release-mirror/make-wish.svg?style=flat-square)](https://beerpay.io/richardklose/github-release-mirror?focus=wish)