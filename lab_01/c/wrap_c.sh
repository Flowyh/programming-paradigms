gcc -c lib.c ada_wrap.c # Compile C library
gcc main.c ada_wrap.o lib.o -o main.out # Compile C program
./main.out # Run
rm -f *.o main.out # Remove footprint