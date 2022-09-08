BASE_DIR=$1 # BASE_DIR passed from Makefile
BASE_DIR=${BASE_DIR:0:-1}

home_target_configs=(
  $BASE_DIR/bash/.bashrc
  $BASE_DIR/bash/.bash_history
  $BASE_DIR/bash/.bash_profile

  $BASE_DIR/git/.gitconfig
)

home_configs_paths=(
  $HOME/.bashrc
  $HOME/.bash_history
  $HOME/.bash_profile
  
  $HOME/.gitconfig
)

kde_configs=(/kde/kdeglobals)
kde_configs_paths=($HOME/.kde4/share/config/)

for i in "${!home_target_configs[@]}"; do
  ln -sv "${home_target_configs[i]}" "${home_configs_paths[i]}"
done