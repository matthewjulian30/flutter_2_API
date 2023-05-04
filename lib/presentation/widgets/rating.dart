import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Rating extends StatelessWidget {
  String rating;

  Rating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          size: 15,
          color: Colors.amber,
        ),
        const SizedBox(
          width: 5,
        ),
        rating != '' ? Text(
          '$rating / 10',
          style: const TextStyle(color: Colors.white),
        )
        : const Text(
          'soon',
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
