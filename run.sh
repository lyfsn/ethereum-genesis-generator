
rm -rf output

# docker run --rm -it -u $UID -v $PWD/output:/data \
#   -v $PWD/config-example:/config \
#   wangyufsn/ethereum-genesis-generator:2.0.4 all


docker run --rm -it -u $UID -v $PWD/output:/data \
  -v $PWD/config-example:/config \
  wangyufsn/ethereum-genesis-generator:2.0.4 el


