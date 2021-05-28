# Bootstrap from self so all tools are cached
FROM fluencelabs/devcontainer

RUN source ~/.bashrc && nvm use 14 && npm -g config set user root
RUN source ~/.bashrc && npm install -g @fluencelabs/fldist @fluencelabs/aqua-cli

COPY .devcontainer/.aux/download_examples.sh /download_examples.sh
COPY .devcontainer/.aux/greetings.sh /greetings.sh
COPY .devcontainer/.aux/persist_greetings.sh /persist_greetings.sh

RUN cargo install marine mrepl

RUN bash persist_greetings.sh /etc/bash.bashrc
