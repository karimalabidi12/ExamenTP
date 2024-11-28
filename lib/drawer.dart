import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(),
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home Page'),
            onTap: () {
              // Navigation vers la page Home
              Navigator.pushReplacementNamed(context, '/home_page');
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Intro Page'),
            onTap: () {
              // Navigation vers la page Intro
              Navigator.pushReplacementNamed(context, '/intro_page');
            },
          ),
        ],
      ),
    );
  }
}
