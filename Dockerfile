FROM golang:1.9-stretch

RUN apt-get update
RUN apt-get install -y wget unzip python-pip
RUN pip install awscli --upgrade --user
ENV PATH="/root/.local/bin:${PATH}"

WORKDIR /tmp
RUN wget https://github.com/golang/dep/releases/download/v0.3.0/dep-linux-amd64.zip
RUN unzip -q dep-linux-amd64.zip
RUN mv dep /usr/bin/
RUN rm dep-linux-amd64.zip

WORKDIR /root
RUN git config --system url."git@github.com:".insteadOf "https://github.com/"
RUN git config --system url."git@bitbucket.org:".insteadOf "https://bitbucket.org/"
RUN mkdir .ssh
# COPY ssh.config .ssh/config
RUN ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
RUN ssh-keyscan -t rsa bitbucket.org >> ~/.ssh/known_hosts
