build:
	ocamlbuild -j 4 -use-ocamlfind -package omd,cohttp.lwt,core,cow,cow.syntax,lwt,netstring,sexplib.syntax,syndic,uri,ocaml_planet -tag thread -syntax camlp4o lib/www.native

clean:
	rm -rf _build

run: build
	./_build/lib/www.native

www:
	cd pages && env PATH=../ucampas:$$PATH ucampas -i -r3 index people tasks papers news

check:
	echo If you get an error with this, do brew install linklint
	rm -rf lint
	mkdir -p lint
	linklint -net -doc lint -root pages /@

cron:
	@git pull -u >/dev/null
	@cd pages && rsync --delete -aqz . /anfs/www/html/projects/ocamllabs/

PLANET?=~/inst/planet-2.0/planet.py
planet-pages:
	cd planet && rm -rf cache && $(PLANET) ocamllabs-planet.ini
	mkdir -p pages/blogs/images
	cp planet/templates/images/* pages/blogs/images/
