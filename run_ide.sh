#! /bin/sh

name="healthmoniteur-ide"
(docker ps -a --format {{.Names}} | grep $name -w) && docker stop $name && docker rm $name || echo ""
docker run -dt --name healthmoniteur-ide -p 8787 -p 80 -v $(pwd):/home/rstudio/project -e ROOT=true  -e DISABLE_AUTH=true -e USERID=$UID  rocker/tidyverse
PORT=$(docker port healthmoniteur-ide| grep "8787/tcp" | cut -d: -f2 | head -n1)
API=$(docker port healthmoniteur-ide | grep "80/tcp" |cut -d: -f2 | head -n1)
url="http://"$HOSTNAME:$PORT
echo "Opening IDE at $url"
$BROWSER "$url"

url="http://"$HOSTNAME:$API
echo "Opening API at $url"
$BROWSER "$url"
