import 'package:flutter/material.dart';

class MiddleBanner extends StatelessWidget {
  const MiddleBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://picsum.photos/1200/400?random=11'), // Placeholder kerumunan
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Colors.orange.withOpacity(0.8), // Overlay warna oranye
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1100),
            padding: const EdgeInsets.symmetric(horizontal: 40),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                  child: const Text('SOLIDARITAS', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 12)),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Gotong Royong Bangkitkan\nAceh Kembali',
                  style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/donation-form',
                      arguments: {
                        'title': 'Gotong Royong Bangkitkan Aceh Kembali',
                        'author': 'Relawan Kita',
                        'image': 'https://picsum.photos/1200/400?random=11',
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.orange),
                  child: const Text('Patungan Sekarang'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
