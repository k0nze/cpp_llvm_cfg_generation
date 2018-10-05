TARGET=main

all: main.png

main.ll: main.cc
	clang++ -emit-llvm -S main.cc -o main.ll

cfg.main.dot: main.ll
	opt --dot-cfg main.ll

main.png: cfg.main.dot
	dot -Tpng cfg.main.dot -o main.png

.PHONY clean:
	-rm *.png
	-rm cfg.*
	-rm *.ll
