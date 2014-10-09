
# current version
VERSION=0.1.0

#################################################################
# main

all: upnpdump

upnpdump: $(PB_GO) FORCE
	@echo "Building upnpdump"
	go build github.com/inercia/miniupnp/cmd/upnpdump

test: upnpdump
	go test ./...

clean:
	@echo "Cleaning upnpdump"
	@go clean
	rm -f upnpdump *~ */*~

#################################################################
# deps

get: deps
deps:
	@echo "Getting all dependencies..."
	go get -d ./...

distclean-deps:
	for PKG in $$GOPATH/src/*/* ; do \
		if [ -d $$PKG ] ; then \
			[ `basename $$PKG` != "inercia" ] && rm -rf $$PKG ; \
		fi ; \
	done
	rm -rf $$GOPATH/pkg

FORCE:
