blog: clean
	hugo

dev:
	hugo server -D

magnusson.io.tar.gz: blog
	pushd public && tar -cvf $@ *
	mv public/$@ .

deploy: magnusson.io.tar.gz
	rsync -avz $< janitor@gthm:

.PHONY: clean
clean:
	rm -rf public
