import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
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
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
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

              const Divider(color: Colors.white54, thickness: 1),
              const SizedBox(height: 24),

              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8.0, // Jarak horizontal
                runSpacing: 8.0, // Jarak vertikal jika terpaksa turun baris di HP
                children: [
                  _buildFooterLink(context, 'Tentang Kitabisa'),
                  _buildSeparator(),
                  _buildFooterLink(context, 'Syarat & Ketentuan'),
                  _buildSeparator(),
                  _buildFooterLink(context, 'Pusat Bantuan'),
                ],
              ),
              const SizedBox(height: 32),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 16.0,
                runSpacing: 16.0,
                children: [
                  _buildSocialIcon(context, FontAwesomeIcons.facebookF, "Facebook"),
                  _buildSocialIcon(context, FontAwesomeIcons.twitter, "Twitter"),
                  _buildSocialIcon(context, FontAwesomeIcons.instagram, "Instagram"),
                  _buildSocialIcon(context, FontAwesomeIcons.youtube, "YouTube"),
                  _buildSocialIcon(context, FontAwesomeIcons.tiktok, "TikTok"),
                  _buildSocialIcon(context, FontAwesomeIcons.linkedinIn, "LinkedIn"),
                  _buildSocialIcon(context, FontAwesomeIcons.paperPlane, "Telegram"),
                ],
              ),
              const SizedBox(height: 32),

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
  Widget _buildFooterLink(BuildContext context, String text) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Membuka halaman $text..."),
            duration: const Duration(seconds: 2),
            backgroundColor: const Color(0xFF1EA0E5),
          ),
        );
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

  Widget _buildSeparator() {
    return const Text(
      '|',
      style: TextStyle(color: Colors.white, fontSize: 14),
    );
  }

  // Helper Method: Desain Lingkaran Ikon
  Widget _buildSocialIcon(BuildContext context, dynamic icon, String name) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Membuka media sosial Kitabisa di $name..."),
            duration: const Duration(seconds: 2),
            backgroundColor: const Color(0xFF1EA0E5),
          ),
        );
      },
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
