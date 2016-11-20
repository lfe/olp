REBAR3 = PATH=$(shell pwd):$(PATH) rebar3
RELX = PATH=$(shell pwd):$(PATH) relx
RELX_REPO = https://github.com/erlware/relx.git
RELX_DIR = relx-repo
RELX_BUILD_PATH = $(RELX_DIR)/_build/default
LFEX_ORG = https://github.com/lfex
OLP_BUILD_PATHS = _build/*
OLP_REL = _build/default/rel/olp
OLP_BIN = $(OLP_REL)/bin
DOCKER_DIR = priv/docker
DOCKER_TAG_NAME = lfex/olp
DOCKER_TAG_VERSION = latest
DOCKER_TAG = $(DOCKER_TAG_NAME):$(DOCKER_TAG_VERSION)

all: sources
	$(REBAR3) release
	@#rm $(OLP_BIN)/start_clean.boot

tarball:
	$(REBAR3) tar

clean:
	rebar3 clean
	cd lfe && make clean
	rm -rf $(OLP_BUILD_PATHS)/rel rebar.lock

clean-all: clean docker-clean
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

docker-build: all
	mkdir -p $(DOCKER_DIR)/tmp
	cp -r $(OLP_REL) $(DOCKER_DIR)/tmp
	docker build -t $(DOCKER_TAG) $(DOCKER_DIR)
	rm -rf $(DOCKER_DIR)/tmp

docker-run:
	docker run -i -t $(DOCKER_TAG)

docker-run-bash:
	docker run -i -t $(DOCKER_TAG) bash

docker-publish:
	docker push $(DOCKER_TAG)

docker-clean:
	@-docker rm `docker ps -a -q`
	@-docker rmi `docker images -q --filter 'dangling=true'`
