blog: clean
	hugo

dev:
	hugo server -D

deploy: blog
	rsync -avz public janitor@gthm:

.PHONY: clean
clean:
	rm -rf public
