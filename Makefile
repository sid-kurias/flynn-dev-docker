run: all
	bin/forego start

all: init bin/sampid bin/lorne bin/flynn-receive bin/gitreceived bin/discoverd bin/sdutil bin/shelf bin/flynn bin/strowger bin/forego slugbuilder slugrunner storage id_rsa /tmp/keys/root nodejs-example

# Setup

init:
	mkdir -p /root/.ssh
	mkdir -p /root/bin

storage:
	mkdir -p storage

id_rsa:
	ssh-keygen -t rsa -N "" -f id_rsa

/root/.ssh/id_rsa:
	ssh-keygen -t rsa -f /root/.ssh/id_rsa -N ""

/root/.ssh/config:
	echo "Host flynn\n    Hostname localhost\n    Port 2022" > /root/.ssh/config

/tmp/keys:
	mkdir -p /tmp/keys

/tmp/keys/root: /root/.ssh/id_rsa /root/.ssh/config /tmp/keys
	cp /root/.ssh/id_rsa.pub /tmp/keys/root

nodejs-example:
	git clone https://github.com/titanous/nodejs-example
	cd nodejs-example && git remote add flynn root@flynn:example

# Projects

bin/sampid:  bin/discoverd
	go get -v github.com/flynn/sampi/sampid

bin/lorne:  bin/discoverd
	go get -v github.com/flynn/lorne

bin/flynn-receive:  bin/discoverd
	go get -v github.com/flynn/flynn-receive

bin/gitreceived: 
	go get -v github.com/flynn/gitreceive-next/gitreceived

bin/discoverd:  bin/etcd
	go get -v github.com/flynn/discoverd

bin/sdutil:  bin/discoverd
	go get -v github.com/flynn/sdutil

bin/shelf: 
	go get -v github.com/flynn/shelf

bin/flynn-controller:  bin/discoverd
	go get -v github.com/flynn/flynn-controller

bin/flynn: bin/flynn-cli
	ln -fs /root/flynn/bin/flynn-cli /root/flynn/bin/flynn

bin/flynn-cli:  bin/flynn-controller
	go get -v github.com/flynn/flynn-cli

bin/strowger:  bin/discoverd
	go get -v github.com/flynn/strowger

slugbuilder: 
	@docker images | grep flynn/slugbuilder > /dev/null || docker pull flynn/slugbuilder

slugrunner: 
	@docker images | grep flynn/slugrunner > /dev/null || docker pull flynn/slugrunner

# Vendor

bin/forego: 
	go get -v github.com/ddollar/forego

bin/etcd:
#n	wget https://github.com/coreos/etcd/releases/download/v0.2.0-rc1/etcd-v0.2.0-rc1-Linux-x86_64.tar.gz
#	tar -zxvf etcd-v0.2.0-rc1-Linux-x86_64.tar.gz
#	cp etcd-v0.2.0-rc1-Linux-x86_64/etcd ../../../../bin



.PHONY: all slugrunner slugbuilder
