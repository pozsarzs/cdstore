# +----------------------------------------------------------------------------+
# | CDStore 0.5 * Command line CD catalogue                                    |
# | Copyright (C) 2002-2007 Pozsar Zsolt <pozsarzs@t-email.hu>                 |
# | Makefile                                                                   |
# | Make file for packaging files.                                             |
# +----------------------------------------------------------------------------+

include ../Makefile.global

install:
	@echo

uninstall:
	@echo

deb:
	@cp control postinst /tmp
	@chmod 755 /tmp/postinst
	@echo "2.0" > /tmp/debian-binary
	@echo "Done."

rpm:
	@cp $(name).spec.info /tmp/$(name).spec
	@cp $(name).spec.post /tmp
	@cp $(name).spec.changelog /tmp
	@echo "Done."

tgz:
	@mkdir --parent /tmp/install
	@cp doinst.sh slack-desc /tmp/install/
	@echo "Done."

apack:
	@echo "Done."

