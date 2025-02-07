import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/logic/get_notes_bloc/cubit.dart';
import 'package:noteapp/logic/get_notes_bloc/state.dart';
import 'package:noteapp/presentation/screens/add_note_screen.dart';
import 'package:noteapp/presentation/screens/login_screen.dart';
import 'package:noteapp/presentation/widgets/button_widget.dart';
import 'package:noteapp/presentation/widgets/note_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>GetNoteCubit()..getNote(),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(18, 3, 17, 1),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(height: 137),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 35),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AddNoteScreen()));
                        },
                        child: ButtonWidget(name: "Add Note")
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
                        child: ButtonWidget(name: "Log Out"),
                      )
                    ],
                  ),
                ),
                BlocBuilder<GetNoteCubit,GetNoteStates>(
                  builder: (context, state){
                    if(state is GetNoteLoadingState)
                      return CircularProgressIndicator();
                    else if(state is GetNoteSuccessState){
                      final NoteRes = state.note;
                      return SizedBox(
                        height: MediaQuery.of(context).size.height*0.66,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: NoteRes.length,
                          itemBuilder: (context,index){
                            final x = NoteRes[index];
                            return Column(
                              children: [
                                NoteWidget(model: x),
                                SizedBox(height: 10)
                              ],
                            );
                          },
                        ),
                      );
                    }
                    else if(state is GetNoteErrorState)
                      return Text(state.em);
                    else
                      return SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
