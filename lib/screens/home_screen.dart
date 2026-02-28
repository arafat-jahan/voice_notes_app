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
    final isDark = themeProvider.isDark;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.colorScheme.background,
        title: const Text(
          "Voice Notes",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
            onPressed: () => themeProvider.toggleTheme(),
            tooltip: "Toggle Theme",
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: isDark ? Colors.white12 : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                onChanged: (value) => notesProvider.searchNotes(value),
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black87,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintText: "Search your notes...",
                  hintStyle: TextStyle(
                    color: isDark ? Colors.white54 : Colors.black45,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: isDark ? Colors.white54 : Colors.black54,
                  ),
                  border: InputBorder.none,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // ✅ Notes List or Empty State
          notesProvider.notes.isEmpty
              ? Center(
            child: Text(
              "No notes yet. Tap the mic to add one!",
              style: TextStyle(
                fontSize: 16,
                color: isDark ? Colors.white54 : Colors.black45,
              ),
              textAlign: TextAlign.center,
            ),
          )
              : ListView.builder(
            padding: const EdgeInsets.only(bottom: 140, top: 8),
            itemCount: notesProvider.notes.length,
            itemBuilder: (_, index) {
              final note = notesProvider.notes[index];
              return NoteTile(note: note, index: index);
            },
          ),

          // 🔴 Floating Mic Button
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: Material(
                elevation: 6,
                shape: const CircleBorder(),
                shadowColor:
                isDark ? Colors.greenAccent.withOpacity(0.4) : Colors.redAccent.withOpacity(0.4),
                child: const MicButton(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}