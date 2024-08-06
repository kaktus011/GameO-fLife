class gameOfLife {
  private static final int X = 48;
  private static final int Y = 80;
  private static final char LIVE_CELL = '@';
  private static final char DEAD_CELL = '-';
  
  private static int[][] successor = new int[X][];
  private static int[][] current = new int[X][];

  public static void main(String[] args) {
    for (int i = 0; i < X; i++) {
      current[i] = new int[Y];
      successor[i] = new int[Y];
    }

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
  }

  public static void updateCurrent() {
    for (int i = 0; i < X; i++) {
      for (int k = 0; k < Y; k++) {
        current[i][k] = successor[i][k];
      }
    }
  }

  public static void printSuccessor() {
    for (int i = 0; i < X; i++) {
      for (int k = 0; k < Y; k++) {
        if (successor[i][k] == 1)
          System.out.print(LIVE_CELL);
        else 
          System.out.print(DEAD_CELL);
      }
      System.out.println();
    }
    System.out.println();
    System.out.println();
  }

  public static void getNextGeneration() {
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

    //end the game when current and succesor are the same
    if(!gameEnd()) {
      updateCurrent();

      try {
        Thread.sleep(175);
      } 
      catch (InterruptedException e) {
        System.out.println(e);
      }

      printSuccessor();
      getNextGeneration();
    }
  }

  public static int getLiveNeighbours(int x, int y) {
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

  public static boolean gameEnd() {
    for (int i = 0; i < X; i++) {
      for (int k = 0; k < Y; k++) {
        if (successor[i][k] != current[i][k])
          return false;
      }
    }

    return true;
  }
}
