cmd_scripts/basic/fixdep := gcc -Wp,-MMD,scripts/basic/.fixdep.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89       -I ./scripts/basic   -o scripts/basic/fixdep /home/danila/Downloads/pf-kernel-v5.9-pf6/scripts/basic/fixdep.c   

source_scripts/basic/fixdep := /home/danila/Downloads/pf-kernel-v5.9-pf6/scripts/basic/fixdep.c

deps_scripts/basic/fixdep := \
    $(wildcard include/config/his/driver.h) \
    $(wildcard include/config/my/option.h) \
    $(wildcard include/config/foo.h) \

scripts/basic/fixdep: $(deps_scripts/basic/fixdep)

$(deps_scripts/basic/fixdep):
