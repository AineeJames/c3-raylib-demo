run: main
	./main

clean:
	rm -f main

main: main.c3 raylib.c3
	c3c -l extern/raylib-5.0_macos/lib/libraylib.a -l Cocoa.framework -l IOKit.framework -o main compile main.c3 raylib.c3 box.c3 constants.c3
