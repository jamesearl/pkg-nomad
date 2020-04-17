NAME=nomad
VERSION=0.11.0
REVISION=1
NOMAD_VERSION=$(VERSION)
MAINT=james.earl.3@gmail.com

DEB=$(NAME)_$(VERSION)-$(REVISION)

DEB_64=$(DEB)_amd64.deb
SRC_64=https://releases.hashicorp.com/nomad/$(NOMAD_VERSION)/nomad_$(NOMAD_VERSION)_linux_amd64.zip

.PHONY: dev publish-gemfury ls uninstall install clean

dev: clean build

build: dist/$(DEB_64)

publish-gemfury:
	fury push dist/$(DEB_64) --public

ls:
	gemfury versions "$(NAME)"

bin/:
	mkdir -p ./bin

dist/:
	mkdir -p ./dist

bin/nomad_$(NOMAD_VERSION)_linux_amd64: bin/
	wget -nc -nv -O - $(SRC_64) | gunzip >bin/nomad_$(NOMAD_VERSION)_linux_amd64
	chmod +x bin/nomad_$(NOMAD_VERSION)_linux_amd64

dist/$(DEB_64): dist/ bin/nomad_$(NOMAD_VERSION)_linux_amd64
	fpm -s dir \
		-t deb \
		-p dist/$(DEB_64) \
		-n $(NAME) \
		--provides $(NAME) \
		-v $(VERSION) \
		--iteration $(REVISION) \
		-a amd64 \
		-m $(MAINT) \
		--deb-no-default-config-files \
		bin/nomad_$(NOMAD_VERSION)_linux_amd64=/usr/bin/nomad

clean:
	rm -rf dist/*

uninstall:
	apt remove -y $(NAME) || true

install:
	apt install -y --reinstall --allow-downgrades ./dist/$(DEB_64)
