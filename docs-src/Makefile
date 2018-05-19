.PHONY: all check req propuesta

all: check req propuesta

check:
	./check-packages.sh
	./check-vendor.sh
	./check-ghi.sh

req:
	php requisitos.php -i

pro propuesta:
	#php requisitos.php
	pandoc -s propuesta.md requisitos.md -o pro.adoc
	./replace.sh
	asciidoctor-pdf propuesta.adoc
	rm -f pro.adoc propuesta.adoc
