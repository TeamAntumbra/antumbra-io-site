clean:
	rm -rf build/
pull:
	git pull origin master
push:
	git push origin master
update: push pull
run:
	bundle exec middleman
test: run
verify: build
	bundle exec htmlproof ./build/

