REBAR3 = PATH=$(shell pwd):$(PATH) rebar3
RELX = PATH=$(shell pwd):$(PATH) relx
RELX_REPO = https://github.com/erlware/relx.git
RELX_DIR = relx-repo
RELX_BUILD_PATH = $(RELX_DIR)/_build/default
LFEX_ORG = https://github.com/lfex
OLP_BUILD_PATHS = _build/*

all: sources
	$(REBAR3) release
	$(REBAR3) tar

clean:
	rebar3 clean
	cd lfe && make clean
	rm -rf $(OLP_BUILD_PATHS)/rel rebar.lock

clean-all: clean
	rm -rf _build

sources:
	git submodule init
	git submodule update

update-lfe:
	cd lfe && git checkout master && git pull && cd - && git add lfe

update-libs:
	for LIB in `find lib -mindepth 1 -maxdepth 1`; \
	do \
	cd $$LIB && git checkout master && git pull && cd - && git add $$LIB; \
	done

update-sources: update-lfe update-libs
	git commit lfe lib -m "Updated sources."

add-lib:
	git submodule add $(LFEX_ORG)/$(OLD_LIB) lib/$(OLP_LIB)
	git commit lib/$(OLP_LIB) -m "Added $(OLP_LIB) library to OLP."

setup-rebar3:
	wget https://s3.amazonaws.com/rebar3/rebar3
	chmod +x rebar3

setup-relx:
	git clone $(RELX_REPO) $(RELX_DIR)
	cd $(RELX_DIR) && $(REBAR3) update && $(REBAR3) escriptize
	mv $(RELX_BUILD_PATH)/bin/relx .
	rm -rf $(RELX_DIR)

travis-build: setup-rebar3 setup-relx all

