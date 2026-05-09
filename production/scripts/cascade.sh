echo "Stopping services..."
docker stack rm sello-legitimo

echo "Awaiting for services stop fully (30 seconds)..."
sleep 30

echo "Pulling latest commit..."
git pull

echo "Starting services..."
export $(cat .env | xargs)
docker stack deploy -c production.yml sello-legitimo --with-registry-auth --resolve-image always