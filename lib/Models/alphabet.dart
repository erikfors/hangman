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

  List<Letters> getAvailableLetter(bool getAvailable){
    List<Letters> returnedLetters = [];

    for(var alphabetLetter in alphabet.entries){
      if(alphabetLetter.value == getAvailable){
        returnedLetters.add(alphabetLetter.key);
      }
    }

    return returnedLetters;
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
