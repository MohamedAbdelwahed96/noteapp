import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final name;
  const ButtonWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 154,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white),
      child: Center(
          child: Text(name,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black))),
    );
  }
}
