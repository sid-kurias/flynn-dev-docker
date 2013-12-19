flynn-dev-docker
================

Provides an environment to run the flynn development code within a docker
container. Source directories are shared between the host and the docker
container.

Configuration
1. The prebuilt docker (step 1 below)  container sets GOPATH to /root/flynn.
The host machines GOPATH directory should be shared as a volume with the
container.
2. The container is given the hostname flynn.

Steps to run
1. docker pull sidkurias/flynn-dev-docker.
   This will pull the prebuilt image to run a 'docker in docker' env that works
   with flynn.
2. Run the container
   docker run -h flynn -privileged  -v GOPATH on HOST:/root/flynn  -i -t sidkurias/flynn-dev-docker
3. cd /root/flynn
4. go get github.com/sid-kurias/flynn-dev-docker
5. cd src/github.com/sid-kurias/flynn-dev-docker
6. Edit the Procfile. Change the ip address that lorne and shelf need to the ip
   address of the container's eth0 interface. This can be obtained by executing
   ip addr show
7. make
8. cd nodejs-example
9. git push flynn master
10. Once the build is complete execute
   curl http://IPADDR:55000 (addr is got from step 6)

Steps to build the docker image yourself
Prerequisites
1. Docker is installed
2. godeb is installed
  wget -O godeb.tar.gz https://godeb.s3.amazonaws.com/godeb-amd64.tar.gz
  tar -zxvf godeb.tar.gz
3. The godeb, docker and wrapdocker binaries should be in the same directory as
   the Dockerfile.
4. docker build -t YOUR TAG NAME .
