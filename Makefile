install:
	npm install
	bower install

clean:
	git clean -fxd

run:
	jekyll serve --watch --baseurl=''

build:
	grunt
