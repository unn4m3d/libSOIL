MAKE = make
CC = gcc
INSTALL_FILE = install -m 644
INSTALL_DIR = install -d
LIBTOOL = libtool
LN = ln -s
RM = rm -fv
CFLAGS += -c -O2 -Wall
LDFLAGS += -framework OpenGL -framework CoreFoundation

CFILES = image_DXT.c image_helper.c SOIL.c stb_image_aug.c stb_image_write.c
OFILES = $(CFILES:.c=.o)
LIBNAME = libSOIL

HFILES = SOIL.h image_DXT.h image_helper.h \
  stbi_DDS_aug.h stbi_DDS_aug_c.h stb_image_aug.h stb_image_write.h
AFILE = libSOIL.a
INCLUDEDIR = /usr/local/include
LIBDIR = /usr/local/lib

all: $(OFILES) lib

%.o: %.c
	$(CC) $(CFLAGS) $< -o $@

lib: $(OFILES)
	# create static library
	$(LIBTOOL) -static -o $(AFILE) $(OFILES)

install:
	$(INSTALL_DIR) $(INCLUDEDIR)
	$(INSTALL_FILE) $(HFILES) $(INCLUDEDIR)
	$(INSTALL_DIR) $(LIBDIR)
	$(INSTALL_FILE) $(AFILE) $(LIBDIR)

clean:
	$(RM) *.o
	$(RM) *~

distclean: clean
	$(RM) $(AFILE)

.PHONY: all lib clean distclean
