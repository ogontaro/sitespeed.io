# Sitespeed.io

## setup
```
cp .env.sample .env
# edit .evn
# edit config/default.json
# edit config/urls.txt
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
