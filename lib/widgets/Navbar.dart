import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget {
  // Variabel penampung data dari Page Utama
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomNavbar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex, // Memakai data yang dioper dari Halaman Utama
      onTap: onItemTapped,         // Mengoper event klik kembali ke Halaman Utama
      selectedItemColor: Colors.blue.shade400,
      unselectedItemColor: Colors.grey.shade400,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Donasi'),
        BottomNavigationBarItem(icon: Icon(Icons.savings), label: 'Galang Dana'),
        BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Donasi Saya'),
        BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Inbox'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
      ],
    );
  }
}