import 'package:flutter/material.dart';
import '../documents_page/body.dart';
import '../documents_page/bottomNavigationBar.dart';

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppBarExample(),
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return Scaffold(
      backgroundColor: const Color(0xff293441),
      appBar: AppBar(
        backgroundColor: const Color(0xFF101C2B),
        leading: Image.asset(
          'images/logo-ip.png',
          width: 50,
          height: 50,
        ),
        actions: <Widget>[
          TextButton(
            style: style,
            onPressed: () {},
            child: const Text('Home'),
          ),
          TextButton(
            style: style,
            onPressed: () {},
            child: const Text('Institution'),
          ),
          TextButton(
            style: style,
            onPressed: () {},
            child: const Text('Contact'),
          ),
          TextButton(
            style: style,
            onPressed: () {},
            child: const Text('My Acount'),
          ),
        ],
      ),
      body: Body(),
      bottomNavigationBar: const bottomNavigationBar(),
    );
  }
}
