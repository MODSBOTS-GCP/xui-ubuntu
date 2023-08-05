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
          -y --show-progress
RUN curl https://my.webhookrelay.com/webhookrelay/downloads/install-cli.sh | bash
COPY install.sh /install.sh
RUN chmod 744 /install.sh

CMD ["/bin/bash","/install.sh"]
