# 🎤 Voice Notes App (Flutter)

A modern **Voice Notes mobile application** built with **Flutter** that allows users to quickly create notes using **speech-to-text technology**.  
The app converts voice input into text notes and stores them locally so users can easily manage, edit, and search their notes.

---

## ✨ Features

- 🎤 Speech to Text voice note creation  
- 📝 Create notes instantly using voice input  
- ✏️ Edit existing notes  
- 🗑 Delete notes with confirmation dialog  
- 🔍 Search notes easily  
- 🌙 Dark and Light theme support  
- 💾 Local storage using SharedPreferences  
- 🎨 Clean and modern UI  

---

## 🏗 Project Structure


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

