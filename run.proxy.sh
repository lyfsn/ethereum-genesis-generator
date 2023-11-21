
rm -rvf el-cl-genesis-data


docker run \
  -e http_proxy=http://host.docker.internal:7890 \
  -e https_proxy=http://host.docker.internal:7890 \
  -e all_proxy=socks5://host.docker.internal:7890 \
  --rm -it -v $PWD/el-cl-genesis-data:/data \
  -v $PWD/config-example:/config \
  wangyufsn/ethereum-genesis-generator:2.0.4 all
