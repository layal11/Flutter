import 'package:flutter/material.dart';
import 'dart:math';

//1.Widget class
class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

//2.State class
class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage = 'assets/images/dice-2.png';
  //declare here so that random() doesnt have to be re-executed every time the state object is created
  final randomizer = Random();

  //function
  rollDice() {
    var randomDice = randomizer.nextInt(6) + 1; //0-6
    setState(() {
      activeDiceImage = 'assets/images/dice-$randomDice.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          activeDiceImage,
          width: 200,
        ),
        const SizedBox(height: 100),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(15),
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const Text('Roll!'),
        ),
      ],
    );
  }
}
