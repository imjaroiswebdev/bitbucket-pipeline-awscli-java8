FROM atlassian/default-image:2.08
LABEL Maintainer="José Antonio Reyes"

RUN curl -O https://bootstrap.pypa.io/get-pip.py \
  && python get-pip.py \
  && pip install awscli

# Install Node V12.16.1 LTS and NPM V6.13.7
ENV NVM_DIR=/root/.nvm \
  NODE_VERSION=12.16.1 \
  NPM_VERSION=6.13.7

RUN curl https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh | bash \
  && . $NVM_DIR/nvm.sh \
  && nvm install $NODE_VERSION \
  && nvm alias default $NODE_VERSION \
  && nvm use default \
  && npm i -g npm@$NPM_VERSION

# Set node path
ENV NODE_PATH=$NVM_DIR/v$NODE_VERSION/lib/node_modules

# Install Maven V3.6.3
RUN apt purge maven* -y \
  && cd /opt/ \
  && wget https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz \
  && tar -xvzf apache-maven-3.6.3-bin.tar.gz \
  && mv apache-maven-3.6.3 maven

# Set the path.
ENV PATH=/opt/maven/bin:$NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
