# Top level makefile, the real shit is at src/makefile

TARGETS=noopt 32bit

PACKAGEDIR=package/rpm
PACKAGE_VERSION=1.2.12

all:
	cd src && $(MAKE) $@

install:
	cd src && $(MAKE) $@

$(TARGETS):
	cd src && $(MAKE) $@

doc:
	cd doc && $(MAKE)

test:
	cd test && $(MAKE)

TAGS:
	find . -type f -name "*.[ch]" | xargs etags -

build-rpm:
	rpmbuild -bb $(PACKAGEDIR)/zlog.spec \
	    --define "root `pwd`/src"        \
	    --define "zlog_version $(PACKAGE_VERSION)" \
	    --define "zlog_major $(ZLOG_MAJOR)" \
	    --define "zlog_minor $(ZLOG_MINOR)"
clean:
	cd src && $(MAKE) $@
	cd test && $(MAKE) $@
	cd doc && $(MAKE) $@
	rm -f TAGS

distclean: clean

dummy:

.PHONY: doc install test TAGS
