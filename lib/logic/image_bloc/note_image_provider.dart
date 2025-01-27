import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class noteImageProvider extends ChangeNotifier{

  File? ImageFile;
  final ImagePicker picker = ImagePicker();
  String? filename;

  Future selectImageFromGallery()async{
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      ImageFile = File(image.path);
      notifyListeners();
    }
    notifyListeners();
  }

  Future selectImageFromCamera()async{
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if(image != null){
      ImageFile = File(image.path);
      notifyListeners();
    }
    notifyListeners();
  }

  Future uploadImage(context)async{
    if(ImageFile != null){
      filename = DateTime.now().millisecondsSinceEpoch.toString();
      final path = "uploads/$filename";
      await Supabase.instance.client.storage.from("images").upload(path, ImageFile!)
          .then((v){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Uploaded Successfully")));
        ImageFile=null;
        notifyListeners();
      }
      );
    }
    else
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No image attached")));
    notifyListeners();
  }

  Future<List<String>>getImages()async{
    try{
      final response = await Supabase.instance.client.storage.from("images").list(path: "uploads");
      if(response!=null){
        final imageURLs = response.map((f){
          return Supabase.instance.client.storage.from("images").getPublicUrl("uploads/${f.name}");}).toList();
        return imageURLs;
      }
    }
    catch(e){
      print(e);
      return [];
    }
    return [];
  }

  Future <String>getSingleImage(String image)async{
    final String imageURL = await Supabase.instance.client.storage.from("images").getPublicUrl("uploads/$image");
    return imageURL;
  }
}
