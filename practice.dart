import 'dart:io';
import 'dart:math';

void main() {
  print('Welcome to the Adventure Game!');
  print('You find yourself in a mysterious forest.');
  print('You need to find the treasure and make it out alive.\n');

  bool gameOver = false;
  int treasureCount = 0;

  while (!gameOver) {
    print('What do you want to do?');
    print('1. Look for treasure');
    print('2. Go deeper into the forest');
    print('3. Quit the game');

    String? userInput = stdin.readLineSync();

    switch (userInput) {
      case '1':
        print('You search for treasure...');
        sleep(Duration(seconds: 2));

        int randomChance = Random().nextInt(10);

        if (randomChance < 5) {
          print('Oops! You triggered a trap. Game over!');
          gameOver = true;
        } else {
          print('Congratulations! You found a treasure!');
          treasureCount++;

          if (treasureCount == 3) {
            print('You have collected all the treasures. You win!');
            gameOver = true;
          }
        }
        break;

      case '2':
        print('You decide to go deeper into the forest...');
        sleep(Duration(seconds: 2));
        print('You get lost and can\'t find your way back.');
        print('You give up and exit the forest. Game over!');
        gameOver = true;
        break;

      case '3':
        print('Thank you for playing the Adventure Game!');
        gameOver = true;
        break;

      default:
        print('Invalid input. Please try again.');
        break;
    }

    print('\n');
  }
}
