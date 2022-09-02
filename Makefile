SHELL := /bin/bash

all: help

install_pkgs:
	@source ./scripts/install_pkgs.sh

help:
	@echo "neo_dotfiles by @neotod"
	@echo ""
	@echo "Available targets:"
	@echo install_pkgs - Installing necessary packages, from AUR and snap.