# +----------------------------------------------------------------------------+
# | CDStore 0.5 * Command line CD catalogue                                    |
# | Copyright (C) 2002-2007 Pozsar Zsolt <pozsarzs@t-email.hu>                 |
# | Makefile                                                                   |
# | Make file for Linux.                                                       |
# +----------------------------------------------------------------------------+
include ./Makefile.global

dirs =	document/hu document/hu-UTF8 document message package other script

install:
	@for dir in $(dirs); do \
	  if [ -e Makefile ]; then make -C $$dir install; fi; \
	done
	@package/postinst
	@echo "Programme is installed."

uninstall:
	@for dir in $(dirs); do \
	  if [ -e Makefile ]; then make -C $$dir uninstall; fi; \
	done
	@echo "Programme is removed."

deb:
	@$(rm) /tmp/md5sums
	@for dir in $(dirs); do \
	  if [ -e Makefile ]; then make -C $$dir deb; fi; \
	done
	@cd /tmp; tar --create --gzip --file control.tar.gz control md5sums \
	  postinst; tar --create --gzip --file data.tar.gz .$(prefix); \
	  $(rm) $(name)*.deb; ar q $(name)_$(version)_all.deb \
	  debian-binary control.tar.gz data.tar.gz; \
	  mv $(name)_$(version)_all.deb /usr/src/; \
	  $(rm) --recursive .$(prefix); $(rm) control control.tar.gz \
	  data.tar.gz debian-binary md5sums postinst
	@echo "Debian package is created under /usr/src directory."

rpm:
	@echo %pre >> /tmp/$(name).spec.pre
	@echo %files >> /tmp/$(name).spec.files
	@echo %postun >> /tmp/$(name).spec.postun
	@for dir in $(dirs); do \
	  if [ -e Makefile ]; then make -C $$dir rpm; fi; \
	done
	@cat /tmp/$(name).spec.pre /tmp/$(name).spec.post \
	  /tmp/$(name).spec.postun /tmp/$(name).spec.files \
	  package/$(name).spec.changelog >> /tmp/$(name).spec
	@$(rm) /tmp/$(name).spec.pre /tmp/$(name).spec.post \
	  /tmp/$(name).spec.postun /tmp/$(name).spec.files
	@rpm -bb /tmp/$(name).spec 1>/dev/null
	@$(rm) --recursive /usr/src/RPM/BUILD/*
	@echo "RedHat package is created under /usr/src/RPM directory."

tgz:
	@for dir in $(dirs); do \
	  if [ -e Makefile ]; then make -C $$dir tgz; fi; \
	done
	@cd /tmp; \
	tar --create --gzip --file $(name)-$(version)-noarch-1.tgz .$(prefix) install/*; \
	mv $(name)-$(version)-noarch-1.tgz /usr/src/; \
	$(rm) --recursive .$(prefix); \
	$(rm) /tmp/install/slack-desc /tmp/install/doinst.sh;\
	rmdir /tmp/install
	@echo "Slackware package is created under /usr/src directory."

apack:
	@for dir in $(dirs); do \
	  if [ -e Makefile ]; then make -C $$dir apack; fi; \
	done
	@makeinstaller
	@$(rm) --recursive /tmp/apbuildroot
	@mv 'CDStore Disc catalogue '$(debver)'.package' cdstore-$(debver).package
	@mv cdstore-$(debver).package /usr/src/cdstore-$(debver).package
	@echo "Autopackage package is created under /usr/src directory."
