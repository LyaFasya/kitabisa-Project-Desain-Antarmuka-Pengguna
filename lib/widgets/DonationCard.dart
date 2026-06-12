import 'package:flutter/material.dart';

class DonationCard extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;
  final double progress;
  final String collectedAmount;
  final String daysLeft;

  const DonationCard({
    super.key,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.progress,
    required this.collectedAmount,
    required this.daysLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Hapus fixed width (width: 200) agar kartu bisa melebar/menyusut fleksibel di dalam Grid
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          // --- BAGIAN ATAS: GAMBAR & BADGE ---
          Stack(
            children: [
              // Gambar Thumbnail
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  imageUrl,
                  height: 120, // Tinggi gambar pas (tidak terlalu besar/kecil)
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 120,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.image, color: Colors.grey),
                  ),
                ),
              ),
              
              // Badge "12 hari lagi" (Pojok Kiri Atas)
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: const BoxDecoration(
                    color: Color(0xFFC4E8F9), // Biru muda background badge
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12), // Melengkung di kanan bawah
                    ),
                  ),
                  child: Text(
                    '$daysLeft hari lagi',
                    style: const TextStyle(
                      color: Color(0xFF006C9B), // Biru tua teks badge
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // --- BAGIAN BAWAH: KONTEN TEKS ---
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama Author
                Text(
                  author,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                
                // Judul Kampanye
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, height: 1.3),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16), // Jarak sebelum harga
                
                // Terkumpul & Nominal
                Row(
                  children: [
                    const Text('Terkumpul ', style: TextStyle(fontSize: 11, color: Colors.grey)),
                    Text(
                      collectedAmount,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF1EA0E5)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                
                // Progress Bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey.shade300,
                    color: const Color(0xFF1EA0E5),
                    minHeight: 5,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}