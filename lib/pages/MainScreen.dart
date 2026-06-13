import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'ProfilePage.dart';
import 'InboxPage.dart';
import 'DonasiList.dart';
import '../widgets/Header.dart';
import '../widgets/Footer.dart';
import 'GalangDanaPage.dart';
import '../widgets/AppDrawer.dart';

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

  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width >= 1024;

    PreferredSizeWidget? _buildMobileAppBar() {
      if (isLargeScreen) return null; // Let the desktop header handle it

      return MainHeader(
        selectedIndex: _selectedIndex,
        onTabChanged: _onTabChanged,
      );
    }

    Widget _buildTabBody() {
      switch (_selectedIndex) {
        case 0:
          return HomePage(
            showScaffold: false,
            onTabChanged: _onTabChanged,
          );
        case 1:
          return const GalangDanaPage(showScaffold: false);  
        case 2:
          return DonasiListPage(
            showScaffold: false,
            onTabChanged: _onTabChanged,
          );
        case 3:
          return const InboxPage(showScaffold: false);
        case 4:
          return ProfilePage(
            showScaffold: false,
            onTabChanged: _onTabChanged,
          );
        default:
          return const HomePage(showScaffold: false);
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      drawer: isLargeScreen
          ? null
          : AppDrawer(
              selectedIndex: _selectedIndex,
              onTabChanged: _onTabChanged,
            ),
      appBar: isLargeScreen
          ? MainHeader(
              selectedIndex: _selectedIndex,
              onTabChanged: _onTabChanged,
            )
          : _buildMobileAppBar(),
      body: _buildTabBody(),
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

