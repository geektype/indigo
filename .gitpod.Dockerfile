FROM gitpod/workspace-base:2023-11-24-15-04-57

RUN sudo apt update
RUN sudo install-packages ca-certificates curl gnupg

# Install Node + NPM
RUN sudo mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
RUN sudo install-packages nodejs

# Install Go
RUN cd $(mktemp -d) \ 
    && curl -OL https://go.dev/dl/go1.21.5.linux-amd64.tar.gz \
    && sudo tar -C /usr/local -xvf go1.21.5.linux-amd64.tar.gz
ENV PATH=/usr/local/go/bin:$PATH

##Install AWS CLI
RUN cd $(mktemp -d) \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && sudo ./aws/install