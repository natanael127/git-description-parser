GIT_DESCRIPTION_STR=\"$(shell git describe --dirty=-dirty)\"
GIT_COMMIT_HASH_STR=\"$(shell git rev-parse --short HEAD)\"

CC := gcc
CFLAGS := -Wall
PRJFLAGS := -D_GIT_DESCRIPTION_STR=$(GIT_DESCRIPTION_STR) -D_GIT_COMMIT_HASH_STR=$(GIT_COMMIT_HASH_STR) -D_TEST_MODULE

all: git_description_parser.c git_description_parser.h
	@$(CC) $(CFLAGS) $(PRJFLAGS) -o git_description_parser.elf git_description_parser.c
clean:
	@find . -type f -name '*.o' -exec rm {} +
	@find . -type f -name '*.elf' -exec rm {} +
run: all
	@./git_description_parser.elf
