import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Pilihan Kategori Favoritmu', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            return Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildCategoryCard(context, 'Bencana Alam', Icons.home_work),
                _buildCategoryCard(context, 'Balita & Anak\nSakit', Icons.child_care),
                _buildCategoryCard(context, 'Bantuan Medis &\nKesehatan', Icons.medical_services),
                _buildCategoryCard(context, 'Lainnya', Icons.grid_view),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, IconData icon) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Menampilkan kampanye kategori ${title.replaceAll('\n', ' ')}..."),
            duration: const Duration(seconds: 2),
            backgroundColor: const Color(0xFF1EA0E5),
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 250, // Lebar statis untuk desktop
        height: 120,
        decoration: BoxDecoration(
          color: const Color(0xFF1EA0E5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Icon(icon, color: Colors.orange, size: 30),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
