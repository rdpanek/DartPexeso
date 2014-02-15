library pexeso_model;
import 'package:shuffle/shuffle.dart';

List<int> createShuffledCards(int numOfPairs) {
  var cards = [];
  for (var i = 0; i < numOfPairs; i++) {
    cards.add(i);
    cards.add(i);
  }
  return shuffle(cards);
}


class Game {
  final int numPlayers;
  final List<int> score;
  final List cards;
  
  int playerOnTurn;
  
  Game(numPlayers, this.playerOnTurn, this.cards)
    : this.numPlayers = numPlayers,
      score = new List.filled(numPlayers, 0);
  
  factory Game.withCards(numPlayers, numOfPairs) {
    return new Game(numPlayers, 0, createShuffledCards(numOfPairs));
  }
  
  turnCards(int first, int second) {
    if (cards[first] == cards[second]) {
      score[playerOnTurn]++;
      return true;
    } else {
      playerOnTurn = (playerOnTurn + 1) % numPlayers;
      return false;
    }
  }
  
}