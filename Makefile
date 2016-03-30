build:
	ocamlbuild -j 4 -use-ocamlfind -package omd,cohttp.lwt,core,cow,cow.syntax,lwt,netstring,river,pa_sexp_conv.syntax,syndic,uri -tag thread,annot -syntax camlp4o lib/www.native

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
