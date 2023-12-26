
docker rmi lyfsn/ethereum-genesis-generator:2.0.4  

docker build \
  --build-arg http_proxy=http://host.docker.internal:7890 \
  --build-arg https_proxy=http://host.docker.internal:7890 \
  --build-arg all_proxy=socks5://host.docker.internal:7890 \
  -f Proxy.Dockerfile \
  -t lyfsn/ethereum-genesis-generator:2.0.4 .
