blog: clean
	hugo

deploy: blog
	rsync -avz public gthmcloud:

.PHONY: clean
clean:
	rm -rf public
