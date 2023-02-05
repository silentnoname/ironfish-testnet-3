# ironfish-testnet-3

## start node 
```
cd $HOME
git clone https://github.com/silentnoname/ironfish-testnet-3.git
cd ironfish-testnet-3
sudo chmod +x startnode.sh 
./startnode.sh  <graffiti>
```

## check node status
```
sudo docker exec -it  ironfish ironfish status
```

## Other task
**Make sure your node synced**
### Get faucet

```
cd $HOME
cd ironfish-testnet-3
sudo chmod +x getfaucet.sh
./getfaucet.sh <email>
```

The token should be arrive in 1 hour.

### Check balance
```
sudo docker exec -it  ironfish ironfish  wallet:balance
```

### mint, burn and send

#### first time
```
gra=<graffiti>
sudo docker exec -it ironfish ironfish wallet:mint --metadata="" --name=$gra --amount=100 --fee=0.00000001 --confirm
```
wait around 5 min

```
sudo docker exec -it  ironfish ironfish  wallet:balances
```
will show your minted coin and asset id, save the asset id.

#### After first time

```
cd $HOME
cd ironfish-testnet-3
sudo chmod +x task.sh
./task.sh <graffiti> <asset id>
```

### schedule task
```
cd $HOME
cd ironfish-testnet-3
sudo chmod +x task.sh
dir=$(pwd)/task.sh
email=
graffiti=
assetid=
crontab -l > tmp && echo "5 20 * * 2 bash ${dir} $email $graffiti $assetid >>$HOME/ironfish-testnet-3/task.log" >> tmp && crontab tmp && rm -f tmp
```

After this ,we will get faucet and excute the task when monday 





