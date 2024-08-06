#include <iostream>
#include <chrono>
#include <thread>

const int X = 48;
const int Y = 80;
const char LIVE_CELL = '@';
const char DEAD_CELL = '-';

int current[X][Y];
int successor[X][Y];

void delayBetweenGenerations() {
  using namespace std::this_thread;
  using namespace std::chrono;

  sleep_for(nanoseconds(150000000)); //0.15 seconds
}

void updateCurrent() {
  for (int i = 0; i < X; i++) {
    for(int k = 0; k < Y; k++) {
      current[i][k] = successor[i][k];
    }
  }
}

bool gameEnd() {
  for (int i = 0; i < X; i++) {
    for(int k = 0; k < Y; k++) {
      if (current[i][k] != successor[i][k])
        return false;
    }
  }
  return true;
}

void printSuccessor() {
  for (int i = 0; i < X; i++) {
    for(int k = 0; k < Y; k++) {
      if (successor[i][k] == 1)
        std::cout << LIVE_CELL;
      else 
        std::cout << DEAD_CELL;
    }
    std::cout << "\n";
  }
  std::cout << "\n";
  std::cout << "\n";
}

int getLiveNeighbours(int x, int y) {
  int live = 0;

  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      if (x + i < 0 || x + i >= X)
        continue;
      if (y + j < 0 || y + j >= Y)
        continue;
      if (x + i == x && y + j == y)
        continue;

      live += current[x + i][y + j];
    }
  }
  return live;
}

void getNextGeneration() {
  for (int i = 0; i < X; i++) {
    for (int k = 0; k < Y; k++) {
      int liveNeighbours = getLiveNeighbours(i, k);

      if (current[i][k] == 1 && liveNeighbours < 2)
        successor[i][k] = 0;
      else if (current[i][k] == 1 && liveNeighbours > 3)
        successor[i][k] = 0;
      else if (current[i][k] == 0 && liveNeighbours == 3)
        successor[i][k] = 1;
    }
  }

  if (!gameEnd()) {
    updateCurrent();
    delayBetweenGenerations();
    printSuccessor();
    getNextGeneration();
  }
}

int main() {
    std::cout << "Welcome to the c++ version of conway's game of life" << std::endl;
    //LWSS
    successor[X / 2][Y / 2] = 1;
    successor[X / 2][Y / 2 + 1] = 1;

    successor[X / 2 + 1][Y / 2 - 2] = 1;
    successor[X / 2 + 1][Y / 2 - 1] = 1;
    successor[X / 2 + 1][Y / 2 + 1] = 1;
    successor[X / 2 + 1][Y / 2 + 2] = 1;

    successor[X / 2 + 2][Y / 2] = 1;
    successor[X / 2 + 2][Y / 2 + 1] = 1;
    successor[X / 2 + 2][Y / 2 - 1] = 1;
    successor[X / 2 + 2][Y / 2 - 2] = 1;

    successor[X / 2 + 3][Y / 2] = 1;
    successor[X / 2 + 3][Y / 2 - 1] = 1;

    updateCurrent();
    printSuccessor();
    getNextGeneration();

    return 0;
}
