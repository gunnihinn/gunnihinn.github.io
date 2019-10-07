blog: clean
	hugo

dev:
	hugo server -D

deploy: blog
	rsync -avz public gthmcloud:

.PHONY: clean
clean:
	rm -rf public
