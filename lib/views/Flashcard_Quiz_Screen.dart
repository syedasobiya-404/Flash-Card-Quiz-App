import 'package:flashcard/providers/Flashcard_Controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlashcardQuizScreen extends StatefulWidget {
  const FlashcardQuizScreen({super.key});

  @override
  State<FlashcardQuizScreen> createState() => _FlashcardQuizScreenState();
}

class _FlashcardQuizScreenState extends State<FlashcardQuizScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FlashcardController>(context);
    final cards = controller.flashCards;
    Theme.of(context);

    if (cards.isEmpty) {
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
            child: Text(
              'Add Your First Flashcrad',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      );
    }

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
              Row(
                children: [
                  Text(
                    'FlashCard Quiz',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Spacer(flex: 1),
                  PopupMenuButton<String>(
                    icon: Icon(
                      Icons.menu,
                      size: 24,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    onSelected: (value) {
                      switch (value) {
                        case 'add':
                          Navigator.pushNamed(context, '/add');
                          break;
                        case 'edit':
                          Navigator.pushNamed(context, '/edit');
                          break;
                        case 'delete':
                          Navigator.pushNamed(context, '/delete');
                          break;
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'add',
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/add');
                              },
                              icon: Icon(Icons.add, color: Colors.green),
                            ),
                            SizedBox(width: 8),
                            Text('Add'),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'edit',
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/edit');
                              },
                              icon: Icon(Icons.edit, color: Colors.blue),
                            ),
                            SizedBox(width: 8),
                            Text('Edit'),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/delete');
                              },
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                            SizedBox(width: 8),
                            Text('Delete'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: 280,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: Theme.of(context).highlightColor,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      width: 4,
                    ),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Center(
                    child: Text(
                      controller.showAnswerx
                          ? controller.currentCard.answer
                          : controller.currentCard.question,
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.toddleAnswer();
                },
                child: Text(
                  controller.showAnswerx ? 'Hide Answer' : 'Show Answer',
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.previousCard();
                      },
                      child: Text('< Pervious'),
                    ),
                  ),
                  Spacer(flex: 2),
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.nextCard();
                      },
                      child: Text('Next >'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
