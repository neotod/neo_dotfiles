echo ""
echo "-> Updating pkgs DB..."
echo ""
sudo pacman -Syu

echo ""
echo "-> Installing yay..."
echo ""
sudo pacman -S yay

echo ""
echo "-> Updating already installed packages..."
echo ""
yay -Syu

aur_programming_langs_pkgs=(python nodejs npm ruby rubygems)
aur_programming_tools_pkgs=(mongodb-bin mongodb-compass mongodb-tools-bin)
aur_gui_pkgs=(brave-bin google-chrome telegram-desktop)
aur_cli_pkgs=(dust lsd clash-for-windows-bin btop yay)

snap_pkgs=(anki-ppd code discord postman skype whatsdesk libreoffice)

echo ""
echo "-> installing AUR pkgs..."
echo ""
yay -S ${aur_programming_langs_pkgs}
yay -S ${aur_programming_tools_pkgs}
yay -S ${aur_gui_pkgs}
yay -S ${aur_cli_pkgs}

echo ""
echo "-> installing snap pkgs..."
echo ""
for pkg_name in ${snap_pkgs}
do
  sudo snap install ${pkg_name}
done