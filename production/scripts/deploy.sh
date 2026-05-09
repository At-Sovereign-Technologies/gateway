echo "Starting services..."
export $(cat .env | xargs) 
docker stack deploy -c production.yml sello-legitimo --with-registry-auth --resolve-image always