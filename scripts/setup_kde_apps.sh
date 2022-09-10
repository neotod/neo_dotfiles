BASE_DIR=$1 # BASE_DIR passed from Makefile
BASE_DIR=${BASE_DIR:0:-1}


config_paths=(
  $HOME/.local/share/konsole/
  $HOME/.config/okularpartrc
  $HOME/.config/okularrc
)

kde_configs_target_paths=(
  $BASE_DIR/konsole/
  $BASE_DIR/okular/okularpartrc
  $BASE_DIR/okular/okularrc
)

for i in "${!config_paths[@]}"; do
  rm -rf ${config_paths[i]}
  ln -sv "${kde_configs_target_paths[i]}" "${config_paths[i]}"
done