FROM debian:testing

RUN apt-get update
RUN apt-get install -y git htop vim salt-minion python-pygit2

WORKDIR /root/

VOLUME ['/srv/pillar']
VOLUME ['/srv/salt']
VOLUME ['/etc/salt/minion']
VOLUME ['/git']
CMD ["/usr/bin/salt-call", "--local", "-l", "all", "state.highstate"]
