import 'package:first_flutter_test/dice_roller.dart';
import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class FirstWidget extends StatelessWidget {
  // constructor function
  const FirstWidget(this.color1, this.color2, {super.key});

  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
// when calling it in main.dart
// FirstWidget(
//   Color.fromARGB(255, 164, 26, 172),
//   Color.fromARGB(255, 242, 143, 247),
// ),

//--------------------------------------------------------------------------
//--------------------------------------------------------------------------

// class FirstWidget extends StatelessWidget {
//   //constructor function (1. same as class name   2. has no return type)
//   const FirstWidget({required this.colors, super.key});
//   final List<Color> colors;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: colors,
//           begin: startAlignment,
//           end: endAlignment,
//         ),
//       ),
//       child: const StyledText('Hello there!'),
//     );
//   }
// }
// when calling it in main.dart
// FirstWidget(colors: [
//  Color.fromARGB(255, 164, 26, 172),
//  Color.fromARGB(255, 242, 143, 247),
// ]),

//--------------------------------------------------------------------------
//--------------------------------------------------------------------------


// class FirstWidget extends StatelessWidget {
//   //constructor function (1. same as class name   2. has no return type)
//   const FirstWidget(this.colors, {super.key});
//   final List<Color> colors;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: colors,
//           begin: startAlignment,
//           end: endAlignment,
//         ),
//       ),
//       child: const StyledText('Hello there!'),
//     );
//   }
// }
// when calling it in main.dart
// FirstWidget(
//  [Color.fromARGB(255, 164, 26, 172),
//  Color.fromARGB(255, 242, 143, 247),]
// ),

//--------------------------------------------------------------------------
//--------------------------------------------------------------------------

// class FirstWidget extends StatelessWidget {
//   //constructor function (1. same as class name   2. has no return type)
//   const FirstWidget({required this.color1, required this.color2, super.key});
//   final Color color1;
//   final Color color2;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [color1, color2],
//           begin: startAlignment,
//           end: endAlignment,
//         ),
//       ),
//       child: const StyledText('Hello there!'),
//     );
//   }
// }
// when calling it in main.dart
// FirstWidget(
//   color1: Color.fromARGB(255, 164, 26, 172),
//   color2: Color.fromARGB(255, 242, 143, 247),
// ),
