CentOS 4.8
==========

* CentOS 4.8のpackerがあまり見つからなかったのでいっその事作った。
* iso_download.sh に書いているISOは公式のミラーです。

```bash:
sh iso_download.sh
packer build CentOS-4.8-i386.json
packer build CentOS-4.8-x86_64.json
```

* vagrant up した時に以下エラーが出ますが、CentOS4で入っているsshのバージョンが古いのが原因だと思います。

```bash:
sudo: Illegal option -E
usage: sudo -V | -h | -L | -l | -v | -k | -K | [-H] [-P] [-S] [-b] [-p prompt]
            [-u username/#uid] [-r role] [-t type] -s | <command>
```
