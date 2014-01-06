etcd: ../../../../bin/etcd -d /tmp
discoverd: ../../../../bin/discoverd
gitreceive: ../../../../bin/gitreceived -p 2022 id_rsa ../../../../bin/flynn-receive
shelf: sleep 1 && ../../../../bin/sdutil exec -h 172.17.0.07 shelf:8888 ../../../../bin/shelf -p 8888 /root/flynn/src/github.com/flynn/flynn-dev/storage
sampi: sleep 1 && ../../../../bin/sampid
strowger: sleep 1 && ../../../../bin/strowger
lorne: sleep 2 && ../../../../bin/lorne -external 172.17.0.07
controller: sleep 2 && ../../../../bin/flynn-controller
