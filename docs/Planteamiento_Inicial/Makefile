.PHONY: all check req requisitos propuesta install milestones tag tags pdf

all: install req propuesta milestones tags check pdf

install:
	./install-required.sh

check:
	./check-required.sh

milestones:
	./generate-milestones.sh

tag tags:
	./generate-tags.sh

pdf:
	./generate-pdf.sh

req requisitos:
	php requisitos.php -i
