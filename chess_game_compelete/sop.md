Assignment

Build a command line Chess game where two players can play against each other. (class Player)
The game should be properly constrained – it should prevent players from making illegal moves and declare check or check mate in the correct situations. (class Rules)
Make it so you can save the board at any time (remember how to serialize?) (class SaveGame (serialization)

Write tests for the important parts. You don’t need to TDD it (unless you want to), but be sure to use RSpec tests for anything that you find yourself typing into the command line repeatedly.

Do your best to keep your classes modular and clean and your methods doing only one thing each. This is the largest program that you’ve written, so you’ll definitely start to see the benefits of good organization (and testing) when you start running into bugs.

Unfamiliar with Chess? Check out some of the additional resources to help you get your bearings.
Have fun! Check out Wikipedia’s unicode chess characters for a little spice for your gameboard.
Extra credit
Build a very basic AI computer player (perhaps who does a random legal move).

lets start by writing tests first



- Key componnents of the game: Board, Player, Logic, SaveGame, Pieces
- Display Board class
- Rules (Game Logic)
- 

main.rb

class Board

class Player
class GameLogic
class SaveGame (serialization)

Pieces
    class King
    class Queen
    class Beshop
    class Kight
    class Rook
    class Pawn