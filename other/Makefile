# +----------------------------------------------------------------------------+
# | CDStore 0.5 * Command line CD catalogue                                    |
# | Copyright (C) 2002-2007 Pozsar Zsolt <pozsarzs@t-email.hu>                 |
# | Makefile                                                                   |
# | Make file for other files.                                                 |
# +----------------------------------------------------------------------------+

include ../Makefile.global

icofiles = `ls *.xpm`
cfgfiles = `ls *.cfg`

all:
	@echo

clean:
	@echo

install:
	@$(install) --directory $(sysconfdir)
	@for x in $(cfgfiles); do \
	  if [ -e $$x ]; then $(install) --mode $(txtmode) $$x $(sysconfdir); fi; \
	done
	@$(install) --directory $(datadir)/pixmaps
	@for x in $(icofiles); do \
	  if [ -e $$x ]; then $(install) --mode $(txtmode) $$x $(datadir)/pixmaps; fi; \
	done
	@$(install) --directory $(datadir)/applications
	@$(install) --mode $(txtmode) $(name).desktop $(datadir)/applications
	@echo "Done."

uninstall:
	@for x in $(cfgfiles); do \
	  if [ -e $$x ]; then $(rm) $(sysconfdir)/$$x; fi; \
	done
	@for x in $(icofiles); do \
	  if [ -e $$x ]; then $(rm) $(datadir)/pixmaps/$$x; fi; \
	done
	@$(rm) --directory $(datadir)/applications/$(name).desktop
	@echo "Done."

deb:
	@$(install) --directory /tmp/$(sysconfdir)
	@for x in $(cfgfiles); do \
	  if [ -e $$x ]; \
	  then \
	    $(install) --mode $(txtmode) $$x /tmp/$(sysconfdir); \
	    md5sum /tmp$(sysconfdir)/$$x | sed 's/\/tmp//' >> /tmp/md5sums; \
	  fi; \
	done
	@$(install) --directory /tmp/$(datadir)/pixmaps
	@for x in $(icofiles); do \
	  if [ -e $$x ]; \
	  then \
	    $(install) --mode $(txtmode) $$x /tmp/$(datadir)/pixmaps; \
	    md5sum /tmp$(datadir)/pixmaps/$$x | sed 's/\/tmp//' >> /tmp/md5sums; \
	  fi; \
	done
	@$(install) --directory /tmp/$(datadir)/applications
	@$(install) --mode $(txtmode) $(name).desktop /tmp/$(datadir)/applications
	@md5sum /tmp/$(datadir)/applications/$(name).desktop | sed 's/\/tmp//' >> /tmp/md5sums
	@echo "Done."

rpm:
	@$(install) --directory /usr/src/RPM/BUILD$(sysconfdir)
	@echo mkdir --mode 755 --parent $(sysconfdir) >> /tmp/$(name).spec.pre
	@for x in $(cfgfiles); do \
	  if [ -e $$x ]; \
	  then \
	    $(install) --mode $(txtmode) $$x /usr/src/RPM/BUILD$(sysconfdir); \
	    echo $(sysconfdir)/$$x >> /tmp/$(name).spec.files; \
	  fi; \
	done
	@$(install) --directory /usr/src/RPM/BUILD$(datadir)/pixmaps
	@echo mkdir --mode 755 --parent $(datadir)/pixmaps >> /tmp/$(name).spec.pre
	@for x in $(icofiles); do \
	  if [ -e $$x ]; \
	  then \
	    $(install) --mode $(txtmode) $$x /usr/src/RPM/BUILD$(datadir)/pixmaps; \
	    echo $(datadir)/pixmaps/$$x >> /tmp/$(name).spec.files; \
	  fi; \
	done
	@$(install) --directory /usr/src/RPM/BUILD/$(datadir)/applications
	@echo mkdir --mode 755 --parent $(datadir)/applications >> /tmp/$(name).spec.pre
	@$(install) --mode $(txtmode) $(name).desktop /usr/src/RPM/BUILD/$(datadir)/applications
	@echo $(datadir)/applications/$(name).desktop >> /tmp/$(name).spec.files
	@echo "Done."

tgz:
	@$(install) --directory /tmp$(sysconfdir)
	@for x in $(cfgfiles); do \
	  if [ -e $$x ]; then $(install) --mode $(txtmode) $$x /tmp$(sysconfdir); fi; \
	done
	@$(install) --directory /tmp/$(datadir)/pixmaps
	@for x in $(icofiles); do \
	  if [ -e $$x ]; \
	  then \
	    $(install) --mode $(txtmode) $$x /tmp/$(datadir)/pixmaps; \
	  fi; \
	done
	@$(install) --directory /tmp/usr/share/applications
	@$(install) --mode $(txtmode) $(name).desktop /tmp/usr/share/applications
	@echo "Done."

apack:
	@$(install) --directory /tmp/apbuildroot/share/applications
	@$(install) --mode $(txtmode) $(name).desktop /tmp/apbuildroot/share/applications
	@$(install) --directory /tmp/apbuildroot/share/$(name)
	@$(install) --mode $(txtmode) $(name).cfg /tmp/apbuildroot/share/$(name)
	@$(install) --directory /tmp/apbuildroot/share/pixmaps
	@$(install) --mode $(txtmode) $(name).xpm /tmp/apbuildroot/share/pixmaps
	@echo "Done."
