CC = gcc
CFLAGS = -c -std=c89 -I "./include/"
SOURCES = $(wildcard src/*.c)
OBJS = $(patsubst src/%.c, src/%.o, $(SOURCES))

.PHONY: all clean

all: soil.a

src/%.o: src/%.c
	$(CC) $(CFLAGS) $< -o $@

soil.a: $(OBJS)
	$(info >>> Creating a static library)
	ar rcs $@ $(OBJS)

clean:
	rm -rf *.o
	rm -rf *.a
	rm -rf *.out