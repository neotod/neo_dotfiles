BASE_DIR=$1 # BASE_DIR passed from Makefile
BASE_DIR=${BASE_DIR:0:-1}


config_paths=(
  $HOME/.config/kdeglobals
  $HOME/.config/kscreenlockerrc
  $HOME/.config/kwinrc
  $HOME/.config/kwinrulesrc
  $HOME/.config/gtkrc
  $HOME/.config/gtkrc-2.0
  $HOME/.config/gtk-4.0/
  $HOME/.config/gtk-3.0/
  $HOME/.config/Trolltech.conf
  $HOME/.config/kglobalshortcutsrc
  $HOME/.config/khotkeysrc
  $HOME/.config/plasmanotifyrc
  $HOME/.config/ktimezonedrc
  $HOME/.config/powermanagementprofilesrc
  $HOME/.local/share/konsole/
  $HOME/.config/okularpartrc
  $HOME/.config/okularrc
)

kde_configs_target_paths=(
  $BASE_DIR/kde/kdeglobals
  $BASE_DIR/kde/kscreenlockerrc
  $BASE_DIR/kde/kwinrc
  $BASE_DIR/kde/kwinrulesrc
  $BASE_DIR/kde/gtkrc
  $BASE_DIR/kde/gtkrc-2.0
  $BASE_DIR/kde/gtk-4.0/
  $BASE_DIR/kde/gtk-3.0/
  $BASE_DIR/kde/Trolltech.conf
  $BASE_DIR/kde/kglobalshortcutsrc
  $BASE_DIR/kde/khotkeysrc
  $BASE_DIR/kde/plasmanotifyrc
  $BASE_DIR/kde/ktimezonedrc
  $BASE_DIR/kde/powermanagementprofilesrc
  $BASE_DIR/konsole/
  $BASE_DIR/okular/okularpartrc
  $BASE_DIR/okular/okularrc
)

for i in "${!config_paths[@]}"; do
  rm ${config_paths[i]}
  ln -sv "${kde_configs_target_paths[i]}" "${config_paths[i]}"
done