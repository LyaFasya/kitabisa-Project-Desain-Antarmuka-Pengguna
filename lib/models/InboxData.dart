

class InboxData {
  final String title;
  final String description;
  final String timeAgo;
  final String imageUrl;

  const InboxData({
    required this.title,
    required this.description,
    required this.timeAgo,
    required this.imageUrl,
  });

  static final List<InboxData> sampleData = [
    const InboxData(
      title: 'Gotong Royong Bangun Rumah untuk Keluarga Kurang Mampu',
      description: 'Ratusan relawan berkumpul untuk membantu membangun rumah bagi keluarga yang membutuhkan. Program ini merupakan bagian dari inisiatif sosial untuk memberikan tempat tinggal yang layak.',
      timeAgo: '2 jam yang lalu',
      imageUrl: 'https://picsum.photos/id/1018/200/200', 
    ),
    const InboxData(
      title: 'Bantuan Pendidikan untuk Anak-Anak di Pelosok Negeri',
      description: 'Program beasiswa dan penyediaan fasilitas belajar untuk anak-anak di daerah terpencil. Mari bersama-sama membantu mereka meraih masa depan yang lebih cerah melalui pendidikan.',
      timeAgo: '5 jam yang lalu',
      imageUrl: 'https://picsum.photos/id/1011/200/200', 
    ),
    const InboxData(
      title: 'Peduli Lansia: Program Kesehatan Gratis untuk Para Orang Tua',
      description: 'Memberikan layanan kesehatan dan perawatan gratis untuk para lansia yang tidak memiliki jaminan kesehatan. Program ini mencakup pemeriksaan rutin dan pemberian obat-obatan.',
      timeAgo: '1 hari yang lalu',
      imageUrl: 'https://picsum.photos/id/1004/200/200', 
    ),
    const InboxData(
      title: 'Distribusi Makanan untuk Masyarakat Terdampak Bencana',
      description: 'Tim relawan mendistribusikan paket makanan dan kebutuhan pokok untuk korban bencana alam. Bantuan ini diberikan untuk meringankan beban mereka di masa sulit.',
      timeAgo: '2 hari yang lalu',
      imageUrl: 'https://picsum.photos/id/1060/200/200', 
    ),
    const InboxData(
      title: 'Pelatihan Keterampilan untuk Meningkatkan Ekonomi Masyarakat',
      description: 'Program pelatihan vokasi dan keterampilan untuk membantu masyarakat mendapatkan pekerjaan atau membuka usaha sendiri. Fokus pada pengembangan kemampuan yang dibutuhkan pasar.',
      timeAgo: '3 hari yang lalu',
      imageUrl: 'https://picsum.photos/id/1043/200/200', 
    ),
  ];
}
