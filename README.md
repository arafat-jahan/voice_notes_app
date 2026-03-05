```markdown
# 🎙️ Voice Notes App (Flutter)

A modern **Voice Notes mobile application** built with **Flutter** that allows users to quickly create notes using **speech-to-text technology**. The app converts voice input into text notes and stores them locally for easy access, editing, and management.

The project demonstrates the use of **Flutter UI design, Provider state management, speech recognition, and local storage** in a clean and structured architecture.

---

# 🚀 Features

- 🎤 **Speech to Text**
  - Convert voice input into text notes instantly

- 📝 **Create Notes**
  - Automatically generate notes from voice recordings

- ✏️ **Edit Notes**
  - Update note title and description easily

- 🗑️ **Delete Notes**
  - Remove notes with confirmation dialog

- 🔎 **Search Notes**
  - Quickly find notes using the search bar

- 🌙 **Dark / Light Mode**
  - Toggle between dark and light theme

- 💾 **Local Storage**
  - Notes are stored locally using SharedPreferences

- 🎨 **Modern UI**
  - Clean and minimal interface with smooth animations

---

# 🏗️ Project Architecture

The project follows a **clean and modular Flutter architecture**.

```

lib/
│
├── models/
│   └── voice_note.dart
│
├── providers/
│   ├── notes_provider.dart
│   └── theme_provider.dart
│
├── screens/
│   ├── home_page.dart
│   └── edit_note_page.dart
│
├── widgets/
│   ├── mic_button.dart
│   └── note_tile.dart
│
└── main.dart

````

### Models
Defines the **data structure** of notes.

### Providers
Manages **state management** using Provider.

### Screens
Contains **UI pages** such as HomePage and EditNotePage.

### Widgets
Reusable UI components like note cards and mic button.

---

# 🧠 Technologies Used

- **Flutter**
- **Dart**
- **Provider (State Management)**
- **Speech To Text**
- **SharedPreferences**
- **Material UI**

---

# 📦 Packages Used

```yaml
provider:
speech_to_text:
permission_handler:
shared_preferences:
intl:
````

---

# ⚙️ Installation

### 1️⃣ Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/voice-notes-app.git
```

### 2️⃣ Navigate to the project folder

```bash
cd voice-notes-app
```

### 3️⃣ Install dependencies

```bash
flutter pub get
```

### 4️⃣ Run the application

```bash
flutter run
```

---

# 🎤 How Voice Recording Works

1. User taps the **microphone button**
2. The app requests **microphone permission**
3. Speech is captured using the **speech_to_text package**
4. Voice is converted into **text**
5. The text is saved as a **new note**

---

# 📱 App Workflow

1️⃣ Open the app
2️⃣ Tap the **mic button**
3️⃣ Speak your note
4️⃣ The speech converts into text
5️⃣ The note is automatically saved
6️⃣ You can **edit, search, or delete** notes anytime

---

# 🔮 Future Improvements

Possible improvements for this project:

* Cloud sync using **Firebase**
* Voice note **audio storage**
* Note **categories / folders**
* **Export notes** feature
* **AI summary for notes**
* **Offline speech recognition**

---

# 👨‍💻 Author

Developed as part of a **Flutter learning project** focused on building a real-world application using speech recognition and state management.

---

# 📄 License

This project is for **educational purposes** and open for improvements.

```
```
