import 'package:flutter/material.dart';
import 'package:supabase_chat_app/constants.dart';
import 'package:supabase_chat_app/pages/splash_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: 'https://zdnobdwkkmcdxbqsbtfv.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inpkbm9iZHdra21jZHhicXNidGZ2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njk5MzM2OTgsImV4cCI6MTk4NTUwOTY5OH0.csgPmKToO_HUyG1lN4eSmShqaoSfZ9GSCAodaIADGCI');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Chat App',
      theme: appTheme,
      home: const SplashPage(),
    );
  }
}
