# 📚 FlashCard Quiz App

A simple and elegant Flutter app to help you create, review, and manage flashcards. Perfect for quick study sessions and boosting memory retention!

---

## ✨ Features

- 🔄 Toggle between **question** and **answer**
- ➕ Add new flashcards
- 📝 Edit existing flashcards
- 🗑️ Delete flashcards
- 💾 Data persistence using **SharedPreferences**
- 🎨 Custom clean UI with light theme
- 🚀 Built using **Flutter** and **Provider** for state management

---

## 📂 Project Structure

lib/
├── main.dart # App entry point
├── theme/
│ └── theme.dart # Custom app theme
├── provider/
│ └── Flashcard_Controller.dart # Flashcard controller (logic & storage)
├── views/
│ ├── Flashcard_Quiz_Screen.dart # Main quiz interface
│ └── curd/
│ ├── add_Flashcrads.dart # Add screen
│ ├── delete_Flashcard.dart # Delete screen
│ └── edited_Flashcards.dart # Edit screen
└── widgets/
└── Flashcard_Widget.dart # Flashcard model
