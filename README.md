# AIO DockerPlex
Almost-out of the box Plex Media Server with a torrent UI client and an UI to manage your media files. As they are deployed as web services, they are fully <br>
### AriaNg's web UI
<img src="images/AriaNg.png"  width="700"/>

### File Browser
<img src="images/FileBrowser.png"  width="700"/>

### Plex Media Server
<img src="images/PlexMediaServer.png"  width="700"/>

# Index
1. [Acknowledgement](#ack)
2. [Too Long; Didn't Read](#tldr)

<a name="ack"></a>

## Aknowledgments
### [Aria2c](https://aria2.github.io/)
Backend tool to download the torrent files
### [AriaNg](https://github.com/mayswind/AriaNg)
Web UI to manage your torrent downloads.<br>
Deployed at localhost:6880
### [File Browser](https://filebrowser.org/)
Manage your downloaded files through a web interface.<br>
Deployed at localhost:8081
### [Jaymoulin's Plex Docker image](https://hub.docker.com/r/jaymoulin/plex/)
Deploy your Plex Media Server locally. Hardcoded to Plex version 1.30.1.6562. <br>
Visit Jaymoulin's DockerHub page or remote the version tag from the [docker-compose](./docker-compose.yml) file to select the latest release.

<a name="tldr"></a>

## TLDR

1. Install [Docker](https://docs.docker.com/get-docker/) until you can execute their example.
2. Configure your RCP password two places. They both need to be the same:
   1.  [docker-compose's](./docker-compose.yml) -> *RPC_SECRET* in line 11.
   2.  [aria2.conf](./aria2-config/aria2.conf) -> *rpc-secret* in line 332.
3. Execute `docker compose up -d` to get everything started.
4. Visit `localhost:6880` to visit your AriaNg web UI and manage your downloads.
   1. Visit settings>ariang and fill `Aria2 RPC Secret Token` with the RPC password that you choose in step 2.
   2. Reload the page clicking in the button.
5. Visit `localhost:8081`. The default user and password are `admin:admin`
6. Optional: I've included [cleaner-py](./cleaner.py) wich can be configured as a cron job or as a FileBrowser task.