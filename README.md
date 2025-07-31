# 📚 Flashcard Quiz App

A simple and interactive Flutter application to help users learn through flashcards. Users can create, view, edit, and delete flashcards, as well as toggle between question and answer during a quiz session.

## ✨ Features

- 🔄 Flip between question and answer
- ➕ Add new flashcards
- ✏️ Edit existing flashcards
- 🗑️ Delete flashcards
- 💾 Data persistence using `SharedPreferences`
- 🎨 Custom clean theme

## 📂 Project Structure

```
lib/
├── main.dart                            # App entry point
├── provider/
│   └── Flashcard_Controller.dart        # Flashcard logic & state (Provider)
├── theme/
│   └── theme.dart                       # Light green theme customization
├── views/
│   ├── Flashcard_Quiz_Screen.dart      # Main quiz UI
│   └── curd/
│       ├── add_Flashcrads.dart         # Screen to add flashcards
│       ├── edited_Flashcards.dart      # Screen to edit flashcards
│       └── delete_Flashcard.dart       # Screen to delete flashcards
├── widgets/
│   └── Flashcard_Widget.dart           # Flashcard data model
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.x+ recommended)
- Android Studio / VSCode or any preferred IDE
- Emulator or connected physical device

### Installation

1. **Clone the repository:**

```bash
git clone https://github.com/your-username/flashcard_quiz_app.git
cd flashcard_quiz_app
```

2. **Install dependencies:**

```bash
flutter pub get
```

3. **Run the app:**

```bash
flutter run
```

> Make sure a simulator or device is connected.

---

## ⚙️ State Management

This app uses [`Provider`](https://pub.dev/packages/provider) to manage app-wide state and update UI reactively.

## 📦 Dependencies

- [`provider`](https://pub.dev/packages/provider)
- [`shared_preferences`](https://pub.dev/packages/shared_preferences)
- [`flutter`](https://flutter.dev)

---

## 🔧 To Do / Improvements

- ✅ Improve validation UI
- ❌ Add dark mode toggle
- ❌ Add categories or tags for flashcards
- ❌ Add import/export feature
- ❌ Add animations for card flip

---

## 🧠 Author

Made with ❤️ by **[Your Name / Dev Dynamo]**

- Instagram: [@SemicolonAcademy](https://instagram.com/semicolonacademy)
- GitHub: [@your-username](https://github.com/your-username)

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
