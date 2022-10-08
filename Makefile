blog: clean
	hugo

dev:
	hugo server -D

.PHONY: clean
clean:
	rm -rf docs
