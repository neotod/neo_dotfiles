printf ""
printf "-> Updating pkgs DB..."
printf ""
sudo pacman -Syu

printf ""
printf "-> Installing yay..."
printf ""
sudo pacman -S yay

printf ""
printf "-> Updating already installed packages..."
printf ""
yay -Syu

aur_programming_langs_pkgs=(python nodejs npm ruby rubygems)
aur_programming_tools_pkgs=(mongodb-bin mongodb-compass mongodb-tools-bin)
aur_gui_pkgs=(brave-bin google-chrome telegram-desktop simplescreenrecorder qbittorrent)
aur_cli_pkgs=(dust lsd clash-for-windows-bin btop docker docker-compose syncthing gnome-keyring)

snap_pkgs=(anki-ppd code discord postman skype whatsdesk libreoffice)

printf ""
printf "-> installing AUR pkgs..."
printf ""
yay -S ${aur_programming_langs_pkgs}
yay -S ${aur_programming_tools_pkgs}
yay -S ${aur_gui_pkgs}
yay -S ${aur_cli_pkgs}

printf ""
printf "-> installing snap pkgs..."
printf ""

printf "\ninstalling and configuring snap itself...\n"
pamac install snapd libpamac-snap-plugin
sudo systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap

for pkg_name in ${snap_pkgs}
do
  sudo snap install ${pkg_name}
done

printf "\ninstalling flatpack...\n"
pamac install flatpak libpamac-flatpak-plugin
pamac install discover