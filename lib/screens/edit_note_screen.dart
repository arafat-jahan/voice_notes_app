import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/voice_note.dart';
import '../providers/notes_provider.dart';

class EditNotePage extends StatefulWidget {
  final VoiceNote note;
  final int index;

  const EditNotePage({
    super.key,
    required this.note,
    required this.index,
  });

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  late TextEditingController titleCtrl;
  late TextEditingController descCtrl;

  @override
  void initState() {
    super.initState();
    titleCtrl = TextEditingController(text: widget.note.title);
    descCtrl = TextEditingController(text: widget.note.description);
  }

  void _save() {
    context.read<NotesProvider>().updateNote(
      widget.index,
      widget.note.copyWith(
        title: titleCtrl.text.trim(),
        description: descCtrl.text.trim(),
      ),
    );
    Navigator.pop(context);
  }

  void _delete() {
    context.read<NotesProvider>().deleteNote(widget.index);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Note"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _delete,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleCtrl,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: descCtrl,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(labelText: "Description"),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _save,
              child: const Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
