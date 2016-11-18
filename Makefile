REBAR3 = PATH=`pwd`:$(PATH) rebar3
RELX = PATH=`pwd`:$(PATH) relx
RELX_REPO = https://github.com/erlware/relx.git
RELX_DIR = relx-repo
RELX_BUILD_PATH = $(RELX_DIR)/_build/default/bin

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

setup-rebar3:
	wget https://s3.amazonaws.com/rebar3/rebar3
	chmod +x rebar3

setup-relx:
	git clone $(RELX_REPO) $(RELX_DIR)
	cd $(RELX_DIR) && $(REBAR3) update && $(REBAR3) escriptize
	mv $(RELX_BUILD_PATH)/relx .
	rm -rf $(RELX_DIR)

travis-build: setup-rebar3 setup-relx sources

