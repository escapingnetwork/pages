FROM node:20

ARG USERNAME=node
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Install elm, elm-test and elm-format
RUN apt update && apt install -y less man-db sudo 
# Ensure default `node` user has access to `sudo`
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

    RUN curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz \
    && gunzip elm.gz && chmod +x elm && sudo mv elm /usr/local/bin/ \
    && sudo npm install -g elm-format elm-review

# Set `DEVCONTAINER` environment variable to help with orientation
ENV DEVCONTAINER=true
