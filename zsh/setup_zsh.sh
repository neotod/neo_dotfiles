BASE_DIR=$1 # BASE_DIR passed from Makefile
BASE_DIR=${BASE_DIR:0:-1}

echo "\n--- installing required pkgs ---\n"

echo "\ninstalling wget..."
sudo pacman -S wget

echo "\ninstalling zsh..."
sudo pacman -S zsh

echo "\ninstalling and configuring OMZ..."
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "\ninstalling and configuring p10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "\ninstalling vivid for LS_COLORS theme..."
sudo pacman -S vivid

echo "\n--- installing required pkgs -> finished ---\n"

echo "\n--- installing zsh plugins ---\n"

echo "\ninstalling zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "\ninstalling zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "\n--- installing zsh plugins -> finished ---\n"

echo "making zsh configs symlinks..."

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

echo "\nmaking configs symlinks..."
for i in ${!home_target_configs[@]}; do
  ln -sv "${home_target_configs[i]}" "${home_configs_paths[i]}"
done