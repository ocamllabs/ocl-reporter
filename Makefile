build: dist/setup
	obuild build

dist/setup: reporter.obuild
	obuild configure

clean:
	rm -rf dist test.html

run: build
	./dist/build/ocl-reporter-new/ocl-reporter-new 

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
