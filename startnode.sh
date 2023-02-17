#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Please input your graffiti"
    exit 1
fi
gra=$1
sudo docker stop ironfish
sudo docker rm ironfish
sudo rm -rf $HOME/.ironfish
sudo docker pull ghcr.io/iron-fish/ironfish:latest
sudo docker run --restart=always --name ironfish -d --tty --cpus=2 --interactive --network host  --volume $HOME/.ironfish:/root/.ironfish ghcr.io/iron-fish/ironfish:latest start
sleep 10
sudo docker exec -it  ironfish ironfish config:set blockGraffiti $gra
sudo docker exec -it ironfish ironfish config:set enableTelemetry true
