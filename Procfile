etcd: ../../../../bin/etcd -d /tmp
discoverd: ../../../../bin/discoverd
gitreceive: ../../../../bin/gitreceived -p 2022 id_rsa ../../../../bin/flynn-receive
shelf: sleep 1 && ../../../../bin/sdutil exec -h 172.17.0.07 shelf:8888 ../../../../bin/shelf -p 8888 /root/flynn/src/github.com/flynn/flynn-dev/storage
sampi: sleep 1 && ../../../../bin/sampid
strowger: sleep 1 && ../../../../bin/strowger
lorne: docker run -v /var/run/docker.sock:/var/run/docker.sock -p 1113:1113 flynn/lorne -external 10.0.2.15
controller: sleep 2 && ../../../../bin/flynn-controller
