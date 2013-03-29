build: dist/setup
	obuild build

dist/setup: reporter.obuild
	obuild configure

clean:
	rm -rf dist test.html

run: build
	./dist/build/ocl-reporter-new/ocl-reporter-new 

www:
	cd pages && env PATH=../ucampas:$PATH ucampas -i -r1  # index people projects activity
