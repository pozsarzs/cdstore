# +----------------------------------------------------------------------------+
# | CDStore 0.5 * Command line CD catalogue                                    |
# | Copyright (C) 2002-2007 Pozsar Zsolt <pozsarzs@t-email.hu>                 |
# | Makefile                                                                   |
# | Make file for message files.                                               |
# +----------------------------------------------------------------------------+

include ../Makefile.global

languages = hu hu.UTF-8

all:
	@echo

clean:
	@echo

install:
	@for x in $(languages); do \
	  if [ -e $(name)_$$x.msg ]; \
	  then \
	    $(install) --directory $(datadir)/locale/$$x; \
	    $(install) --mode $(txtmode) $(name)_$$x.msg $(datadir)/locale/$$x; \
	    mv $(datadir)/locale/$$x/$(name)_$$x.msg $(datadir)/locale/$$x/$(name).msg ; \
	  fi; \
	done
	@echo "Done."

uninstall:
	@for x in $(languages); do \
	  if [ -e $(name)_$$x.msg ]; \
	  then \
	    $(rm) $(datadir)/locale/$$x/$(name).msg; \
	  fi; \
	done
	@echo "Done."

deb:
	@for x in $(languages); do \
	  if [ -e $(name)_$$x.msg ]; \
	  then \
	    $(install) --directory /tmp$(datadir)/locale/$$x; \
	    $(install) --mode $(txtmode) $(name)_$$x.msg /tmp$(datadir)/locale/$$x; \
	    mv /tmp$(datadir)/locale/$$x/$(name)_$$x.msg /tmp$(datadir)/locale/$$x/$(name).msg ; \
	    md5sum /tmp$(datadir)/locale/$$x/$(name).msg | sed 's/\/tmp//' >> /tmp/md5sums; \
	  fi; \
	done
	@echo "Done."

rpm:
	@for x in $(languages); do \
	  if [ -e $(name)_$$x.msg ]; \
	  then \
	    echo mkdir --mode 755 --parent $(datadir)/locale/$$x >> /tmp/$(name).spec.pre; \
	    echo $(datadir)/locale/$$x/$(name).msg >> /tmp/$(name).spec.files; \
	    $(install) --directory /usr/src/RPM/BUILD$(datadir)/locale/$$x; \
	    $(install) --mode $(txtmode) $(name)_$$x.msg /usr/src/RPM/BUILD$(datadir)/locale/$$x; \
	    mv /usr/src/RPM/BUILD$(datadir)/locale/$$x/$(name)_$$x.msg /usr/src/RPM/BUILD$(datadir)/locale/$$x/$(name).msg ; \
	  fi; \
	done
	@echo "Done."

tgz:
	@for x in $(languages); do \
	  if [ -e $(name)_$$x.msg ]; \
	  then \
	    $(install) --directory /tmp$(datadir)/locale/$$x; \
	    $(install) --mode $(txtmode) $(name)_$$x.msg /tmp$(datadir)/locale/$$x; \
	    mv /tmp$(datadir)/locale/$$x/$(name)_$$x.msg /tmp$(datadir)/locale/$$x/$(name).msg ; \
	  fi; \
	done
	@echo "Done."

apack:
	@for x in $(languages); do \
	  if [ -e $(name)_$$x.msg ]; \
	  then \
	    $(install) --directory /tmp/apbuildroot/share/$(name)/msg/; \
	    $(install) --mode $(txtmode) $(name)_$$x.msg /tmp/apbuildroot/share/$(name)/msg/; \
	  fi; \
	done
	@echo "Done."
