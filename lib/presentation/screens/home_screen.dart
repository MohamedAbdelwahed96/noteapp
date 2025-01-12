import 'package:flutter/material.dart';
import 'package:noteapp/Widgets/button_widget.dart';
import 'package:noteapp/presentation/screens/add_note_screen.dart';
import 'package:noteapp/presentation/screens/login_screen.dart';
import 'package:noteapp/Widgets/notes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 3, 17, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 137),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 35),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddNoteScreen()));
                      },
                      child: ButtonWidget(name: "Add Note")
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      child: ButtonWidget(name: "Log Out"),
                    )
                  ],
                ),
              ),
              NotesWidget(title: "Meeting", content: "Excepteur sint occaecat cupidatat non proiden.", time: "9.00 am"),
              SizedBox(height: 12),
              NotesWidget(title: "Buying Fruits", content: "Apple,Orange,Banana,Guava.", time: "11.00 am"),
              SizedBox(height: 12),
              NotesWidget(title: "Address", content: "4140 Parker Rd. Allentown, New Mexico 31134", time: "11.30 am"),
              SizedBox(height: 12),
              NotesWidget(title: "Packing", content: "Dress,Shoe,Watch,Toothbresh,Paste.", time: "1.00 pm"),
              SizedBox(height: 12),
              NotesWidget(title: "Health checkup", content: "Duis aute irure dolor in reprehenderit in voluptate.", time: "4.00 pm")
            ],
          ),
        ),
      ),
    );
  }
}
