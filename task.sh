#!/bin/sh
if [ $# -ne 2 ]; then
    echo "Please input your graffiti, asset ID"
    exit 1
fi
gra=$1
id=$2
bank=dfc2679369551e64e3950e06a88e68466e813c63b100283520045925adbe59ca
sudo docker exec -it ironfish ironfish wallet:mint --metadata="see more here" --name=$gra --amount=100 --fee=0.00000001 --confirm
sleep 900
sudo docker exec -it ironfish ironfish wallet:burn --assetId=$id --amount=0.01 --fee=0.00000001 --confirm
sleep 900
sudo docker exec -it ironfish ironfish wallet:send --amount=0.01 --assetId=$id --to=$bank --account=$account --fee=0.00000001 --confirm