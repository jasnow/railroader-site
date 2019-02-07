demo:
	HUGO_ENV=production hugo server -D

generate:
	HUGO_ENV=production hugo
	cp -pr public/ _deploy/

push:
	cd _deploy; git push
