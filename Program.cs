namespace gameOfLife;

class Program
{
  private const int X = 64;
  private const int Y = 64;
  private const char LIVE_CELL = '@';
  private const char DEAD_CELL = '-';

  private static int[][] successor = new int[X][];
  private static int[][] current = new int[X][];
  private static string[] patterns = {"Blinker", "Glider"};

  static void Main(string[] args)
  {
    string currentPatterns = "";
    for (int i = 0; i < patterns.Length; i++) {
      if (i < patterns.Length - 1)
        currentPatterns += patterns[i] + " or ";
      else
        currentPatterns += patterns[i];
    }
    Console.WriteLine("Hello, Conway!");
    Console.WriteLine("Which pattern do you choose?");
    Console.WriteLine(currentPatterns + " (write your choice)");

    string? pattern = Console.ReadLine();
    while (pattern == null || !FindPattern(pattern)) {
      Console.WriteLine("Which pattern do you choose?");
      Console.WriteLine(currentPatterns + " (write your choice)");

      pattern = Console.ReadLine();
    }
    
    Init(pattern);
  }

  static void Init(string pattern) {
    for (int i = 0; i < X; i++) {
      successor[i] = new int[Y];
      current[i] = new int[Y];
    }

    if (pattern == "Glider") {
      successor[X / 2][Y / 2] = 1;
      successor[X / 2][Y / 2 + 1] = 1;
      successor[X / 2][Y / 2 + 2] = 1;
      successor[X / 2 + 1][Y / 2 + 2] = 1;
      successor[X / 2 + 2][Y / 2 + 1] = 1;
    }
    else if (pattern == "Blinker") {
      successor[X / 2][Y / 2] = 1;
      successor[X / 2][Y / 2 + 1] = 1;
      successor[X / 2][Y / 2 + 2] = 1;
    }

    Swap();
    PrintSuccessor();
  }

  static void Cycle() {
    for (int i = 0; i < X; i++) {
      for (int k = 0; k < Y; k++) {
        int liveNeighbours = CheckNeighbours(i, k);

        if (current[i][k] == 1 && liveNeighbours < 2)
          successor[i][k] = 0;
        else if (current[i][k] == 1 && liveNeighbours > 3)
          successor[i][k] = 0;
        else if (current[i][k] == 0 && liveNeighbours == 3)
          successor[i][k] = 1;
      }
    }

    Swap();

    if (HasLiveNeighbour(successor)) {
      Thread.Sleep(250);
      PrintSuccessor();
    }
  }

  static void PrintSuccessor() {
    Console.WriteLine();
    for (int i = 0; i < X; i++) {
      for (int k = 0; k < Y; k++) {
        if (successor[i][k] == 1)
          Console.Write(LIVE_CELL);
        else
          Console.Write(DEAD_CELL);
      }
      Console.WriteLine();
    }

    Console.WriteLine();
    for (int i = 0; i < X; i++)
      Console.Write('+');
    Console.WriteLine();

    Cycle();
  }

  static bool HasLiveNeighbour(int[][] turn) {
    for (int i = 0; i < X; i++) {
      for (int k = 0; k < Y; k++) {
        if (turn[i][k] == 1)
          return true;
      }
    }

    return false;
  }

  static int CheckNeighbours(int x, int y) {
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

  static void Swap() {
    for (int i = 0; i < X; i++) {
      for (int k = 0; k < Y; k++) {
        current[i][k] = successor[i][k];
      }
    }
  }

  static bool FindPattern(string pattern) {
    foreach (var currPat in patterns) {
      if (pattern == currPat)
        return true;
    }

    return false;
  }
}
