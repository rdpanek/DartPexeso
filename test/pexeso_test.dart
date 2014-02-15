import 'package:unittest/unittest.dart';
import 'package:DartPexeso/pexeso_model.dart';

void main() {
  
  group("Test of model.",(){
    test("Cards provided by createShuffledCards are enumerated from 0 to"
        " numOfPairs - 1 and each card is contained exactly twice.", () {
          expect(
            createShuffledCards(8), 
            unorderedEquals([0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7])
          );
        });
    group("Turning cards", () {
      Game game;
      var numPlayers, playerOnTurn, nextPlayer;
      List cards;
      
      setUp((){
         numPlayers = 4;
         playerOnTurn = 3;
         nextPlayer = 0;
         cards = [0, 1, 2, 0, 1, 2];
         game = new Game(numPlayers, playerOnTurn, cards);
      });
      
      test("that are the same increases the score by 1 and do not change the"
          " playerOnTurn. The return value is true.", () {
            expect(game.turnCards(0, 3), isTrue);
            expect(game.playerOnTurn, equals(playerOnTurn));
            expect(game.score[playerOnTurn], equals(1));
          });
      test("that do not match does not affect the score and next player gets"
          " turn. The return value is false.",() {
            expect(game.turnCards(0, 1), isFalse);
            expect(game.playerOnTurn, equals(nextPlayer));
            expect(game.score, orderedEquals(new List.filled(numPlayers, 0)));
      });
    });
  });
}