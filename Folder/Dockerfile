############################################################
# Dockerfile based on Epictreasure container
# Based on Ubuntu
############################################################

FROM ubuntu:19.10
ENV test false
MAINTAINER Maintainer Cory Duplantis

RUN apt update && \
    apt -y install locales

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN mkdir -p /root/tools

RUN apt update && \
    apt -y install python-dev python-pip && \
    apt -y install python3-dev python3-pip && \
    apt clean

RUN apt update && \
    apt install --no-install-recommends -y build-essential curl gdb \
    gdb-multiarch gdbserver git nano \
    libncursesw5-dev python3-setuptools python-setuptools \
    python2.7 python3-pip tmux tree stow virtualenvwrapper \
    wget vim unzip \
    libjpeg8 libjpeg62-dev libfreetype6 libfreetype6-dev \
    squashfs-tools zlib1g-dev liblzma-dev python-magic cmake \
    z3 python-lzma net-tools strace ltrace \
    gcc-multilib g++-multilib ruby-full binutils-mips-linux-gnu sudo

# Upgrade pip and ipython
RUN python -m pip install --upgrade pip && \
    python3 -m pip install --upgrade pip && \
    pip2 install -Iv ipython==5.3.0  && \
    pip3 install ipython && \
    wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh
# ohmyzsh
RUN apt install -y zsh && \
    chsh -s $(which zsh) && \
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
# Install radare (need to fix)
# RUN git clone --depth 1 https://github.com/radare/radare2 && \
#    cd radare2 && \
#    ./sys/install.sh && \
#    make install && \
#    pip2 install r2pipe && \
#    pip3 install r2pipe

# Install pwntools and pwndbg
RUN pip2 install git+https://github.com/Gallopsled/pwntools && \
    cd /root/tools
    #  && \
    # git clone --depth 1 https://github.com/pwndbg/pwndbg && \
    # cd pwndbg && \
    # ./setup.sh

# Install 32bit dependencies
RUN dpkg --add-architecture --force-overwrite i386 && \
    apt update && \
    apt --no-install-recommends -y install libc6:i386 libncurses5:i386 libstdc++6:i386 libc6-dev-i386 && \
    apt clean

# Install apktool
# RUN apt update && \
#     apt install --no-install-recommends -y default-jre && \
#     wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool && \
#     wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.0.2.jar && \
#     mv apktool_2.0.2.jar /bin/apktool.jar && \
#     mv apktool /bin/ && \
#     chmod 755 /bin/apktool && \
#     chmod 755 /bin/apktool.jar

# Install PIL
RUN pip install Pillow

# Install frida and the frida tools
RUN pip install frida frida-tools

# Install ROPgadget
RUN cd /root/tools && \
    git clone --depth 1 https://github.com/JonathanSalwan/ROPgadget.git && \
    cd ROPgadget && \
    python setup.py install

# Install fzf
RUN cd /root/tools && \
    git clone --depth 1 https://github.com/junegunn/fzf.git /root/.fzf && \
    /root/.fzf/install --all --key-bindings --completion

RUN apt-get update && \
    apt-get install --no-install-recommends -y software-properties-common

#  Install qemu with multiarchs
#  RUN apt --no-install-recommends -y install qemu qemu-user qemu-user-static && \
#    apt -m update && \
#     apt install -y libc6-arm64-cross libcc6-dev-i386 \
#     libc6-i386 libffi-dev libssl-dev libncurses5-dev && \
#     apt --no-install-recommends -y install 'binfmt*' && \
#     apt --no-install-recommends -y install libc6-armhf-armel-cross && \
#     apt --no-install-recommends -y install debian-keyring && \
#     apt --no-install-recommends -y install debian-archive-keyring && \
#     apt --no-install-recommends -y install emdebian-archive-keyring && \
#     apt -m update; echo 0 && \
#     apt --no-install-recommends -y install libc6-mipsel-cross && \
#     apt --no-install-recommends -y install libc6-armel-cross libc6-dev-armel-cross && \
#     apt --no-install-recommends -y install libc6-dev-armhf-cross && \
#     apt --no-install-recommends -y install binutils-arm-linux-gnueabi && \
#     apt --no-install-recommends -y install libncurses5-dev && \
#     mkdir /etc/
