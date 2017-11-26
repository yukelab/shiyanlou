executbale := complicated
sources := $(wildcard *.c)
objects := $(sources:.c=.o)
deps    := $(sources:.c=.d)
CC := gcc
RM := rm -rf
sinclude $(dep)
$(deps):%.d :%.c
	$(CC) -MM $< > $@
$(executbale): $(objects)
	$(CC) -o $@ $^

$(objects):%.o :%.c
	$(CC) -o $@ -c $<
#	echo "\$$@ = $@"
#	echo "$$< = $<"

.PHONY:clean
clean:
	$(RM) $(executbale) $(objects) $(deps)

