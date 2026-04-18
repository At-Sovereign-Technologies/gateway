export $(cat .env | xargs) 
docker stack deploy -c production.yml sello-legitimo --with-registry-auth