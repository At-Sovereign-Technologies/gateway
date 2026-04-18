export $(cat .env | xargs) 
docker stack deploy -c compose.yml sello-legitimo --with-registry-auth