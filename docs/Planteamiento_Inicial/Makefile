.PHONY: all check req propuesta install milestones tags pdf

all: check req propuesta

check:
	./check-required.sh && \
	./.sh
	./.sh

milestones:
	./generate-milestones.sh

tags:
	./generate-tags.sh

pdf:
	./generate-pdf.sh

req:
	php requisitos.php -i

install:
    ./install-required.sh
