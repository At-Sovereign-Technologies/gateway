docker service create \
  --name cluster-pruner \
  --mode global \
  --restart-condition none \
  --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
  alpine sh -c "docker volume prune -f"

docker service rm cluster-pruner