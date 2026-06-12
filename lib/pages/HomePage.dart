import 'package:flutter/material.dart';


import '../themes/colors.dart';
import '../widgets/Header.dart';
import '../widgets/GridOpsi.dart'; // Atau menu_grid.dart
import '../widgets/ResponsiveLayout.dart'; 
import '../widgets/HeroBanner.dart'; 
import '../widgets/CTABanner.dart'; 
import '../widgets/Category.dart'; 
import '../widgets/CampaignSection.dart'; 
import '../widgets/Footer.dart'; 

class HomePage extends StatefulWidget {
  final bool showScaffold;
  const HomePage({super.key, this.showScaffold = true});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Widget content = ResponsiveLayout(
      mobileBody: _buildContent(isMobile: true),
      desktopBody: _buildContent(isMobile: false),
    );

    if (!widget.showScaffold) {
      return content;
    }

    return Scaffold(
      backgroundColor: Colors.white, // Latar belakang utama putih bersih
      
      // 1. DRAWER (Menu Samping untuk Mobile)
      drawer: _buildDrawer(),

      // 2. HEADER ATAS (Responsif: Hamburger di Mobile, Teks Nav di Desktop)
      appBar: const MainHeader(selectedIndex: 0),

      // 3. BODY UTAMA (Dibungkus logic responsif)
      body: content,
    );
  }

  Widget _buildContent({required bool isMobile}) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // --- SECTION 1: HERO BANNER UTAMA ---
          // (Kamu bisa mengganti konten di dalam HeroBanner dengan Image.asset 'section.png' jika ingin menggunakan gambar statismu)
          const HeroBanner(),
          
          const SizedBox(height: 32),

          // --- SECTION 2: MENU GRID (Ikon Layanan) ---
          _buildConstrained(const MenuGrid()),
          
          const SizedBox(height: 32),

          // --- SECTION 3: KARTU DONASI MENDESAK ---
          _buildConstrained(
            const CampaignSection(title: 'Penggalangan Dana Mendesak')
          ),
          
          const SizedBox(height: 40),

          // --- SECTION 4: BANNER TENGAH (Gotong Royong Aceh) ---
          const MiddleBanner(),
          
          const SizedBox(height: 40),

          // --- SECTION 5: KARTU DONASI BERKELANJUTAN ---
          _buildConstrained(
            const CampaignSection(title: 'Donasi Berkelanjutan')
          ),
          
          const SizedBox(height: 32),

          // --- SECTION 6: KARTU PILIHAN KITA BISA ---
          _buildConstrained(
            const CampaignSection(title: 'Pilihan Kita Bisa')
          ),
          
          const SizedBox(height: 40),

          // --- SECTION 7: KATEGORI FAVORIT ---
          _buildConstrained(const CategorySection()),
          
          const SizedBox(height: 60), // Jarak ekstra sebelum footer

          // --- SECTION 8: FOOTER ---
          const FooterSection(),
        ],
      ),
    );
  }

  Widget _buildConstrained(Widget child) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1100),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: child,
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: AppColors.primaryColor),
            accountName: const Text("Aulya Fasya"),
            accountEmail: const Text("aulyafasya@gmail.com"),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white, 
              child: Text("AF", style: TextStyle(color: Color(0xFF1EA0E5), fontWeight: FontWeight.bold)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home), 
            title: const Text("Beranda"), 
            onTap: () => Navigator.pop(context)
          ),
          ListTile(
            leading: const Icon(Icons.favorite), 
            title: const Text("Donasi Saya"), 
            onTap: () => Navigator.pop(context)
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings), 
            title: const Text("Pengaturan"), 
            onTap: () => Navigator.pop(context)
          ),
        ],
      ),
    );
  }
}