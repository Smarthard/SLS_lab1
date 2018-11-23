CC=gcc
BDIR=./build
CFLAGS=-Wall -std=gnu99 -pedantic -Werror -Wextra
TARGET=tee
SRC=$(wildcard *.c)
OBJ=$(SRC:%.c=build/%.o)

tee: $(OBJ)
	$(CC) -o $(TARGET) $(OBJ)

build/%.o: %.c
	mkdir -p $(BDIR)
	$(CC) $(CFLAGS) -c -g -o $@ $< 
clean:
	rm -rf $(BDIR)
