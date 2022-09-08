BASE_DIR=$1 # BASE_DIR passed from Makefile
BASE_DIR=${BASE_DIR:0:-1}

echo ""
echo "--- installing required pkgs ---"
echo ""

echo "installing wget..."
sudo pacman -S wget

echo "installing zsh..."
sudo pacman -S zsh

echo "installing and configuring OMZ..."
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "installing and configuring p10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo ""
echo "--- installing required pkgs -> finished ---"
echo ""

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

echo ""
echo "making configs symlinks..."
for i in ${!home_target_configs[@]}; do
  ln -sv "${home_target_configs[i]}" "${home_configs_paths[i]}"
done