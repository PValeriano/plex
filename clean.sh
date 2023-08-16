source ./.env

echo Archivos: $(ls $DOWNLOADS)

if [ -d $DOWNLOADS ] ; then
    rm -rf $DOWNLOADS/*
fi

echo Archivos: $(ls $DOWNLOADS)