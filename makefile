CC = gcc
TOPDIR := $(shell pwd)
INCDIR := $(TOPDIR)/inc
SRCDIR := $(TOPDIR)/src

CPPFLAGS := -I.
CFLAGS := -fno-builtin -Wall -O2

export CC TOPDIR SRCDIR CPPFLAGS CFLAGS

TARGET = main
SRCS := $(wildcard *.c)
SRCS += $(foreach dir, $(SRCDIR), $(wildcard $(dir)/*.c))
OBJS := $(patsubst %.c,%.o, $(SRCS))
OBJS_D := $(patsubst %.c,%.d, $(SRCS))

#all:$(TARGET) debug
$(TARGET):$(OBJS)
	$(CC) $(OBJS) -o $(TARGET)
$(OBJS):%.o:%.c
	$(CC) -c $(CPPFLAGS) -o $@ $(CFLAGS) $^

.PHONY : debug
debug:
	@echo "src = $(SRCS),objs = $(OBJS)."

.PHONY : clean
clean:
	rm -rf add.o main.o main.d
	make clean -C src
