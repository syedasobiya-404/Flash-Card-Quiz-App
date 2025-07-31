import 'dart:convert';
import 'package:flashcard/widgets/Flashcard_Widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FlashcardController with ChangeNotifier {
  List<Flashcard> flashCards = [];
  int currentIndex = 0;
  bool showAnswer = false;

  FlashcardController() {
    loadFlashCards();
  }

  List<Flashcard> get flashcard => flashCards;
  int get currentIndexx => currentIndex;
  bool get showAnswerx => showAnswer;
  Flashcard get currentCard => flashCards[currentIndex];

  Future<void> loadFlashCards() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList('flashcards') ?? [];

    flashCards = jsonList
        .map((jsonStr) => Flashcard.fromJson(json.decode(jsonStr)))
        .toList();

    notifyListeners();
  }

  Future<void> saveFlashCards() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = flashcard
        .map((card) => json.encode(card.toJson()))
        .toList();
    await prefs.setStringList('flashcards', jsonList);
  }

  void toddleAnswer() {
    showAnswer = !showAnswer;
    notifyListeners();
  }

  void nextCard() {
    if (currentIndex < flashCards.length - 1) {
      currentIndex++;
      showAnswer = false;
      notifyListeners();
    }
  }

  void previousCard() {
    if (currentIndex > 0) {
      currentIndex--;
      showAnswer = false;
      notifyListeners();
    }
  }

  void addCard(String question, String answer) async {
    final newCrad = Flashcard(question: question, answer: answer);
    // dummyFlashcards.add(newCrad);
    flashCards.add(newCrad);
    await saveFlashCards();
    showAnswer = false;
    notifyListeners();
  }

  void editCrad(String question, String answer) {
    if (flashCards.isNotEmpty) {
      final updatedCard = Flashcard(question: question, answer: answer);
      flashCards[currentIndex] = updatedCard;
      flashCards[currentIndex] = updatedCard;
      showAnswer = false;
      saveFlashCards();
      notifyListeners();
    }
  }

  void deleteCard() async {
  if (flashCards.isEmpty) return; // prevent crash
  flashCards.removeAt(currentIndex);
  if (currentIndex >= flashCards.length) {
    currentIndex = 0;
  }
  await saveFlashCards();
  notifyListeners();
}
}
