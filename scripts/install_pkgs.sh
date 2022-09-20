echo -e ""
echo -e "-> Updating pkgs DB..."
echo -e ""
sudo pacman -Syu

echo -e ""
echo -e "-> Installing yay..."
echo -e ""
sudo pacman -S --needed yay

echo -e ""
echo -e "-> Updating already installed packages..."
echo -e ""
yay -Syu

aur_programming_langs_pkgs=(python nodejs npm ruby rubygems)
aur_programming_tools_pkgs=(mongodb-bin mongodb-compass mongodb-tools-bin)
aur_gui_pkgs=(brave-bin google-chrome telegram-desktop simplescreenrecorder qbittorrent)
aur_cli_pkgs=(dust lsd btop docker docker-compose syncthing gnome-keyring keepassxc)

snap_pkgs=(discord postman skype whatsdesk libreoffice)

echo -e ""
echo -e "-> installing AUR pkgs..."
echo -e ""
yay -S --needed ${aur_programming_langs_pkgs[@]}
yay -S --needed ${aur_programming_tools_pkgs[@]}
yay -S --needed ${aur_gui_pkgs[@]}
yay -S --needed ${aur_cli_pkgs[@]}

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


echo -e "\n-> Installing Anaconda <-\n"

echo -e "\nDownloading and Installing dependencies...\n"
sudo pacman -Sy libxau libxi libxss libxtst libxcursor libxcomposite libxdamage libxfixes libxrandr libxrender mesa-libgl  alsa-lib libglvnd

echo -e "\nDownloading Anaconda...\n"
wget -O anaconda https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh

echo -e "\nAnaconda downloaded. Installing...\n"
source anaconda

rm ./anaconda