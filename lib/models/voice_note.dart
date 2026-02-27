import 'dart:convert';

class VoiceNote {
  final String title;
  final String description;
  final DateTime createdAt;

  VoiceNote({
    required this.title,
    required this.description,
    required this.createdAt,
  });

  String get formattedDate =>
      "${createdAt.day}/${createdAt.month}/${createdAt.year}  "
          "${createdAt.hour}:${createdAt.minute.toString().padLeft(2, '0')}";

  VoiceNote copyWith({
    String? title,
    String? description,
    DateTime? createdAt,
  }) {
    return VoiceNote(
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() => {
    'title': title,
    'description': description,
    'createdAt': createdAt.toIso8601String(),
  };

  factory VoiceNote.fromMap(Map<String, dynamic> map) => VoiceNote(
    title: map['title'],
    description: map['description'],
    createdAt: DateTime.parse(map['createdAt']),
  );

  static String encode(List<VoiceNote> notes) =>
      jsonEncode(notes.map((e) => e.toMap()).toList());

  static List<VoiceNote> decode(String notes) =>
      (jsonDecode(notes) as List)
          .map((e) => VoiceNote.fromMap(e))
          .toList();
}
