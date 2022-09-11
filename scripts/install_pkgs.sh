echo -e ""
echo -e "-> Updating pkgs DB..."
echo -e ""
sudo pacman -Syu

echo -e ""
echo -e "-> Installing yay..."
echo -e ""
sudo pacman -S yay

echo -e ""
echo -e "-> Updating already installed packages..."
echo -e ""
yay -Syu

aur_programming_langs_pkgs=(python nodejs npm ruby rubygems)
aur_programming_tools_pkgs=(mongodb-bin mongodb-compass mongodb-tools-bin)
aur_gui_pkgs=(brave-bin google-chrome telegram-desktop simplescreenrecorder qbittorrent)
aur_cli_pkgs=(dust lsd btop docker docker-compose syncthing gnome-keyring)

snap_pkgs=(discord postman skype whatsdesk libreoffice)

echo -e ""
echo -e "-> installing AUR pkgs..."
echo -e ""
yay -S ${aur_programming_langs_pkgs[@]}
yay -S ${aur_programming_tools_pkgs[@]}
yay -S ${aur_gui_pkgs[@]}
yay -S ${aur_cli_pkgs[@]}

echo -e ""
echo -e "-> installing snap pkgs..."
echo -e ""

echo -e "\ninstalling and configuring snap itself...\n"
pamac install snapd libpamac-snap-plugin
sudo systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap

for pkg_name in ${snap_pkgs[@]}; do
  sudo snap install ${pkg_name}
done

sudo ln -sv /var/lib/snapd/snap /snap

sudo snap install --classic code

echo -e "\ninstalling flatpack...\n"
pamac install flatpak libpamac-flatpak-plugin
pamac install discover
