import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/notes_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/note_tile.dart';
import '../widgets/mic_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final notesProvider = context.watch<NotesProvider>();
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Voice Notes"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
                themeProvider.isDark ? Icons.dark_mode : Icons.light_mode),
            onPressed: () => themeProvider.toggleTheme(),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              onChanged: (value) => notesProvider.searchNotes(value),
              style: TextStyle(
                color: themeProvider.isDark ? Colors.white : Colors.black87,
              ),
              decoration: InputDecoration(
                hintText: "Search notes...",
                prefixIcon: Icon(
                  Icons.search,
                  color: themeProvider.isDark ? Colors.white54 : Colors.black54,
                ),
                hintStyle: TextStyle(
                    color: themeProvider.isDark ? Colors.white54 : Colors.black45),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          notesProvider.notes.isEmpty
              ? Center(
            child: Text(
              "No notes yet",
              style: TextStyle(
                fontSize: 16,
                color: themeProvider.isDark ? Colors.white70 : Colors.black54,
              ),
            ),
          )
              : ListView.builder(
            padding: const EdgeInsets.only(bottom: 120),
            itemCount: notesProvider.notes.length,
            itemBuilder: (_, index) {
              final note = notesProvider.notes[index];
              return NoteTile(note: note, index: index);
            },
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: const MicButton(),
          ),
        ],
      ),
    );
  }
}
