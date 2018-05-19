.PHONY: all check req requisitos install milestones tag tags pdf

all: install milestones tags check pdf

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

## Sube los requisitos a GitHub
req requisitos:
	php requisitos.php -i
