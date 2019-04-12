
CFLAGS = -std=c++11 -Wall -O3   #-DHTTP_V11
LDFLAGS = -pthread 
CC = g++
SRC = WS.cpp HTTPParser.cpp
HDR = HTTPParser.h
OBJ = $(SRC:%.cpp=%.o)
#GDB = gdb --args

server: $(OBJ)
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

%.o: %.cpp ${HDR}
	$(CC) $(CFLAGS) -c $<

SERVER = 10.0.0.1
PORT = 9000
OUT = output
DIR = ${PWD}
TIMEOUT = 10
WLOG = html/tempfiles/url.log
#RATE = 5000
#RATE = 100 200 300 400 500 1000 2000 3000 4000 5000 
RATE = 100 200 300 400 500 1000 2000 3000 4000 5000 \
       6000 7000 8000 10000 15000 
#RATE =  3000 4000 5000 
#RATE = 10 20 30 40 50
#RATE = 500

.PHONY: run
run: 
	$(GDB) ./server -dir ${DIR}/html -port ${PORT}


.PHONY: clean
clean:
	rm -rf *.o

.PHONY: clean_all cleanall
cleanall clean_all:
	$(MAKE) -C . clean
	rm -rf server
