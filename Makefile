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
