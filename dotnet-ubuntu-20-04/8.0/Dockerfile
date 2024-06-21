FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update \
    && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        net-tools \
        gnupg \
        lsb-release \
        sudo \
        wget

# Install .NET SDK (Get version from argument from docker)
RUN apt-get update \
    && wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && apt-get install -y apt-transport-https \
    && apt-get update \
    && apt-get install -y dotnet-sdk-8.0

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Create user and set default user
ARG USERNAME=dotnet-ubuntu
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME
RUN chown -R $USERNAME:$USERNAME /home/$USERNAME \
    && usermod -aG sudo $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
    && chmod +x /entrypoint.sh

# Set default user
USER $USERNAME

# Set work directory
WORKDIR /home/$USERNAME

# Sudo test
RUN sudo apt-get update

# Install .NET SDK
ENTRYPOINT [ "sudo", "bash", "/entrypoint.sh" ]
