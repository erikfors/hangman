class Alphabet {
  Map<Letters, bool> alphabet = {
    Letters.A: false,
    Letters.B: false,
    Letters.C: false,
    Letters.D: false,
    Letters.E: false,
    Letters.F: false,
    Letters.G: false,
    Letters.H: false,
    Letters.I: false,
    Letters.J: false,
    Letters.K: false,
    Letters.L: false,
    Letters.M: false,
    Letters.N: false,
    Letters.O: false,
    Letters.P: false,
    Letters.Q: false,
    Letters.R: false,
    Letters.S: false,
    Letters.T: false,
    Letters.U: false,
    Letters.V: false,
    Letters.W: false,
    Letters.X: false,
    Letters.Y: false,
    Letters.Z: false,
  };

  Alphabet.includeAll() {
    alphabet.updateAll((key, value) => true);
  }

  List<Letters> getAvailableLetter(bool getAvailable) {
    List<Letters> returnedLetters = [];

    for (var alphabetLetter in alphabet.entries) {
      if (alphabetLetter.value == getAvailable) {
        returnedLetters.add(alphabetLetter.key);
      }
    }

    return returnedLetters;
  }

  Map<Letters, bool> getAllLetters() {
    return alphabet;
  }

  static String getChar(Letters letter) {
    switch (letter) {
      case Letters.A:
        return 'A';
      case Letters.B:
        return 'B';
      case Letters.C:
        return 'C';
      case Letters.D:
       return 'D';
      case Letters.E:
        return 'E';
      case Letters.F:
        return 'F';
      case Letters.G:
        return 'G';
      case Letters.H:
        return 'H';
      case Letters.I:
        return 'I';
      case Letters.J:
        return 'J';
      case Letters.K:
        return 'K';
      case Letters.L:
        return 'L';
      case Letters.M:
        return 'M';
      case Letters.N:
        return 'N';
      case Letters.O:
        return 'O';
      case Letters.P:
        return 'P';
      case Letters.Q:
        return 'Q';
      case Letters.R:
        return 'R';
      case Letters.S:
        return 'S';
      case Letters.T:
        return 'T';
      case Letters.U:
        return 'U';
      case Letters.V:
        return 'V';
      case Letters.W:
        return 'W';
      case Letters.X:
        return 'X';
      case Letters.Y:
        return 'Y';
      case Letters.Z:
        return 'Z';
    }
  }
}

enum Letters {
  A,
  B,
  C,
  D,
  E,
  F,
  G,
  H,
  I,
  J,
  K,
  L,
  M,
  N,
  O,
  P,
  Q,
  R,
  S,
  T,
  U,
  V,
  W,
  X,
  Y,
  Z
}
