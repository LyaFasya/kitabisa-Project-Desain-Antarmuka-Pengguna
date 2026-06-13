import 'package:flutter/material.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    if (isMobile) return _buildMobileLayout(context);
    return _buildDesktopLayout(context);
  }

  // ─── DESKTOP: foto memenuhi sisi kanan, lekukan hanya di kiri foto ───
  Widget _buildDesktopLayout(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 320,
      color: const Color(0xFF1EA0E5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Kiri: Teks + tombol
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 40),
              child: _buildTextContent(isMobile: false, context: context),
            ),
          ),

          // Kanan: Foto fill penuh tinggi banner, lengkung di kiri saja
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(220),
                bottomLeft: Radius.circular(220),
              ),
              child: Image.asset(
                'assets/images/hero_banner.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── MOBILE: gambar di atas, teks di bawah ───
  Widget _buildMobileLayout(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1EA0E5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            child: Image.asset(
              'assets/images/hero_banner.png',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Teks + tombol
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
            child: _buildTextContent(isMobile: true, context: context),
          ),
        ],
      ),
    );
  }

  // ─── KONTEN TEKS + TOMBOL ───
  Widget _buildTextContent({required bool isMobile, required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Asisten Kebaikan di\nAplikasi Kitabisa',
          style: TextStyle(
            color: Colors.white,
            fontSize: isMobile ? 26 : 32,
            fontWeight: FontWeight.bold,
            height: 1.25,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Siap bantu siapa pun melanjutkan kebaikannya\njadi lebih berdampak',
          style: TextStyle(
            color: Colors.white.withOpacity(0.92),
            fontSize: isMobile ? 14 : 15,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 28),
        Row(
          children: [
            _buildStoreButton(context, 'App Store', Icons.apple),
            const SizedBox(width: 12),
            _buildStoreButton(context, 'Google Play', Icons.play_arrow),
          ],
        ),
      ],
    );
  }

  // ─── TOMBOL STORE ───
  Widget _buildStoreButton(BuildContext context, String text, IconData icon) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Membuka $text untuk mengunduh aplikasi Kitabisa...'),
            duration: const Duration(seconds: 2),
            backgroundColor: const Color(0xFF005f8a),
          ),
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
