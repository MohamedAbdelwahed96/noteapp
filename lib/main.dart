import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/logic/image_bloc/note_image_provider.dart';
import 'package:noteapp/presentation/screens/home_screen.dart';
import 'package:noteapp/presentation/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://kwrtcgnmxmdfffqffkin.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3cnRjZ25teG1kZmZmcWZma2luIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc5MDAxODUsImV4cCI6MjA1MzQ3NjE4NX0.lwcWfz2YaVs7BxClu0mQM9cA-CZgnCAXqHL0-TZCKZc",
  );

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>noteImageProvider())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Note App',
        home: HomeScreen(),
      ),
    );
  }
}