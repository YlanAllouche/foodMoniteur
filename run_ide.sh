#! /bin/sh

name="healthmoniteur-ide"
(docker ps -a --format {{.Names}} | grep $name -w) && docker stop $name && docker rm $name || echo ""
docker run -dt --name healthmoniteur-ide -p 8787 -v $(pwd):/home/rstudio/project -e DISABLE_AUTH=true -e USERID=$UID  rocker/rstudio
PORT=$(docker port healthmoniteur-ide | cut -d: -f2 | head -n1)
url="http://"$HOSTNAME:$PORT
echo "Opening $url"
$BROWSER "$url"
