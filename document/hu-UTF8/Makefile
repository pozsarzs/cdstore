# +----------------------------------------------------------------------------+
# | CDStore 0.5 * Command line CD catalogue                                    |
# | Copyright (C) 2002-2007 Pozsar Zsolt <pozsarzs@t-email.hu>                 |
# | Makefile                                                                   |
# | Make file for documents.                                                   |
# +----------------------------------------------------------------------------+

include ../../Makefile.global

docfiles = README
doclangdir = hu-UTF8/
man8file = cds.8
langdir = hu/

all:
	@echo

clean:
	@echo

install:
	@$(install) --directory $(datadir)/doc/$(name)-$(debver)/$(doclangdir)
	@for x in $(docfiles); do \
	  if [ -e $$x ]; \
	  then $(install) --mode $(txtmode) $$x $(datadir)/doc/$(name)-$(debver)/$(doclangdir)$$x; \
	  fi; \
	done
	@$(install) --directory $(datadir)/man/$(langdir)man8
	@$(install) --mode $(txtmode) $(man8file) $(datadir)/man/$(langdir)man8
	@echo "Done."

uninstall:
	@$(RM) $(datadir)/doc/$(name)-$(debver)/$(doclangdir)*
	@rmdir $(datadir)/doc/$(name)-$(debver)/$(doclangdir)
	@$(RM) $(datadir)/man/$(langdir)man8/$(man8file)
	@echo "Done."

deb:
	@$(install) --directory /tmp$(datadir)/doc/$(name)-$(debver)/$(doclangdir)
	@for x in $(docfiles); do \
	  if [ -e $$x ]; \
	  then \
	    $(install) --mode $(txtmode) $$x /tmp$(datadir)/doc/$(name)-$(debver)/$(doclangdir)$$x; \
	    md5sum /tmp$(datadir)/doc/$(name)-$(debver)/$(doclangdir)$$x | sed 's/\/tmp//' >> /tmp/md5sums; \
	  fi; \
	done
	@$(install) --directory /tmp$(datadir)/man/$(langdir)man8
	@$(install) --mode $(txtmode) $(man8file) /tmp$(datadir)/man/$(langdir)man8
	@md5sum /tmp$(datadir)/man/$(langdir)man8/$(man8file) | sed 's/\/tmp//' >> /tmp/md5sums;
	@echo "Done."

rpm:
	@$(install) --directory /usr/src/RPM/BUILD$(datadir)/doc/$(name)-$(debver)/$(doclangdir)
	@echo mkdir --mode 755 --parent $(datadir)/doc/$(name)-$(debver)/$(doclangdir) >> /tmp/$(name).spec.pre
	@echo rmdir $(datadir)/doc/$(name)-$(debver)/$(doclangdir) >> /tmp/$(name).spec.postun
	@for x in $(docfiles); do \
	  if [ -e $$x ]; \
	  then \
	    echo $(datadir)/doc/$(name)-$(debver)/$(doclangdir)$$x >> /tmp/$(name).spec.files; \
	    $(install) --mode $(txtmode) $$x /usr/src/RPM/BUILD$(datadir)/doc/$(name)-$(debver)/$(doclangdir); \
	  fi; \
	done
	@$(install) --directory /usr/src/RPM/BUILD$(datadir)/man/$(langdir)man8
	@echo mkdir --mode 755 --parent $(datadir)/man/$(langdir)man8 >> /tmp/$(name).spec.pre
	@echo $(datadir)/man/$(langdir)man8/$(man8file) >> /tmp/$(name).spec.files
	@$(install) --mode $(txtmode) $(man8file) /usr/src/RPM/BUILD$(datadir)/man/$(langdir)man8
	@echo "Done."

tgz:
	@$(install) --directory /tmp$(datadir)/doc/$(name)-$(debver)/$(doclangdir)
	@for x in $(docfiles); do \
	  if [ -e $$x ]; \
	  then \
	    $(install) --mode $(txtmode) $$x /tmp$(datadir)/doc/$(name)-$(debver)/$(doclangdir)$$x; \
	  fi; \
	done
	@$(install) --directory /tmp$(datadir)/man/$(langdir)man8
	@$(install) --mode $(txtmode) $(man8file) /tmp$(datadir)/man/$(langdir)man8
	@echo "Done."

apack:
	@$(install) --directory /tmp/apbuildroot/share/$(name)/doc/$(doclangdir)
	@for x in $(docfiles); do \
	  if [ -e $$x ]; \
	  then \
	    $(install) --mode $(txtmode) $$x /tmp/apbuildroot/share/$(name)/doc/$(doclangdir)$$x; \
	  fi; \
	done
	@echo "Done."
