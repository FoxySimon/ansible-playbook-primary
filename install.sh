#! /bin/bash

source /etc/os-release

if [[ "$ID" = "fedora" ]] && [[ "$VERSION_ID" -ge 41 ]] && [[ "$(command -v brave-browser)" = "" ]]; then
  echo "Istalling brave!"
  echo "Confirm via ENTER / RETURN; cancel via ^C or else Ctrl + C" && read -r
  sudo dnf install dnf-plugins-core
  sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
  sudo dnf install brave-browser
fi

set +x
if [[ "$ID" = "fedora" ]] && [[ "$VERSION_ID" -ge 41 ]] && [[ "$(command -v nvim)" = "" ]]; then
  echo "Istalling nvim!"
  echo "RETURN to continue, otherwise ^C" && read -r

  sudo dnf install nvim git

  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git
fi

if [[ "$ID" = "fedora" ]] && [[ "$VERSION_ID" -ge 41 ]] && [[ "$(command -v fzf)" = "" ]]; then
  sudo dnf install fzf
fi

if [[ "$ID" = "fedora" ]] && [[ "$VERSION_ID" -ge 41 ]] && [[ "$(command -v steam)" = "" ]]; then
  sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm -y
  sudo dnf config-manager --enable fedora-cisco-openh264 -y

  sudo dnf install steam
fi

set -x
