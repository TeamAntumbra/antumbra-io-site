clean:
	rm -rf build/
pull:
	git pull origin master
push:
	git push origin master
update: push pull
run:
	bundle exec middleman
build:
	bundle exec middleman build
test: build
	cd build/
	python -m SimpleHTTPServer

