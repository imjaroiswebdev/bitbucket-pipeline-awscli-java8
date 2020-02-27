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

# Set the path.
ENV PATH=$NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
