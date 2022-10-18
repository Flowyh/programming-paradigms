gcc -c ../c/lib.c # Compile C library
gnatmake wrap_c.adb -largs lib.o # Compile ada
./wrap_c # Run
rm -f *.ali *.o wrap_c # Remove footprint