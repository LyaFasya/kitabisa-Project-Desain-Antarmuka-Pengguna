import 'package:flutter/material.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      width: double.infinity,
      color: const Color(0xFF1EA0E5), // Biru Kitabisa
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1100),
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40, vertical: 30),
          child: Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // --- KIRI: TEKS & TOMBOL ---
              Expanded(
                flex: isMobile ? 0 : 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Asisten Kebaikan di\nAplikasi Kitabisa',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isMobile ? 24 : 36,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Siap bantu siapa pun melanjutkan kebaikannya jadi lebih berdampak',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        _buildStoreButton('App Store', Icons.apple),
                        const SizedBox(width: 12),
                        _buildStoreButton('Google Play', Icons.play_arrow),
                      ],
                    ),
                  ],
                ),
              ),
              if (isMobile) const SizedBox(height: 24),
              // --- KANAN: GAMBAR ---
              Expanded(
                flex: isMobile ? 0 : 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(isMobile ? 12 : 200), // Melengkung ekstrem di desktop
                  child: Image.network(
                    'https://picsum.photos/600/400?random=10', // Placeholder
                    height: isMobile ? 200 : 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStoreButton(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}