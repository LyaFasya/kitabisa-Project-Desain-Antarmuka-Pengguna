import 'package:flutter/material.dart';
import 'DonationCard.dart'; 

class CampaignSection extends StatelessWidget {
  final String title;

  const CampaignSection({
    super.key, 
    required this.title,
  });

  final List<Map<String, dynamic>> _campaigns = const [
    {
      "title": "Donasi keselamatan umat untuk anak yatim",
      "author": "Iren Kurniawan",
      "image": "https://picsum.photos/400/300?random=1",
      "progress": 0.45,
      "amount": "Rp12.900.000",
      "days": "12",
    },
    {
      "title": "Bantu Santri Pelosok Dapatkan Al-Quran Layak",
      "author": "Yayasan Amal Jariyah",
      "image": "https://picsum.photos/400/300?random=2",
      "progress": 0.80,
      "amount": "Rp25.500.000",
      "days": "5",
    },
    {
      "title": "Patungan Bangun Sumur Bor untuk Warga Desa",
      "author": "Aksi Cepat Tanggap",
      "image": "https://picsum.photos/400/300?random=3",
      "progress": 0.20,
      "amount": "Rp5.000.000",
      "days": "30",
    },
    {
      "title": "Bantu Renovasi Kelas Sekolah Dasar yang Roboh",
      "author": "Komunitas Peduli Pendidikan",
      "image": "https://picsum.photos/400/300?random=4",
      "progress": 0.95,
      "amount": "Rp95.000.000",
      "days": "2",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            title, // Memanggil judul dinamis dari parameter
            style: const TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
        ),
        
        LayoutBuilder(
          builder: (context, constraints) {
            
            if (constraints.maxWidth < 600) {
              return GridView.builder(
                shrinkWrap: true, // Wajib diaktifkan di dalam ScrollView utama
                physics: const NeverScrollableScrollPhysics(), // Scroll dimatikan agar ikut scroll halaman utama
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Membagi menjadi 2 Kolom
                  crossAxisSpacing: 12, // Jarak horizontal antar kartu
                  mainAxisSpacing: 12, // Jarak vertikal antar kartu
                  childAspectRatio: 0.60, // Rasio kartu. Turunkan angkanya (misal 0.55) jika teks masih overflow
                ),
                itemCount: 4, // Tampilkan 4 item saja di mode HP
                itemBuilder: (context, index) {
                  final data = _campaigns[index];
                  return DonationCard(
                    title: data['title'],
                    author: data['author'],
                    imageUrl: data['image'],
                    progress: data['progress'],
                    collectedAmount: data['amount'],
                    daysLeft: data['days'],
                  );
                },
              );
            } 
            
            else {
              return SizedBox(
                height: 310, // Tinggi statis area scroll horizontal (sesuaikan jika kartu terpotong)
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // Arah scroll ke Kanan-Kiri
                  itemCount: _campaigns.length, // Menampilkan semua data
                  itemBuilder: (context, index) {
                    final data = _campaigns[index];
                    
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: SizedBox(
                        width: 240, 
                        child: DonationCard(
                          title: data['title'],
                          author: data['author'],
                          imageUrl: data['image'],
                          progress: data['progress'],
                          collectedAmount: data['amount'],
                          daysLeft: data['days'],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
