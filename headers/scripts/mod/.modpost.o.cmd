cmd_scripts/mod/modpost.o := gcc -Wp,-MMD,scripts/mod/.modpost.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89       -I ./scripts/mod -c -o scripts/mod/modpost.o /home/danila/Downloads/pf-kernel-v5.9-pf6/scripts/mod/modpost.c

source_scripts/mod/modpost.o := /home/danila/Downloads/pf-kernel-v5.9-pf6/scripts/mod/modpost.c

deps_scripts/mod/modpost.o := \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/module/srcversion/all.h) \
    $(wildcard include/config/relocatable.h) \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/retpoline.h) \
    $(wildcard include/config/section/mismatch/warn/only.h) \
  /home/danila/Downloads/pf-kernel-v5.9-pf6/scripts/mod/modpost.h \
  scripts/mod/elfconfig.h \
  /home/danila/Downloads/pf-kernel-v5.9-pf6/scripts/mod/../../include/linux/license.h \

scripts/mod/modpost.o: $(deps_scripts/mod/modpost.o)

$(deps_scripts/mod/modpost.o):
