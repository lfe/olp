sources:
	git submodule init
	git submodule update

update-sources:
	cd lfe && git checkout master && git pull && cd ../ && git add lfe
