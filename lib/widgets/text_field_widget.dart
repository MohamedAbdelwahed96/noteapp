import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final int minL, maxL;
  const TextFieldWidget({super.key, required this.controller, required this.hinttext, this.minL=1,this.maxL=1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromRGBO(242, 214, 241, 0.08),
          hintText: hinttext,
          hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(255, 255, 255, 0.7)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent))),
      minLines: minL,
      maxLines: maxL,
    );
  }
}
