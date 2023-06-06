CXX = g++
CXX_FLAGS = -Wall -Wextra -Werror -pedantic -std=c++17
SFML_LIB = ExtLibs/lib
SFML_INCLUDE = ExtLibs/include
SRC_DIR = code/
TEST_DIR = tests/

all: build launch #clean

build: compile link

compile:
	$(CXX) $(CXX_FLAGS) -I$(SFML_INCLUDE) -c $(SRC_DIR)*.cpp

link:
	$(CXX) $(CXX_FLAGS) *.o -o DuelingDrifters -L$(SFML_LIB) -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio

launch:
	./DuelingDrifters

test_main:
	$(CXX) $(CXX_FLAGS) $(TEST_DIR)test_main.cpp -c

test_carObj: test_main
	$(CXX) $(CXX_FLAGS) test_main.o carObj.o $(TEST_DIR)test_carObj.cpp -o TestCarObj
	./TestCarObj --success

clean:
	del *.o
	del *.exe