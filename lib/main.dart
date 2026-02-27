import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voice_app/screens/home_screen.dart';
import 'providers/notes_provider.dart';
import 'providers/theme_provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotesProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Voice Notes App',
            theme: ThemeData(
              brightness: themeProvider.isDark ? Brightness.dark : Brightness.light,
              primaryColor: Colors.deepPurpleAccent,
              scaffoldBackgroundColor: themeProvider.isDark
                  ? Colors.black
                  : Colors.grey[100],
              appBarTheme: AppBarTheme(
                backgroundColor: themeProvider.isDark
                    ? Colors.grey[900]
                    : Colors.deepPurpleAccent,
                foregroundColor: themeProvider.isDark ? Colors.white : Colors.white,
                elevation: 4,
              ),
              floatingActionButtonTheme:
              const FloatingActionButtonThemeData(
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepPurpleAccent,
              ),
              cardColor: themeProvider.isDark
                  ? Colors.grey[850]
                  : Colors.white,
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: themeProvider.isDark
                    ? Colors.white12
                    : Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                hintStyle: TextStyle(
                  color: themeProvider.isDark
                      ? Colors.white54
                      : Colors.grey[600],
                ),
              ),
              textTheme: TextTheme(
                bodyMedium: TextStyle(
                  color: themeProvider.isDark ? Colors.white : Colors.black87,
                ),
                bodySmall: TextStyle(
                  color: themeProvider.isDark ? Colors.white70 : Colors.black54,
                ),
              ),
            ),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
