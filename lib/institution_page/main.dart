import 'package:flutter/material.dart';
import './body.dart';
import 'bottom_navigation_bar.dart';
import 'package:adaptive_navbar/adaptive_navbar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return Scaffold(
      appBar: AdaptiveNavBar(
        screenWidth: sw,
        backgroundColor: const Color(0xFF101C2B),
        leading: Image.asset(
          'images/logo-ip.png',
          width: 50,
          height: 50,
        ),
        navBarItems: [
          NavBarItem(
            text: "Home",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
          NavBarItem(
            text: "Institution",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
          NavBarItem(
            text: "Contact",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
          NavBarItem(
            text: "My account",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(child: 
        Body(),
      ),
      bottomNavigationBar: const ButtomNavigationBar(),
    );
  }
}