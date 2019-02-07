demo:
	HUGO_ENV=production hugo server -D

generate:
	HUGO_ENV=production hugo
	rm -fr _deploy/[a-z0-9]*
	cp -pr public/* _deploy/

push:
	cd _deploy; git add *; git commit -asv && git push
