BASE_DIR=$1 # BASE_DIR passed from Makefile
BASE_DIR=${BASE_DIR:0:-1}

kde_safe_configs_target_paths=(
  $BASE_DIR/kde/kglobalshortcutsrc
)

kde_safe_configs_paths=(
  $HOME/.config/kglobalshortcutsrc
)

echo -e "\n\nmaking configs symlinks..."
for i in ${!kde_safe_configs_target_paths[@]}; do
  mv "${kde_safe_configs_paths[i]}" "${kde_safe_configs_paths[i]}.old"
  ln -sv "${kde_safe_configs_target_paths[i]}" "${kde_safe_configs_paths[i]}"
done

echo -e "\n\nNote that old config files are copied with .old addedd to end of their name."
echo -e "\nIf you want to delete the old ones, go and do it urself with hand :)"
