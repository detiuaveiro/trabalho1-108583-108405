# make              # to compile files and create the executables
# make pgm          # to download example images to the pgm/ dir
# make setup        # to setup the test files in test/ dir
# make tests        # to run basic tests
# make clean        # to cleanup object files and executables
# make cleanobj     # to cleanup object files only

CFLAGS = -Wall -O2 -g

PROGS = imageTool imageTest

TESTS = test1 test2 test3 test4 test5 test6 test7 test8 test9

# Default rule: make all programs
all: $(PROGS)

imageTest: imageTest.o image8bit.o instrumentation.o

imageTest.o: image8bit.h instrumentation.h

imageTool: imageTool.o image8bit.o instrumentation.o
imageTest: imageTest.o image8bit.o instrumentation.o error.o

imageTest.o: image8bit.h instrumentation.h

imageTool: imageTool.o image8bit.o instrumentation.o error.o

imageTool.o: image8bit.h instrumentation.h

# Rule to make any .o file dependent upon corresponding .h file
%.o: %.h

pgm:
	wget -O- https://sweet.ua.pt/jmr/aed/pgm.tgz | tar xzf -

.PHONY: setup
setup: test/

test/:
	wget -O- https://sweet.ua.pt/jmr/aed/test.tgz | tar xzf -
	@#mkdir -p $@
	@#curl -s -o test/aed-trab1-test.zip https://sweet.ua.pt/mario.antunes/aed/test/aed-trab1-test.zip
	@#unzip -q -o test/aed-trab1-test.zip -d test/

test1: $(PROGS) setup
	./imageTool test/original.pgm neg save neg.pgm
	cmp neg.pgm test/neg.pgm

test2: $(PROGS) setup
	./imageTool test/original.pgm thr 128 save thr.pgm
	cmp thr.pgm test/thr.pgm

test3: $(PROGS) setup
	./imageTool test/original.pgm bri .33 save bri.pgm
	cmp bri.pgm test/bri.pgm

test4: $(PROGS) setup
	./imageTool test/original.pgm rotate save rotate.pgm
	cmp rotate.pgm test/rotate.pgm

test5: $(PROGS) setup
	./imageTool test/original.pgm mirror save mirror.pgm
	cmp mirror.pgm test/mirror.pgm

test6: $(PROGS) setup
	./imageTool test/original.pgm crop 100,100,100,100 save crop.pgm
	cmp crop.pgm test/crop.pgm

test7: $(PROGS) setup
	./imageTool test/small.pgm test/original.pgm paste 100,100 save paste.pgm
	cmp paste.pgm test/paste.pgm

test8: $(PROGS) setup
	./imageTool test/small.pgm test/original.pgm blend 100,100,.33 save blend.pgm
	cmp blend.pgm test/blend.pgm

test9: $(PROGS) setup
	./imageTool test/original.pgm blur 7,7 save blur.pgm
	cmp blur.pgm test/blur.pgm

# testes adicionais para testar o blur
# pgm small
testblur1: $(PROGS) setup
	./imageTool pgm/small/art3_222x217.pgm blur 1,1 save blur.pgm toc

testblur2: $(PROGS) setup
	./imageTool pgm/small/art4_300x300.pgm blur 1,1 save blur.pgm toc

testblur3: $(PROGS) setup
	./imageTool pgm/small/bird_256x256.pgm blur 1,1 save blur.pgm toc

# pgm medium
testblur4: $(PROGS) setup
	./imageTool pgm/medium/airfield-05_640x480.pgm blur 1,1 save blur.pgm toc

testblur5: $(PROGS) setup
	./imageTool pgm/medium/tac-pulmao_512x512.pgm blur 1,1 save blur.pgm toc

testblur6: $(PROGS) setup
	./imageTool pgm/medium/tools_2_765x460.pgm blur 1,1 save blur.pgm toc

# pgm large
testblur7: $(PROGS) setup
	./imageTool pgm/large/airfield-05_1600x1200.pgm blur 1,1 save blur.pgm toc

testblur8: $(PROGS) setup
	./imageTool pgm/large/einstein_940x940.pgm blur 1,1 save blur.pgm toc

testblur9: $(PROGS) setup
	./imageTool pgm/large/ireland_03_1600x1200.pgm blur 1,1 save blur.pgm toc

testblur10: $(PROGS) setup
	./imageTool pgm/small/art3_222x217.pgm blur 3,3 save blur.pgm toc

testblur11: $(PROGS) setup
	./imageTool pgm/small/art4_300x300.pgm blur 3,3 save blur.pgm toc

testblur12: $(PROGS) setup
	./imageTool pgm/small/bird_256x256.pgm blur 3,3 save blur.pgm toc

testblur13: $(PROGS) setup
	./imageTool pgm/medium/airfield-05_640x480.pgm blur 3,3 save blur.pgm toc

testblur14: $(PROGS) setup
	./imageTool pgm/medium/tac-pulmao_512x512.pgm blur 3,3 save blur.pgm toc

testblur15: $(PROGS) setup
	./imageTool pgm/medium/tools_2_765x460.pgm blur 3,3 save blur.pgm toc

testblur16: $(PROGS) setup
	./imageTool pgm/large/airfield-05_1600x1200.pgm blur 3,3 save blur.pgm toc

testblur17: $(PROGS) setup
	./imageTool pgm/large/einstein_940x940.pgm blur 3,3 save blur.pgm toc

testblur18: $(PROGS) setup
	./imageTool pgm/large/ireland_03_1600x1200.pgm blur 3,3 save blur.pgm toc

testblur19: $(PROGS) setup
	./imageTool pgm/small/art3_222x217.pgm blur 6,6 save blur.pgm toc

testblur20: $(PROGS) setup
	./imageTool pgm/small/art4_300x300.pgm blur 6,6 save blur.pgm toc

testblur21: $(PROGS) setup
	./imageTool pgm/small/bird_256x256.pgm blur 6,6 save blur.pgm toc

testblur22: $(PROGS) setup
	./imageTool pgm/medium/airfield-05_640x480.pgm blur 6,6 save blur.pgm toc

testblur23: $(PROGS) setup
	./imageTool pgm/medium/tac-pulmao_512x512.pgm blur 6,6 save blur.pgm toc

testblur24: $(PROGS) setup
	./imageTool pgm/medium/tools_2_765x460.pgm blur 6,6 save blur.pgm toc

testblur25: $(PROGS) setup
	./imageTool pgm/large/airfield-05_1600x1200.pgm blur 6,6 save blur.pgm toc

testblur26: $(PROGS) setup
	./imageTool pgm/large/einstein_940x940.pgm blur 6,6 save blur.pgm toc

testblur27: $(PROGS) setup
	./imageTool pgm/large/ireland_03_1600x1200.pgm blur 6,6 save blur.pgm toc

testblur28: $(PROGS) setup
	./imageTool pgm/small/art3_222x217.pgm blur 9,9 save blur.pgm toc

testblur29: $(PROGS) setup
	./imageTool pgm/small/art4_300x300.pgm blur 9,9 save blur.pgm toc

testblur30: $(PROGS) setup
	./imageTool pgm/small/bird_256x256.pgm blur 9,9 save blur.pgm toc

testblur31: $(PROGS) setup
	./imageTool pgm/medium/airfield-05_640x480.pgm blur 9,9 save blur.pgm toc

testblur32: $(PROGS) setup
	./imageTool pgm/medium/tac-pulmao_512x512.pgm blur 9,9 save blur.pgm toc

testblur33: $(PROGS) setup
	./imageTool pgm/medium/tools_2_765x460.pgm blur 9,9 save blur.pgm toc

testblur34: $(PROGS) setup
	./imageTool pgm/large/airfield-05_1600x1200.pgm blur 9,9 save blur.pgm toc

testblur35: $(PROGS) setup
	./imageTool pgm/large/einstein_940x940.pgm blur 9,9 save blur.pgm toc

testblur36: $(PROGS) setup
	./imageTool pgm/large/ireland_03_1600x1200.pgm blur 9,9 save blur.pgm toc

testlocate1: $(PROGS) setup
	./imageTool test/small.pgm test/paste.pgm locate

testlocate2: $(PROGS) setup
	./imageTool test/small.pgm test/small.pgm locate

testlocate3: $(PROGS) setup
	./imageTool test/small.pgm test/blend.pgm locate

.PHONY: tests
tests: $(TESTS)

# Make uses builtin rule to create .o from .c files.

cleanobj:
	rm -f *.o

clean: cleanobj
	rm -f $(PROGS)

