#!/bin/bash

# Run this as sudo!
if [ $EUID != 0 ]; then
  sudo "$0" "$@"
  exit $?
fi

# Install latest stable nvim app image if no > 0.9 is installed
# See https://github.com/neovim/neovim/blob/master/INSTALL.md
install_nvim=false
command -v nvim >/dev/null

if [[ $? -ne 0 ]]; then
    echo "Nvim is not installed"
    install_nvim=true
else
    nvim_version=$(nvim --version | head -1 | grep -o '[0-9]\.[0-9]')

    if (( $(echo "$nvim_version < 0.9 " |bc -l) )); then
            echo "Wrong version of Nvim is installed"
            sudo apt remove neovim -y
	    install_nvim=true
    else
        echo "Nvim version 0.9 or greater is installed"
    fi
fi

if [ "$install_nvim" = true ]; then
  mkdir -p "/opt/nvim/"
  cd /opt/nvim && curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage && chmod +x nvim.appimage && cd -
  # Check if the appimage can be executed. If not, extracat the image
  /opt/nvim/nvim.appimage -v 
  if [ $? -ne 0 ]; then
    cd /opt/nvim && .nvim.appimage --appimage-extract && cd -
    ln -s /opt/nvim/squashfs-root/AppRun /usr/bin/nvim
  else
    ln -s /opt/nvim/nvim.appimage /usr/bin/nvim
  fi
  echo "Nvim latest version has been installed"
fi
