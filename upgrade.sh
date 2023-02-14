#!/bin/bash
sudo docker stop ironfish
sudo docker rm ironfish
sudo docker pull ghcr.io/iron-fish/ironfish:latest
sudo docker run --restart=always --name ironfish -d --tty --cpus=2 --interactive --network host  --volume $HOME/.ironfish:/root/.ironfish ghcr.io/iron-fish/ironfish:latest start  --upgrade
