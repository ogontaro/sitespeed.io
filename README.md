# Sitespeed.io

## setup
```
cp .env.sample .env
# edit .env
cp urls.txt.sample urls.sample
# edit urls.txt
# edit default.json
```

## run dashbard
```
docker-compose up -d
```

## run speedtest
```
./run.sh
```

## cron speedtest
```

SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
* * */1 * * /home/ubuntu/sitespeed.io/run.sh >> /var/log/sitespeed.io.log 2>&1
``` 

## access dashboard
```
localhost:3000
```
