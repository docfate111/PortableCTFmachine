FROM ubuntu:latest 
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y && \
    apt install -y python3 && \
    apt install -y python3-pip git ltrace sudo ruby gdb nano tmux wget && \
    python3 -m pip install --upgrade pip && \
    python3 -m pip install pwntools ptpython setuptools ropper && \
    # wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh && \
    git clone --depth 1 https://github.com/JonathanSalwan/ROPgadget.git && \
    cd ROPgadget && \
    cd ~ && \
    gem install one_gadget && \
    apt-get clean && \
    apt install -y zsh && \
    chsh -s $(which zsh) && \
    git clone https://github.com/pwndbg/pwndbg && cd pwndbg && \
    ./setup.sh && cd ~ && \
    # wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh && \
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" && \
    echo 'CTF{fake_flag}' >> /flag
