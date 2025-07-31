import 'package:flashcard/providers/Flashcard_Controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteFlashcardScreen extends StatelessWidget {
  const DeleteFlashcardScreen({super.key});

  void deleteFlashcard(BuildContext context) {
    Provider.of<FlashcardController>(context, listen: false).deleteCard();
    Navigator.pop(context); // 👈 Return to previous screen
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Flashcard deleted')));
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FlashcardController>(context);
    if (controller.flashCards.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Delete Flashcard')),
        body: const Center(child: Text("No flashcards to delete.")),
      );
    }

    final flashcard = controller.currentCard;
    if (controller.flashCards.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("No Cards"),
          content: const Text("There are no flashcards to delete."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Delete Flashcard')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Are you sure you want to delete this flashcard?',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                Text(
                  '"${flashcard.question}"',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.cancel),
                      label: const Text("Cancel"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => deleteFlashcard(context),
                      icon: const Icon(Icons.delete),
                      label: const Text("Delete"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
