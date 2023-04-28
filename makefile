CXX = g++
CXX_FLAGS = -Wall -Wextra -Werror -pedantic -std=c++20
SRC_DIR = code
TEST_DIR = tests

all: build launch clean

build: compile link

compile:
	${CXX} ${CXX_FLAGS} -Isrc/include -c code/*.cpp

link:
	${CXX} ${CXX_FLAGS} *.o -o carbrawl -Lsrc/lib -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio

launch:
	./carbrawl

clean:
	del *.o
	del *.exe