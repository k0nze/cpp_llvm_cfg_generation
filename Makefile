TARGET=main

all: $(TARGET).png

$(TARGET).ll: $(TARGET).cc
	clang++ -emit-llvm -S $(TARGET).cc -o $(TARGET).ll

cfg.$(TARGET).dot: $(TARGET).ll
	opt --dot-cfg $(TARGET).ll

$(TARGET).png: cfg.$(TARGET).dot
	dot -Tpng cfg.$(TARGET).dot -o $(TARGET).png

.PHONY clean:
	-rm *.png
	-rm cfg.*
	-rm *.ll
