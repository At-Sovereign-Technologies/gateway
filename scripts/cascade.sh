export $(cat .env | xargs)
docker stack rm sello-legitimo
echo "Waiting 30 seconds..."
git pull
docker stack deploy -c production.yml sello-legitimo --with-registry-auth --resolve-image always