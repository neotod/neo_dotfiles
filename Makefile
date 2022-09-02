SHELL := /bin/bash

install_pkgs:
	@source ./scripts/install_pkgs.sh

help:
	@echo install_pkgs - Installing necessary packages, from AUR and snap.