#!/bin/bash

# Run this as sudo!
if [ $EUID != 0 ]; then
  sudo "$0" "$@"
  exit $?
fi

# Install latest stable nvim app image if no > 0.11 is installed
# See https://github.com/neovim/neovim/blob/master/INSTALL.md
install_nvim=false
command -v nvim >/dev/null

if [[ $? -ne 0 ]]; then
    echo "Nvim is not installed"
    install_nvim=true
else
    # Extract complete version (0.9.5 or 0.11.0)
    nvim_version=$(nvim --version | head -1 | awk '{print $2}')

    # Extract major and minor version
    major=$(echo "$nvim_version" | cut -d. -f1)
    minor=$(echo "$nvim_version" | cut -d. -f2)

    # Target-Version: 0.11
    if [[ "$major" -eq 0 && "$minor" -lt 11 ]]; then
        echo "Wrong version of Nvim is installed (found $nvim_version)"
        sudo apt remove neovim -y
        install_nvim=true
    else
        echo "Nvim version $nvim_version is acceptable (>= 0.11)"
    fi
    nvim_version=$(nvim --version | head -1 | grep -o '[0-9]\.[0-9]')
fi

if [ "$install_nvim" = true ]; then
  mkdir -p "/opt/nvim/"
  cd /opt/nvim && curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage && chmod +x nvim-linux-x86_64.appimage && cd -
  # Check if the appimage can be executed. If not, extracat the image
  /opt/nvim/nvim-linux-x86_64.appimage -v
  if [ $? -ne 0 ]; then
    cd /opt/nvim && ./nvim-linux-x86_64.appimage --appimage-extract && cd -
    ln -s /opt/nvim/squashfs-root/AppRun /usr/bin/nvim
  else
    ln -s /opt/nvim/nvim-linux-x86_64.appimage /usr/bin/nvim
  fi
  echo "Nvim latest version has been installed"
fi

# Install delta as diff tool for git
install_delta=false
command -v delta >/dev/null

if [[ $? -ne 0 ]]; then
    echo "delta is not installed"
    wget https://github.com/dandavison/delta/releases/download/0.16.5/git-delta_0.16.5_amd64.deb && dpkg -i git-delta_0.16.5_amd64.deb && rm git-delta_0.16.5_amd64.deb
fi

# Install lazygit as git command line interface
command -v lazygit >/dev/null

if [[ $? -ne 0 ]]; then
    echo "lazygit is not installed"
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
    rm lazygit
fi
