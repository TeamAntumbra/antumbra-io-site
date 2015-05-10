>PHONY: clean, pull, push, update, run, build, verify, test
clean:
	rm -rf build/
pull:
	git pull origin master
push: verify
	git push origin master
update: pull push
run:
	bundle exec middleman
test: run
build: clean
	bundle exec middleman build
verify: build
	bundle exec htmlproof ./build/ --check-html --check-favicon

