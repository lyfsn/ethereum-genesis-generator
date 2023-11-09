
rm -rf output

docker run --rm -it -u $UID -v $PWD/output:/data \
  -v $PWD/config-example:/config \
  ethpandaops/ethereum-genesis-generator:latest all