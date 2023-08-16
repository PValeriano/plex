source ./.env
#SERVICE_HOME=~/Escritorio/plex_8k

#Creación de carpetas
#Media root
if [ -d $SERVICE_HOME ] ; then
    echo "$SERVICE_HOME exists."
else
    echo "Creando $SERVICE_HOME"
    mkdir -p $SERVICE_HOME
fi

#SERVICIOS
#Filebrowser
if [ -d $FILEBROWSER ] ; then
    echo "$FILEBROWSER exists."
    if [! -e $FILEBROWSER/filebrowser.db ] ; then
        echo "Creando filebrowser.db"
        touch $FILEBROWSER/filebrowser.db
    fi
else
    echo "Creando $FILEBROWSER y filebrowser.db"
    mkdir -p $FILEBROWSER
    touch $FILEBROWSER/filebrowser.db
fi

#Sonarr
if [ -d $SONARR ] ; then
    echo "$SONARR exists."
else
    echo "Creando $SONARR"
    mkdir -p $SONARR
fi

#Jackett
if [ -d $JACKETT ] ; then
    echo "$JACKETT exists."
else
    echo "Creando $JACKETT"
    mkdir -p $JACKETT
fi

#Plex
if [ -d $PLEX ] ; then
    echo "$PLEX exists."
else
    echo "Creando $PLEX"
    mkdir -p $PLEX
fi

#Jellyfin
if [ -d $JELLYFIN ] ; then
    echo "$JELLYFIN exists."
else
    echo "Creando $JELLYFIN"
    mkdir -p $JELLYFIN
fi


#Media folders
#Root
if [ -d $MEDIA_DIRECTORY ] ; then
    echo "$MEDIA_DIRECTORY exists."
else
    echo "Creando $MEDIA_DIRECTORY"
    mkdir -p $MEDIA_DIRECTORY
fi

#Downloads
if [ -d $DOWNLOADS ] ; then
    echo "$DOWNLOADS exists."
else
    echo "Creando $DOWNLOADS"
    mkdir -p $DOWNLOADS
fi

#Anime
if [ -d $ANIME ] ; then
    echo "$ANIME exists."
else
    echo "Creando $ANIME"
    mkdir -p $ANIME
fi

#Series
if [ -d $SERIES ] ; then
    echo "$MEDIA_DIRECTORY$SERIES exists."
else
    echo "Creando $SERIES"
    mkdir -p $SERIES
fi

#mkdir bajo /mnt/
## MEDIA_HOME
## MEDIA_HOME/SONARR_CONFIG
## MEDIA_HOME/PLEX_CONFIG or JELLYFIN_CONFIG
## MEDIA_HOME/ARIA2C_CONFIG - Lo crea Docker al inicializar. Necesitamos la ruta en el .env
## MEDIA_HOME/ARUAUI_CONFIG
## MEDIA_HOME/FILESERVER_CONFIG
## MEDIA_HOME/FILESERVER_CONFIG/filebrowser.db
## MEDIA_HOME/MEDIA
## MEDIA_HOME/MEDIA/DOWNLOADS
## MEDIA_HOME/MEDIA/DIRECTORY
## MEDIA_HOME/MEDIA/DIRECTORY/ANIME
## MEDIA_HOME/MEDIA/DIRECTORY/TVSERIES
