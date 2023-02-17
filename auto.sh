#!/bin/bash
if [ $# -ne 3 ]; then
    echo "Please input your email , graffiti, asset ID"
    exit 1
fi
email=$1
gra=$2
id=$3

sudo chmod +x $HOME/ironfish-testnet-3/getfaucet.sh
sudo $HOME/ironfish-testnet-3/getfaucet.sh $email
sleep 7200
sudo $HOME/ironfish-testnet-3/task.sh $gra $id