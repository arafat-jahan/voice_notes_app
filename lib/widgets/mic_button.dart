import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../providers/notes_provider.dart';
import '../providers/theme_provider.dart';

class MicButton extends StatefulWidget {
  const MicButton({super.key});

  @override
  State<MicButton> createState() => _MicButtonState();
}

class _MicButtonState extends State<MicButton>
    with SingleTickerProviderStateMixin {
  final SpeechToText _speech = SpeechToText();
  bool _listening = false;
  String _text = '';

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _speech.stop();
    super.dispose();
  }

  Future<void> _startListening() async {
    final status = await Permission.microphone.request();
    if (!status.isGranted) return;

    final available = await _speech.initialize(
      onStatus: (status) {
        if (status == "done") _stopListening();
      },
      onError: (error) => _stopListening(),
    );
    if (!available) return;

    setState(() => _listening = true);
    _controller.repeat(reverse: true);

    _speech.listen(
      onResult: (result) {
        setState(() => _text = result.recognizedWords);
      },
      listenMode: ListenMode.dictation, // tap once, auto stop
    );
  }

  void _stopListening() {
    if (!_listening) return;

    _speech.stop();
    _controller.stop();

    if (_text.trim().isNotEmpty) {
      context.read<NotesProvider>().addNote(_text.trim());
    }

    setState(() {
      _listening = false;
      _text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final isDark = themeProvider.isDark;

    final idleColor = isDark ? Colors.white38 : Colors.grey.shade400;
    final listeningColor = Colors.greenAccent;
    final bgColor = isDark
        ? Colors.white.withOpacity(0.15)
        : Colors.grey.shade300.withOpacity(0.4);

    return Center(
      child: GestureDetector(
        onTap: () async {
          if (_listening) {
            _stopListening();
          } else {
            await _startListening();
          }
        },
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            final scale = _listening ? 1 + (_controller.value * 0.15) : 1.0;

            return Transform.scale(
              scale: scale,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: bgColor,
                  border: Border.all(
                    color: _listening ? listeningColor : idleColor,
                    width: 2,
                  ),
                  boxShadow: [
                    if (_listening)
                      BoxShadow(
                        color: listeningColor.withOpacity(0.6),
                        blurRadius: 28,
                        spreadRadius: 2,
                      ),
                  ],
                ),
                child: Icon(
                  _listening ? Icons.mic : Icons.mic_none,
                  size: 38,
                  color: _listening
                      ? listeningColor
                      : (isDark ? Colors.white : Colors.black87),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}