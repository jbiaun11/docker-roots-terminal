FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y

### Install wetty dependencies
RUN apt install -y curl make gcc build-essential curl python3.11 sshpass wget

### text editors ###
RUN apt install nano vim emacs -y

### install node ###
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs


### SETUP term user
RUN useradd -d /home/term -m -s /bin/bash term
RUN echo 'term:term' | chpasswd

### Install Wetty, expose 8080 for wetty
RUN npm install -g wetty@2.6.0
EXPOSE 8080

### Install Supervisor and SSH
RUN apt install -y supervisor openssh-server
### enable ssh ### -note that this is started using supervisor in the supervinord.conf file
RUN DEBIAN_FRONTEND=noninteractive apt-get install  -y
RUN service ssh start
EXPOSE 9022


### add conf files ###
ADD start.sh /bin/start.sh
ADD ./supervisord.conf /etc/supervisor/supervisord.conf



#http://localhost:8080/ssh/term?pass=term
CMD ["/bin/start.sh"]
