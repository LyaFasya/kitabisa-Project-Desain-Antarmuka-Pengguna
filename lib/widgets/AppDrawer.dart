import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int>? onTabChanged;

  const AppDrawer({
    super.key,
    required this.selectedIndex,
    this.onTabChanged,
  });

  void _handleNavigation(BuildContext context, int index) {
    if (onTabChanged != null) {
      onTabChanged!.call(index);
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/home',
        (route) => false,
        arguments: index,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF1EA0E5)),
            accountName: Text("Aulya Fasya"),
            accountEmail: Text("aulyafasya@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "AF",
                style: TextStyle(
                  color: Color(0xFF1EA0E5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Beranda"),
            selected: selectedIndex == 0,
            selectedColor: const Color(0xFF1EA0E5),
            onTap: () {
              Navigator.pop(context);
              _handleNavigation(context, 0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.volunteer_activism),
            title: const Text("Galang Dana"),
            selected: selectedIndex == 1,
            selectedColor: const Color(0xFF1EA0E5),
            onTap: () {
              Navigator.pop(context);
              _handleNavigation(context, 1);
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text("Donasi"),
            selected: selectedIndex == 2,
            selectedColor: const Color(0xFF1EA0E5),
            onTap: () {
              Navigator.pop(context);
              _handleNavigation(context, 2);
            },
          ),
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text("Inbox"),
            selected: selectedIndex == 3,
            selectedColor: const Color(0xFF1EA0E5),
            onTap: () {
              Navigator.pop(context);
              _handleNavigation(context, 3);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Pengaturan"),
            selected: selectedIndex == 4,
            selectedColor: const Color(0xFF1EA0E5),
            onTap: () {
              Navigator.pop(context);
              _handleNavigation(context, 4);
            },
          ),
        ],
      ),
    );
  }
}
