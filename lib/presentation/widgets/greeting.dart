import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:uts_2072001/presentation/widgets/avatar.dart';

class Greeting extends StatelessWidget {
  const Greeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Welcome Matthew 😎',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "Let's relax and watch a movie !",
              style: TextStyle(fontSize: 17, color: Colors.white),
            ),
          ],
        ),
        const Avatar()
      ],
    );
  }
}
