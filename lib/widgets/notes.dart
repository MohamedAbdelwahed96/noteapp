import 'package:flutter/material.dart';

class NotesWidget extends StatelessWidget {
  final title, content, time;
  const NotesWidget({super.key, this.title,this.content,this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromRGBO(242, 214, 241, 0.14)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(content,
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(217, 217, 217, 1))),
                const Spacer(),
                Text(time,
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(217, 217, 217, 1)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
