#! /bin/bash

source /etc/os-release

if [[ "$ID" = "fedora" ]] && [[ "$VERSION_ID" -ge 41 ]] && [[ "$(command -v brave-browser)" = "" ]]; then
  echo "Istalling brave!"
  echo "Confirm via ENTER / RETURN; cancel via ^C or else Ctrl + C" && read -r
  sudo dnf install dnf-plugins-core
  sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
  sudo dnf install brave-browser
fi

if [[ "$ID" = "fedora" ]] && [[ "$VERSION_ID" -ge 41 ]] && [[ "$(command -v nvim)" = "" ]]; then
  echo "Istalling nvim!"
  echo "RETURN to continue, otherwise ^C" && read -r

  sudo dnf install nvim git

  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git

  git config --global core.editor "nvim"
fi

if [[ "$ID" = "fedora" ]] && [[ "$VERSION_ID" -ge 41 ]] && [[ "$(command -v fzf)" = "" ]]; then
  sudo dnf install fzf
fi

if [[ "$ID" = "fedora" ]] && [[ "$VERSION_ID" -ge 41 ]] && [[ "$(command -v steam)" = "" ]]; then
  sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm -y
  sudo dnf config-manager --enable fedora-cisco-openh264 -y

  sudo dnf install steam
fi

if [[ "$ID" = "fedora" ]] && [[ "$VERSION_ID" -ge 41 ]] && [[ "$(command -v pip)" = "" ]]; then
  sudo dnf install python3-pip
fi

if [[ -z "$(git config --global user.email)" ]]; then
  echo "Your email is not set in git global config"
  echo -n "Type your email to be set: "

  read -r EMAIL
  git config --global user.email "$EMAIL"

  echo git config --global user.email: "$(git config --global user.email)"
fi

if [[ -z "$(git config --global user.name)" ]]; then
  echo "Your name is not set in git global config"
  echo -n "Type your name to be set: "

  read -r NAME
  git config --global user.name "$NAME"

  echo git config --global user.name: "$(git config --global user.name)"
fi
