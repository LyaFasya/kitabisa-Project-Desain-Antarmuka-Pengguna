import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kitabisa Clone',
      theme: ThemeData(
        primaryColor: const Color(0xFF1EA0E5), 
        fontFamily: 'Roboto',
      ),
      home: const KitabisaHomeScreen(),
    );
  }
}

class KitabisaHomeScreen extends StatefulWidget {
  const KitabisaHomeScreen({super.key});

  @override
  State<KitabisaHomeScreen> createState() => _KitabisaHomeScreenState();
}

class _KitabisaHomeScreenState extends State<KitabisaHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      // 1. APP BAR (Kolom Pencarian Biru)
      appBar: AppBar(
        backgroundColor: const Color(0xFF1EA0E5),
        elevation: 0,
        title: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.lightBlue.shade300.withOpacity(0.4), // Biru agak transparan
            borderRadius: BorderRadius.circular(8),
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

      // 2. BODY UTAMA
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Area Header & Kartu Menumpuk
            _buildHeaderAndCard(),
            
            // Jarak antara kartu dan menu
            const SizedBox(height: 24),
            
            // Menu Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Mau berbuat baik apa hari ini?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A4A4A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildMainMenu(),
                ],
              ),
            ),
            const SizedBox(height: 32), // Ruang kosong di bawah
          ],
        ),
      ),

      // 3. BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.grey.shade400, // Di gambar warnanya abu-abu semua
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
      ),
    );
  }

  // --- WIDGET HEADER (BANNER HIJAU & KARTU OVERLAP) ---
  Widget _buildHeaderAndCard() {
    return Stack(
      clipBehavior: Clip.none, // Penting! Agar kartu yang keluar jalur tidak terpotong
      children: [
        // Background Hijau
        Container(
          height: 220,
          width: double.infinity,
          color: const Color(0xFFE8F6ED), // Hijau muda
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              Text(
                'Mari buka tahun Hijriah dengan sedekah\njariyah untuk bantu sesama dan jadi amal tak\nterputus.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF1C8281), // Teks hijau tua
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // Anggap saja di sini ada gambar ilustrasi
            ],
          ),
        ),
        
        // Kartu Putih Melayang (Diposisikan di bawah dengan margin negatif)
        Positioned(
          top: 150, // Mendorong kartu ke bawah melewati batas container hijau
          left: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bantu jaga sedekah jariyah-mu terus\nberjalan setiap hari.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, height: 1.3),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Aktifkan Donasi Otomatis di aplikasi Kitabisa!',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1EA0E5), // Tombol Biru
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Download Sekarang', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        
        // Kotak transparan ini gunanya untuk memberi jarak di parent Stack, 
        // karena kartunya "keluar" (Overlap) sebesar kurang lebih 100 pixel ke bawah
        const SizedBox(height: 320), 
      ],
    );
  }

  // --- WIDGET GRID MENU ---
  Widget _buildMainMenu() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      mainAxisSpacing: 16,
      crossAxisSpacing: 8,
      childAspectRatio: 0.8, // Mengatur tinggi-lebar agar muat teksnya
      children: [
        _buildMenuIcon(Icons.favorite, 'Donasi', Colors.pink, isNew: false),
        _buildMenuIcon(Icons.account_balance, 'Zakat', Colors.green, isNew: false),
        _buildMenuIcon(Icons.volunteer_activism, 'Galang Dana', Colors.blue, isNew: false),
        _buildMenuIcon(Icons.event_repeat, 'Donasi\nOtomatis', Colors.blueGrey, isNew: false),
        _buildMenuIcon(Icons.stars, 'Kitabisa\nExperience', Colors.orange, isNew: true),
        _buildMenuIcon(Icons.handshake, 'Kolaborasi CSR', Colors.blue.shade300, isNew: false),
        _buildMenuIcon(Icons.health_and_safety, 'Asuransi\nSalingJaga', Colors.orange.shade700, isNew: true),
      ],
    );
  }

  Widget _buildMenuIcon(IconData icon, String label, Color color, {required bool isNew}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Menggunakan Stack untuk Badge "BARU"
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100, // Warna bulat abu-abu terang
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            if (isNew) // Jika isNew true, tampilkan badge
              Positioned(
                top: -8,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'BARU',
                      style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: Color(0xFF4A4A4A)),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ],
    );
  }
}