import 'package:flutter/material.dart';
// Import semua "kepingan Lego" dari folder widgets
import '../widgets/HomePageHeader.dart';
import '../widgets/GridOpsi.dart';
import '../widgets/Navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onNavbarTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        backgroundColor: const Color(0xFF1EA0E5),
        title: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.lightBlue.shade300.withOpacity(0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: const [
              Expanded(
                child: Text(
                  'Coba cari "Tolong menolong"',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              Icon(Icons.search, color: Colors.white),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DonationHeader(),
            
            const SizedBox(height: 24),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Mau berbuat baik apa hari ini?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A4A4A),
                    ),
                  ),
                  SizedBox(height: 16),
                  
                  // Memanggil widget Grid Menu
                  MenuGrid(),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),

      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onNavbarTapped,
      ),
    );
  }
}