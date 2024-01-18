rm -rvf el-cl-genesis-data


docker run \
  --rm -it -v $PWD/el-cl-genesis-data:/data \
  -v $PWD/config-example:/config \
  lyfsn/ethereum-genesis-generator:2.0.8 all