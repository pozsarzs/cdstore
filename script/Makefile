# +----------------------------------------------------------------------------+
# | CDStore 0.5 * Command line CD catalogue                                    |
# | Copyright (C) 2002-2007 Pozsar Zsolt <pozsarzs@t-email.hu>                 |
# | Makefile                                                                   |
# | Make file for scripts.                                                     |
# +----------------------------------------------------------------------------+

include ../Makefile.global

binfiles = cds cdsdialog xcdsdialog

install:
	@$(install) --directory $(bindir)
	@for x in $(binfiles); do \
	  if [ -f $$x ]; then $(install) --mode $(binmode) $$x $(bindir); fi; \
	done
	@echo "Done."

uninstall:
	@for x in $(binfiles); do $(rm) $(bindir)/$$x; done
	@echo "Done."

deb:
	@$(install) --directory /tmp/$(bindir)
	@for x in $(binfiles); do \
	  if [ -f $$x ]; \
	  then \
	    $(install) --mode $(binmode) $$x /tmp/$(bindir); \
	    md5sum /tmp$(bindir)/$$x | sed 's/\/tmp//' >> /tmp/md5sums; \
	  fi; \
	done
	@echo "Done."

rpm:
	@$(install) --directory /usr/src/RPM/BUILD$(bindir)
	@echo mkdir --mode 755 --parent $(bindir) >> /tmp/$(name).spec.pre
	@for x in $(binfiles); do \
	  if [ -f $$x ]; \
	  then \
	    $(install) --mode $(binmode) $$x /usr/src/RPM/BUILD$(bindir); \
	    echo $(bindir)/$$x >> /tmp/$(name).spec.files; \
	  fi; \
	done
	@echo "Done."

tgz:
	@$(install) --directory /tmp/$(bindir)
	@for x in $(binfiles); do \
	  if [ -f $$x ]; then $(install) --mode $(binmode) $$x /tmp/$(bindir); \
	  fi; \
	done
	@echo "Done."

apack:
	@$(install) --directory /tmp/apbuildroot/share/$(name)
	@for x in $(binfiles); do \
	  if [ -f $$x ]; \
	  then \
	    $(install) --mode $(binmode) $$x /tmp/apbuildroot/share/$(name); \
	  fi; \
	done
	@echo "Done."
