BASE_DIR=$1 # BASE_DIR passed from Makefile
BASE_DIR=${BASE_DIR:0:-1}

printf "\n--- installing required pkgs ---\n"

printf "\ninstalling wget..."
sudo pacman -S wget

printf "\ninstalling zsh..."
sudo pacman -S zsh

printf "\ninstalling and configuring OMZ..."
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

printf "\ninstalling and configuring p10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

printf "\ninstalling vivid for LS_COLORS theme..."
sudo pacman -S vivid

printf "\n\n--- installing required pkgs -> finished ---\n"

printf "\n--- installing zsh plugins ---\n"

printf "\ninstalling zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

printf "\ninstalling zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

printf "\n\n--- installing zsh plugins -> finished ---"

printf "\n\n--- making zsh configs symlinks ---"

home_target_configs=(
  $BASE_DIR/zsh/.zshrc
  $BASE_DIR/zsh/.zsh_history
  $BASE_DIR/zsh/.p10k.zsh
)

home_configs_paths=(
  $HOME/.zshrc
  $HOME/.zsh_history
  $HOME/.p10k.zsh
)

printf "\n\nmaking configs symlinks..."
for i in ${!home_target_configs[@]}; do
  rm "${home_configs_paths[i]}"
  ln -sv "${home_target_configs[i]}" "${home_configs_paths[i]}"
done