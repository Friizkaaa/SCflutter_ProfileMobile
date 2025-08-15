import 'package:flutter/material.dart';
import 'profile.dart';
import 'home.dart';
import 'history.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // biar banner debug hilang
      title: 'Aplikasi Toko',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(title: 'Home'),
        '/history': (context) => const HistoryPage(),
        '/profile': (context) => const MyHomePage(title: 'Kelas Study Club - Flutter'),
      },
    );
  }
}
