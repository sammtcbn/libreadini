all: libreadini

SYMBONAME = libreadini.so
MAJOR = .1
MINOR = .0.1
SONAME = $(SYMBONAME)$(MAJOR)
FILENAME = $(SONAME)$(MINOR)

libreadini: ReadINI.o
	$(CC) $(CFLAGS) -shared -fPIC -Wl,-soname,$(SONAME) -o $(FILENAME) ReadINI.o -lc
	ln -sf $(FILENAME) $(SONAME)
	ln -sf $(SONAME) $(SYMBONAME)

ReadINI.o: ReadINI.c
	$(CC) $(CFLAGS) -fPIC -c ReadINI.c

clean:
	rm -f *.o ReadINI.o libreadini.so*
