BASE_DIR=$1 # BASE_DIR passed from Makefile
BASE_DIR=${BASE_DIR:0:-1}

home_configs=(
  $BASE_DIR/bash/.bashrc
  $BASE_DIR/bash/.bash_history
  $BASE_DIR/bash/.bash_profile

  $BASE_DIR/git/.gitconfig

  $BASE_DIR/zsh/.zshrc
  $BASE_DIR/zsh/.zsh_history
)

home_configs_paths=(
  $HOME/.bashrc
  $HOME/.bash_history
  $HOME/.bash_profile
  
  $HOME/.gitconfig

  $HOME/.zshrc
  $HOME/.zsh_history
)

kde_configs=(/kde/kdeglobals)
kde_configs_paths=($HOME/.kde4/share/config/)

for i in "${!home_configs[@]}"; do
  ln -sv "${home_configs[i]}" "${home_configs_paths[i]}"
done