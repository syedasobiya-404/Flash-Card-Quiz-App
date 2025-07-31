import 'package:flashcard/providers/Flashcard_Controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddFlashcrads extends StatefulWidget {
  const AddFlashcrads({super.key});

  @override
  State<AddFlashcrads> createState() => _AddFlashcradsState();
}

class _AddFlashcradsState extends State<AddFlashcrads> {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();

  void addFlashcard() {
    final question = questionController.text.trim();
    final answer = answerController.text.trim();

    if (question.isNotEmpty && answer.isNotEmpty) {
      Provider.of<FlashcardController>(
        context,
        listen: false,
      ).addCard(question, answer);

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please fill both fields')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        alignment: Alignment.center,
        height: 600,
        width: 350,
        margin: EdgeInsets.only(top: 30, left: 80, bottom: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Theme.of(context).primaryColor,
          border: Border.all(
            color: Theme.of(context).highlightColor,
            width: 3,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Text(
                'Add FlashCard',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    TextField(
                      controller: questionController,
                      style: TextStyle(fontSize: 14), 
                      decoration: InputDecoration(
                        labelText: 'Question',
                        labelStyle: TextStyle(fontSize: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Theme.of(context).highlightColor,
                            width: 3,
                            strokeAlign: BorderSide.strokeAlignInside,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Theme.of(context).highlightColor,
                            width: 3,
                            strokeAlign: BorderSide.strokeAlignInside,
                          ),
                        ),
                      ),
                      maxLines: 2,

                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: answerController,
                      style: TextStyle(fontSize: 14), 
                      decoration: InputDecoration(
                        labelText: 'Answer',
                        labelStyle: TextStyle(fontSize: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Theme.of(context).highlightColor,
                            width: 3,
                            strokeAlign: BorderSide.strokeAlignInside,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Theme.of(context).highlightColor,
                            width: 3,
                            strokeAlign: BorderSide.strokeAlignInside,
                          ),
                        ),
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: addFlashcard,
                      icon: const Icon(Icons.add),
                      label: const Text('Add Flashcard'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
