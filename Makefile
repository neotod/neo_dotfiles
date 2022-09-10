SHELL := /bin/bash
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))

all: help

install_pkgs:
	@source ${mkfile_dir}/scripts/install_pkgs.sh

setup_zsh:
	@source ${mkfile_dir}/zsh/setup_zsh.sh ${mkfile_dir}

setup_configs:
	@source ${mkfile_dir}/scripts/setup_configs.sh ${mkfile_dir}

setup_kde:
	@source ${mkfile_dir}/scripts/setup_kde.sh ${mkfile_dir}

help:
	@echo "neo_dotfiles by @neotod"
	@echo ""
	@echo "Available targets:"
	@echo "install_pkgs - Installing necessary packages, from AUR and snap."
	@echo "setup_configs - Making symlinks from configs' reall path to configs in this repo."
	@echo "setup_zsh - Setting up 'zsh' related stuff."
	@echo "setup_kde - Setting up kde and kde softwares(okular, etc) configs. By making symlinks."