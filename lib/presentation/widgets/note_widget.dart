import 'package:flutter/material.dart';
import 'package:noteapp/data/note_model.dart';
import 'package:noteapp/logic/image_bloc/note_image_provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NoteWidget extends StatelessWidget {
  final NoteModel model;
  NoteWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color.fromRGBO(242, 214, 241, 0.14)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(model.headline,
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                Spacer(),
                model.image==""?SizedBox():
                Consumer<noteImageProvider>(
                  builder: (context,provider,_){
                    return IconButton(onPressed: (){
                      final url = Supabase.instance.client.storage.from("images").getPublicUrl("uploads/${model.image}");
                      Navigator.push(context, MaterialPageRoute(builder: (_) => Scaffold(
                        backgroundColor: Colors.transparent,
                        appBar: AppBar(
                            backgroundColor: Colors.black,
                            iconTheme: IconThemeData(color: Colors.white)),
                        body: PhotoView(imageProvider: NetworkImage(url)),
                      )));
                    }, icon: Icon(Icons.photo, color: Color.fromRGBO(217, 217, 217, 1)));
                  }
                )
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(model.description,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(217, 217, 217, 1))),
                Spacer(),
                Text("${model.time.hour.toString()}:${model.time.minute.toString()}"
                    "${model.time.hour>=12?"PM":"AM"}",
                    style: TextStyle(
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
