#!/bin/bash

config_directory="$HOME/.config"
fonts_directory="/usr/share/fonts"

green="\033[0;32m"
no_color='\033[0m'

echo "Welcome"

alias pacman="pacman --noconfirm --needed"
alias paru="paru --noconfirm --needed"

# sudo pacman -Sy dialog

install_base_pkgs() {
  echo -e "${green}[*] Doing a system update, cause stuff may break if it's not the latest version...${no_color}"
  sudo pacman -Suuy
  sudo pacman -S base-devel wget git curl vim
  sudo pacman -S pacman-contrib
}

install_software_pkgs() {
  # Software
  sudo pacman -S bluez bluez-utils cups
  
  sudo systemctl enable bluetooth 
  sudo systemctl enable cups

  echo -e "${green}[*] Installing software.${no_color}"
  # Xorg application
  # sudo pacman -S kitty nitrogen  
  sudo pacman -S foot 
  
  # TODO: Write bash scripts for build applications: flameshot, hyprland, swww, telegram-bot-api(server) 
 
  sudo pacman -S pipewire pipewire-pulse 
  sudo pacman -S bottom keepassxc gnupg polkit-gnome
  sudo pacman -S discord
  
  # Xorg applications
  # sudo pacman -S rofi xsel
  
  sudo pacman -S wofi 
  sudo pacman -S neofetch dunst libqalculate pkgfile zathura texlive-core

  # Shell utils
  echo -e "${green}[*] Installing shell utils.${no_color}"
  sudo pacman -S fish 
  sudo pacman -S lsd bat fzf ripgrep tmux jq imv yt-dlp mpv 
  
  # Graphics
  # TODO: mirgate to hyprland(wayland)
  echo -e "${green}[*] Installing graphics.${no_color}"
  # sudo pacman -S xorg xorg-server xorg-xinit lxappearance papirus-icon-theme
  # sudo pacman -S bspwm sxhkd

  sudo pacman -S tor
  sudo systemctl enable --now tor
  
  # MTP protocol
  echo -e "${green}[*] Installing mtp protocol.${no_color}"
  sudo pacman -S mtpfs gvfs-mtp gvfs-gphoto2   
  sudo pacman -S ntfs-3g

  # Python 
  echo -e "${green}[*] Installing python.${no_color}"
  sudo pacman -S ipython poetry
  sudo pacman -S python python-pip python-poetry

  # VirtualMachine tool
  echo -e "${green}[*] Configuring virtual manager.${no_color}"
  sudo pacman -S qemu virt-manager ebtables dnsmasq firewalld nmap  
  sudo systemctl --now enable libvirtd
  sudo systemctl --now enable firewalld
  sudo sytemctl restart libvirtd
}

create_dotfiles() {
  echo -e "${green}[*] Copying configs to $config_directory.${no_color}"
  mkdir -p "$HOME"/.config
  mkdir -p  /usr/share/themes
  mkdir -p "$HOME"/Pictures/screenshots
}

copy_fonts(){
  echo -e "${green}[*] Copying fonts to $fonts_directory.${no_color}"
  sudo cp -r ./fonts/* "$fonts_directory"
  fc-cache -fv
}

# Install paru
install_aur_helper() {
  echo -e "${green}[*] Installing aur helper.${no_color}"
  git clone https://aur.archlinux.org/paru.git
  (cd paru && makepkg -si)
  rm -rf paru
}

install_aur_pkgs() {
  paru -S librewolf-bin kotatogram-desktop-bin pandoc-bin 
  paru -S light-git 
  paru -S pfetch
  # paru -S polybar-git light-git picom-animations-git
  paru -S jmtpfs
  paru -S epson-inkjet-printer-escpr
}

finishing() {
  echo -e "${green}[*] Copying wallpapers to "$HOME"/Pictures/wallpapers.${no_color}"
  cp -r ./wallpapers/* "$HOME"/Pictures/wallpapers
  sudo chsh -s /bin/fish
  
  # NeoVim
  echo -e "${green}[*] Installing neovim.${no_color}"
  sudo pacman -S neovim neovim-qt
  sudo pacman -S npm ninja cargo go 
  echo -e "${green}[*] Updating nvim extensions.${no_color}"
  # Lazy
  
  #nvim +PackerSync
}
