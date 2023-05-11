# AIO DockerPlex
Almost-out of the box Plex Media Server with a torrent UI client and an UI to manage your media files. As they are deployed as web services, you dont need to use any coomand besides `docker compose up` once you finish with the [tl:dr](#TLDR) section. <br>
If a video file is not supported by either Plex or the RPi, you can transcode it into a valid format using Jaymolin's [RPi plex video converter](https://github.com/jaymoulin/docker-rpi-plex-video-converter). For it, first clone the Docker image with <br>
```
docker pull ghcr.io/jaymoulin/rpi-plex-video-converter
```
Then run the image with
```
docker run --rm -t -v /path/to/your/media/folder:/media jaymoulin/rpi-plex-video-converter
```
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
Backend tool to download the torrent files. Transparent for the user.
### [AriaNg](https://github.com/mayswind/AriaNg)
Web UI to manage your torrent downloads.<br>
### [File Browser](https://filebrowser.org/)
Manage your downloaded files through a web interface.<br>
### [Jaymoulin's Plex Docker image](https://hub.docker.com/r/jaymoulin/plex/)
Deploy your Plex Media Server locally. <br>
Visit Jaymoulin's DockerHub page [docker-compose](./docker-compose.yml) to select any specific release.<br>

## TLDR

1. Install [Docker](https://docs.docker.com/get-docker/) until you can execute their example.
2. Configure your RCP password in two places. They both need to be the same:<sup>[1](#myfootnote1)</sup>
   1.  [docker-compose](./docker-compose.yml) -> *RPC_SECRET* in line 11.
   2.  [aria2.conf](./aria2-config/aria2.conf) -> *rpc-secret* in line 332.
3. Under the [filebrowser folder](./filebrowser/), create a file called `filebrowser.db`
4. Execute `docker compose up -d` to get everything started.
5. Visit `localhost:6880` to check your AriaNg web UI and manage your downloads.
   1. Visit settings>ariang and fill `Aria2 RPC Secret Token` with the RPC password that you choose in step 2.
   2. Reload the page clicking in the button.
6. Visit `localhost:8081`. The default user and password are `admin:admin`
7. Optional: I've included [cleaner-py](./cleaner.py) wich can be configured as a cron job or as a FileBrowser task.
8. 

Your local endpoints for each services have been deployed in the following ports:
- AriaNg: Deployed at localhost:6880
- File Browser: Deployed at localhost:8081
- Plex Media Server: Deployed at localhost:32400
<br>

Disclaimer: All endpoints are available from your phone (and any machine in your local network), but you need to substitute `localhost` with the IP of the machine running the Docker containers. <br>
For example, if the IP of the machine running the containers is 1111.111.1.1 then you would need to go to 1111.111.1.1:6880 to access the AriaNg portal, and once there you would need to configure the AriaNg session with your RPC password from the new device. <br>

Follow the [official documentation](https://support.plex.tv/articles/200264746-quick-start-step-by-step-guides/) for configuring your Plex Media Server.

_________________________________

<a name="myfootnote1">1</a>: In my example, the values in both places are *RPC_PLACEHOLDER* so it would technycally work without needing to change anything, but in order for [Aria2c](#aria2c) and [AriaNg](#ariang) to work, you must know that this is the value that you must provide when first entering AriaNg site, under `AriaNg Settings > RCP > Aria2 RPC Secret Toekn`.
