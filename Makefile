build: dist/setup
	ocamlbuild -j 4 -use-ocamlfind -package core,cow,cow.syntax,sexplib.syntax,uri -tag thread -syntax camlp4o lib/www.native

clean:
	rm -rf dist test.html

run: build
	./_build/lib/www.native

www:
	cd pages && env PATH=../ucampas:$$PATH ucampas -i -r1 index people tasks outputs news

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
