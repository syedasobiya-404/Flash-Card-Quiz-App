import 'package:flashcard/providers/Flashcard_Controller.dart';
import 'package:flashcard/theme/theme.dart';
import 'package:flashcard/views/Flashcard_Quiz_Screen.dart';
import 'package:flashcard/views/curd/add_Flashcrads.dart';
import 'package:flashcard/views/curd/delete_Flashcard.dart';
import 'package:flashcard/views/curd/edited_Flashcards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FlashcardController()..loadFlashCards(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/add': (context) => AddFlashcrads(),
        '/edit': (context) => const EditedFlashcards(),
        '/delete': (context) => const DeleteFlashcardScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'FlashCard App',
      theme: theme,
      home: FlashcardQuizScreen(),
    );
  }
}
