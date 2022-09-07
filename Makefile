SHELL := /bin/bash
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))

all: help

install_pkgs:
	@source ${mkfile_dir}/scripts/install_pkgs.sh

setup_configs:
	@source ${mkfile_dir}/scripts/setup_configs.sh ${mkfile_dir}

help:
	@echo "neo_dotfiles by @neotod"
	@echo ""
	@echo "Available targets:"
	@echo "install_pkgs - Installing necessary packages, from AUR and snap."
	@echo "setup_configs - Making symlinks from configs' paths to configs in this repo."