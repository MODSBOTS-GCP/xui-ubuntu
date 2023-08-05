FROM ubuntu:20.04
RUN echo 'Installing additional packages...' && \
	  export DEBIAN_FRONTEND=noninteractive && \
	  apt-get update && \
	  apt-get install \
	  sudo \
	  wget \
    	  unzip \
	  screen \
          systemd \
	  curl \
          -y --show-progress
RUN curl https://my.webhookrelay.com/webhookrelay/downloads/install-cli.sh | bash
COPY xxx.sh /xxx.sh
RUN chmod 744 /xxx.sh
EXPOSE 8080
ENTRYPOINT [ "./xxx.sh" ]
