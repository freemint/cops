#
# Makefile for cops
#

SHELL = /bin/sh
SUBDIRS = 

srcdir = .
top_srcdir = .
subdir = .

installdir = /opt/GEM/cops
cpu = all

default: help

include $(srcdir)/COPSDEFS

include $(top_srcdir)/CONFIGVARS
include $(top_srcdir)/RULES
include $(top_srcdir)/PHONY

all-here: all-targets

# default overwrites

# default definitions
compile_all_dirs = .compile_*
GENFILES = $(compile_all_dirs)

help:
	@echo '#'
	@echo '# targets:'
	@echo '# --------'
	@echo '# - all'
	@echo '# - $(copstargets)'
	@echo '#'
	@echo '# - install'
	@echo '# - clean'
	@echo '# - distclean'
	@echo '# - bakclean'
	@echo '# - strip'
	@echo '# - help'
	@echo '#'
	@echo '# example for a ColdFire binary: -> make col'
	@echo '#'
	@echo '# To install single CPU binary: ->'
	@echo '# make install cpu=<CPU> installdir=<DIR>'
	@echo '#'

strip:
	@set fnord $(MAKEFLAGS); amf=$$2; \
	for i in $(copstargets); do \
		(set -x; \
		($(STRIP) .compile_$$i/*.app) \
		|| case "$$amf" in *=*) exit 1;; *k*) fail=yes;; *) exit 1;; esac); \
	done && test -z "$$fail"

all-targets:
	@set fnord $(MAKEFLAGS); amf=$$2; \
	for i in $(copstargets); do \
		echo "Making $$i"; \
		($(MAKE) $$i) \
		|| case "$$amf" in *=*) exit 1;; *k*) fail=yes;; *) exit 1;; esac; \
	done && test -z "$$fail"

install: $(cpu)
	$(MKDIR) -p $(installdir)
ifeq ($(cpu), all)
	@set -x; \
	for i in $(copstargets); do \
		$(CP) .compile_$$i/cops.app $(installdir)/cops$$i.app; \
		chmod 755 $(installdir)/cops$$i.app; \
		$(STRIP) $(installdir)/cops$$i.app; \
	done
else
	$(CP) .compile_$(cpu)/cops.app $(installdir)/cops.app
	chmod 755 $(installdir)/cops.app
	$(STRIP) $(installdir)/cops.app
endif
	$(CP) $(srcdir)/copsicn.rsc $(installdir)

$(copstargets):
	$(MAKE) buildcops cops=$@

#
# multi target stuff
#

ifneq ($(cops),)

compile_dir = .compile_$(cops)
copstarget = _stmp_$(cops)
realtarget = $(copstarget)

$(copstarget): $(compile_dir)
	cd $(compile_dir); $(MAKE) all

$(compile_dir): Makefile.objs
	$(MKDIR) -p $@
	$(CP) $< $@/Makefile

else

realtarget =

endif

buildcops: $(realtarget)
