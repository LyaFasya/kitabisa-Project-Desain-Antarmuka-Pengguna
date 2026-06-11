import 'package:flutter/material.dart';

class DonationHeader extends StatelessWidget {
  const DonationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Background Hijau
        Container(
          height: 220,
          width: double.infinity,
          color: const Color(0xFFE8F6ED),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              Text(
                'Mari buka tahun Hijriah dengan sedekah\njariyah untuk bantu sesama dan jadi amal tak\nterputus.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF1C8281),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        
        // Kartu Putih Melayang
        Positioned(
          top: 150,
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
                      backgroundColor: const Color(0xFF1EA0E5),
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
        
        // Pengganjal Ruang
        const SizedBox(height: 320), 
      ],
    );
  }
}