import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'ProfilePage.dart';
import 'InboxPage.dart';
import '../widgets/Header.dart';
import '../widgets/Navbar.dart';
import '../widgets/Footer.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;

  const MainScreen({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  // Handle tab switching
  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width >= 1024;

    // Mobile AppBars dynamically matching selected tabs
    PreferredSizeWidget? _buildMobileAppBar() {
      if (isLargeScreen) return null; // Let the desktop header handle it

      switch (_selectedIndex) {
        case 0: // Home
        case 3: // Inbox
        case 4: // Profile Mobile Header
          return MainHeader(
            selectedIndex: _selectedIndex,
            onTabChanged: _onTabChanged,
          );
        case 1:
          return _subPageMobileAppBar("Galang Dana");
        case 2:
          return _subPageMobileAppBar("Donasi Saya");
        default:
          return null;
      }
    }

    // Centered tab content views
    Widget _buildTabBody() {
      switch (_selectedIndex) {
        case 0:
          return const HomePage(showScaffold: false);
        case 1:
          return _PlaceholderTab(
            title: "Galang Dana",
            description: "Mulai galang dana untuk bantu sesama. Fitur ini akan segera hadir!",
            icon: Icons.savings_outlined,
            onGoHome: () => _onTabChanged(0),
          );
        case 2:
          return _PlaceholderTab(
            title: "Donasi Saya",
            description: "Belum ada riwayat donasi. Ayo mulai berbuat baik hari ini!",
            icon: Icons.receipt_long_outlined,
            onGoHome: () => _onTabChanged(0),
          );
        case 3:
          return const InboxPage(showScaffold: false);
        case 4:
          return const ProfilePage(showScaffold: false);
        default:
          return const HomePage(showScaffold: false);
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      drawer: isLargeScreen ? null : _buildDrawer(),
      // App Bar is MainHeader on desktop, and custom per-tab on mobile
      appBar: isLargeScreen
          ? MainHeader(
              selectedIndex: _selectedIndex,
              onTabChanged: _onTabChanged,
            )
          : _buildMobileAppBar(),
      body: _buildTabBody(),
      // Bottom navigation navbar only on mobile devices
      bottomNavigationBar: isLargeScreen
          ? null
          : CustomNavbar(
              selectedIndex: _selectedIndex,
              onItemTapped: _onTabChanged,
            ),
    );
  }

  PreferredSizeWidget _subPageMobileAppBar(String title) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF1E293B),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF1EA0E5)),
            accountName: Text("Aulya Fasya"),
            accountEmail: Text("aulyafasya@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white, 
              child: Text("AF", style: TextStyle(color: Color(0xFF1EA0E5), fontWeight: FontWeight.bold)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home), 
            title: const Text("Beranda"), 
            onTap: () {
              Navigator.pop(context);
              _onTabChanged(0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite), 
            title: const Text("Donasi Saya"), 
            onTap: () {
              Navigator.pop(context);
              _onTabChanged(2);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings), 
            title: const Text("Pengaturan"), 
            onTap: () {
              Navigator.pop(context);
              _onTabChanged(4);
            },
          ),
        ],
      ),
    );
  }
}

class _PlaceholderTab extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onGoHome;

  const _PlaceholderTab({
    required this.title,
    required this.description,
    required this.icon,
    required this.onGoHome,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width >= 1024;

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 60),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Color(0xFFE0F2FE),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          icon,
                          size: 48,
                          color: const Color(0xFF0284C7),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF64748B),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: onGoHome,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF18AEE2),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          "Kembali ke Beranda",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 80),
          if (isLargeScreen) const FooterSection(),
        ],
      ),
    );
  }
}
