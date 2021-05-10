FROM rust:1.52

COPY .profile /root/.bashrc
SHELL ["/bin/bash", "--rcfile", "/root/.bashrc", "-c"] 

RUN rustup default nightly
RUN rustup target add wasm32-wasi
RUN cargo install fcli frepl

RUN apt-get update && apt-get install --yes --no-install-recommends default-jre-headless

# install NVM from master = b5165ec (10 May 2021) + install npm & node
RUN curl https://raw.githubusercontent.com/nvm-sh/nvm/b5165ec/nvm.sh --create-dirs -o ~/.nvm/nvm.sh
RUN source ~/.bashrc && nvm install 14 && npm -g config set user root
RUN source ~/.bashrc && npm install -g @fluencelabs/fldist @fluencelabs/aqua-cli

RUN git clone https://github.com/fluencelabs/examples
