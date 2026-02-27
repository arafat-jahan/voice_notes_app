import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/voice_note.dart';

class NotesProvider extends ChangeNotifier {
  static const _key = 'voice_notes';
  List<VoiceNote> _notes = [];



  NotesProvider() {
    loadNotes();
  }

  Future<void> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);
    if (data != null) {
      _notes = VoiceNote.decode(data);
      notifyListeners();
    }
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, VoiceNote.encode(_notes));
    notifyListeners();
  }

  Future<void> addNote(String text) async {
    final note = VoiceNote(
      title: text.split(' ').take(3).join(' '),
      description: text,
      createdAt: DateTime.now(),
    );
    _notes.insert(0, note);
    await _save();
  }

  Future<void> updateNote(int index, VoiceNote note) async {
    _notes[index] = note;
    await _save();
  }

  Future<void> deleteNote(int index) async {
    _notes.removeAt(index);
    await _save();
  }
  List<VoiceNote> _filteredNotes = [];
  String _searchQuery = '';

  List<VoiceNote> get notes =>
      _searchQuery.isEmpty ? _notes : _filteredNotes;

  void searchNotes(String query) {
    _searchQuery = query.trim().toLowerCase();
    _filteredNotes = _notes
        .where((note) =>
    note.title.toLowerCase().contains(_searchQuery) ||
        note.description.toLowerCase().contains(_searchQuery))
        .toList();
    notifyListeners();
  }
}

