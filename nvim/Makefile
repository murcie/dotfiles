CONFIG_PATH = $(HOME)/.config/nvim/
CACHE_PATH = $(HOME)/.cache/nvim/
DATA_PATH = $(HOME)/.local/share/nvim/

RM := rm -rf
MKDIR := mkdir -p
CP := cp -r

CONFIG_SRC = $(PWD)/config

.PHONY: help
help:
	@echo '---------------------------'
	@echo 'SetUp/Remove Neovim configs'
	@echo '---------------------------'

.PHONY: rmconfig
rmconfig:
	$(RM) $(CONFIG_PATH)
.PHONY: rmcache
rmcache:
	$(RM) $(CACHE_PATH)
.PHONY: rmdata
rmdata:
	$(RM) $(DATA_PATH)

.PHONY: rmall
rmall: rmconfig rmcache rmdata

.PHONY: config
config: rmall
	$(CP) $(CONFIG_SRC) $(CONFIG_PATH)

