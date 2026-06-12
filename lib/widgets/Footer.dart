import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan lebar layar secara real-time
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      // 1. Menggunakan LinearGradient persis seperti gambar aslinya
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0075B7), // Biru agak gelap di kiri
            Color(0xFF0EA7E6), // Biru terang di kanan
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 40.0,
        horizontal: isMobile ? 20.0 : 40.0, // Padding mengecil di HP
      ),
      child: Center(
        child: Container(
          // 2. Mengunci lebar maksimal konten agar rapi di Desktop
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              // --- TEKS DESKRIPSI IZIN ---
              Text(
                'Berdiri sejak 2013, Kitabisa memiliki izin Pengumpulan Uang dan Barang dari Kemensos. '
                'Kitabisa rutin diaudit dengan status Wajar Tanpa Pengecualian (WTP).',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 12 : 14, // Font mengecil di HP
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),

              // --- GARIS PEMBATAS ---
              const Divider(color: Colors.white54, thickness: 1),
              const SizedBox(height: 24),

              // --- MENU LINK (Menggunakan WRAP agar aman di HP) ---
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8.0, // Jarak horizontal
                runSpacing: 8.0, // Jarak vertikal jika terpaksa turun baris di HP
                children: [
                  _buildFooterLink('Tentang Kitabisa'),
                  _buildSeparator(),
                  _buildFooterLink('Syarat & Ketentuan'),
                  _buildSeparator(),
                  _buildFooterLink('Pusat Bantuan'),
                ],
              ),
              const SizedBox(height: 32),

              // --- IKON SOSIAL MEDIA ---
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 16.0,
                runSpacing: 16.0,
                children: [
                  _buildSocialIcon(FontAwesomeIcons.facebookF),
                  _buildSocialIcon(FontAwesomeIcons.twitter),
                  _buildSocialIcon(FontAwesomeIcons.instagram),
                  _buildSocialIcon(FontAwesomeIcons.youtube),
                  _buildSocialIcon(FontAwesomeIcons.tiktok),
                  _buildSocialIcon(FontAwesomeIcons.linkedinIn),
                  _buildSocialIcon(FontAwesomeIcons.paperPlane),
                ],
              ),
              const SizedBox(height: 32),

              // --- COPYRIGHT ---
              Text(
                'Copyright © 2026 Kitabisa. All Rights Reserved',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 10 : 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Method: Desain Teks Link
  Widget _buildFooterLink(String text) {
    return InkWell(
      onTap: () {
        // Aksi ketika diklik
      }, 
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Helper Method: Tanda Pipa "|"
  Widget _buildSeparator() {
    return const Text(
      '|',
      style: TextStyle(color: Colors.white, fontSize: 14),
    );
  }

  // Helper Method: Desain Lingkaran Ikon
  Widget _buildSocialIcon(dynamic icon) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: FaIcon(
          icon,
          color: const Color(0xFF19324B), // Warna biru dongker logo
          size: 20,
        ),
      ),
    );
  }
}