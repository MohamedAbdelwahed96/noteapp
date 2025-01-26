import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/logic/image_bloc/note_image_provider.dart';
import 'package:noteapp/widgets/text_field_widget.dart';
import 'package:noteapp/data/note_model.dart';
import 'package:noteapp/logic/create_note_bloc/cubit.dart';
import 'package:noteapp/logic/create_note_bloc/state.dart';
import 'package:noteapp/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController headlineController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CreateNoteCubit(),
      child: BlocConsumer<CreateNoteCubit,CreateNoteStates>(
        listener: (context,state){
          if(state is CreateNoteSuccessState){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Note Created Successfully")));
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
          }
          else if(state is CreateNoteErrorState)
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.em)));
        },
        builder: (context,state){
          return Consumer<noteImageProvider>(
            builder: (context,provider,_)
              {
                return Scaffold(
                  backgroundColor: const Color.fromRGBO(18, 3, 17, 1),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24, top: 180),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Create New Note",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 40),
                          const Text("Head line",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.white)),
                          const SizedBox(height: 10),
                          TextFieldWidget(controller: headlineController, hinttext: "Enter Note Address"),
                          const SizedBox(height: 20),
                          const Text("Description",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.white)),
                          const SizedBox(height: 10),
                          TextFieldWidget(controller: descriptionController, hinttext: "Enter Your Description", minL: 6, maxL: 6),
                          const SizedBox(height: 30),
                          InkWell(
                            onTap: () {
                              provider.selectImage();
                            },
                            child: Container(
                              height: 48,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white),
                              child: const Center(
                                  child: Text("Attach Image",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black))),
                            ),
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              provider.uploadImage(context);
                              context.read<CreateNoteCubit>().createNote(NoteModel(
                                  headline: headlineController.text,
                                  description: descriptionController.text,
                                  image: provider.filename!,
                                  time: DateTime.now()));
                            },
                            child: Container(
                              height: 48,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white),
                              child: const Center(
                                  child: Text("Create",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
          );
        },
      ),
    );
  }
}