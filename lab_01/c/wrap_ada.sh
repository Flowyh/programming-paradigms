gnatmake ../ada/lib.adb # Compile ada library
gcc -c main.c # Compile C program
gnatbind -n lib.ali # Run binder
gnatlink lib.ali main.o # Link lib.ali and main.o
./lib # Run 
rm -f lib.ali lib.o main.o lib # Remove footprint