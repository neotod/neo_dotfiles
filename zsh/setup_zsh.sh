BASE_DIR=$1 # BASE_DIR passed from Makefile
BASE_DIR=${BASE_DIR:0:-1}

echo -e "\n--- installing required pkgs ---\n"

echo -e "\n Note: If internet is fucked up and you require to set a proxy server, set it up fist :). \n"
echo -e "example: export HTTP_PROXY=socks5://0.0.0.0:9999 &&  export HTTPS_PROXY=socks5://0.0.0.0:9999  &&  export SOCKS_PROXY=socks5://0.0.0.0:9999 \n"

sleep 1

echo -e "\ninstalling wget..."
sudo pacman -S wget

echo -e "\ninstalling zsh..."
sudo pacman -S zsh

echo -e "\ninstalling and configuring OMZ..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo -e "\ninstalling and configuring p10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo -e "\ninstalling vivid for LS_COLORS theme..."
sudo pacman -S vivid

echo -e "\n\n--- installing required pkgs -> finished ---\n"

echo -e "\n--- installing zsh plugins ---\n"

echo -e "\ninstalling zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo -e "\ninstalling zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo -e "\n\n--- installing zsh plugins -> finished ---"

echo -e "\n\n--- making zsh configs symlinks ---"

home_target_configs=(
  $BASE_DIR/zsh/.zshrc
  $BASE_DIR/zsh/.p10k.zsh
)

home_configs_paths=(
  $HOME/.zshrc
  $HOME/.p10k.zsh
)

echo -e "\n\nmaking configs symlinks..."
for i in ${!home_target_configs[@]}; do
  mv "${home_configs_paths[i]}" "${home_configs_paths[i]}.old"
  ln -sv "${home_target_configs[i]}" "${home_configs_paths[i]}"
done

echo -e "\n go to this link and install MesloLGS fonts manually -> https://github.com/romkatv/powerlevel10k#manual-font-installation"

echo -e "\n\nNote that old config files are copied with .old addedd to end of their name."
echo -e "\nIf you want to delete the old ones, go and do it urself with hand :)"
