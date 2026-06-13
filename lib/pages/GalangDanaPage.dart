import 'package:flutter/material.dart';
import '../widgets/Header.dart';
import '../widgets/Footer.dart';
import '../widgets/AppDrawer.dart';

// Top-level Formatters
String _formatRupiah(double amount) {
  final str = amount.round().toString();
  final buffer = StringBuffer();
  int count = 0;
  for (int i = str.length - 1; i >= 0; i--) {
    buffer.write(str[i]);
    count++;
    if (count % 3 == 0 && i != 0) {
      buffer.write('.');
    }
  }
  return 'Rp${buffer.toString().split('').reversed.join('')}';
}

String _formatNumber(int number) {
  final str = number.toString();
  final buffer = StringBuffer();
  int count = 0;
  for (int i = str.length - 1; i >= 0; i--) {
    buffer.write(str[i]);
    count++;
    if (count % 3 == 0 && i != 0) {
      buffer.write('.');
    }
  }
  return buffer.toString().split('').reversed.join('');
}

class GalangDanaPage extends StatefulWidget {
  final bool showScaffold;

  const GalangDanaPage({
    super.key,
    this.showScaffold = true,
  });

  @override
  State<GalangDanaPage> createState() => _GalangDanaPageState();
}

class _GalangDanaPageState extends State<GalangDanaPage> {
  late List<_CampaignData> _campaigns;

  @override
  void initState() {
    super.initState();
    _campaigns = [
      _CampaignData(
        category: 'PENDIDIKAN',
        categoryIcon: Icons.school_outlined,
        categoryColor: const Color(0xFF0EA7E6),
        categoryBgColor: const Color(0xFFE0F2FE),
        title: 'Beasiswa Anak Yatim Dhuafa Kabupaten Bandung',
        status: 'Aktif',
        statusColor: const Color(0xFF10B981),
        statusBgColor: const Color(0xFFD1FAE5),
        targetAmount: 10000000.0,
        collectedAmount: 4750000.0,
        donorCount: 128,
        imagePath: 'assets/images/Beasiswa.png',
      ),
      _CampaignData(
        category: 'KESEHATAN',
        categoryIcon: Icons.favorite_border,
        categoryColor: const Color(0xFFEF4444),
        categoryBgColor: const Color(0xFFFEE2E2),
        title: 'Bantu Pengobatan Ibu Fatimah Penderita Kanker Serviks',
        status: 'Pending',
        statusColor: const Color(0xFFF59E0B),
        statusBgColor: const Color(0xFFFEF3C7),
        targetAmount: 15000000.0,
        collectedAmount: 2100000.0,
        donorCount: 64,
        imagePath: 'assets/images/Pengobatan.png',
      ),
      _CampaignData(
        category: 'SOSIAL',
        categoryIcon: Icons.people_outline,
        categoryColor: const Color(0xFF8B5CF6),
        categoryBgColor: const Color(0xFFF3E8FF),
        title: 'Bantu Keluarga Korban Bencana Banjir Garut',
        status: 'Aktif',
        statusColor: const Color(0xFF10B981),
        statusBgColor: const Color(0xFFD1FAE5),
        targetAmount: 20000000.0,
        collectedAmount: 8900000.0,
        donorCount: 312,
        imagePath: 'assets/images/Korban bencana.png',
      ),
      _CampaignData(
        category: 'LINGKUNGAN',
        categoryIcon: Icons.eco_outlined,
        categoryColor: const Color(0xFF10B981),
        categoryBgColor: const Color(0xFFD1FAE5),
        title: 'Tanam 10.000 Pohon untuk Hutan Kalimantan',
        status: 'Selesai',
        statusColor: const Color(0xFF3B82F6),
        statusBgColor: const Color(0xFFDBEAFE),
        targetAmount: 25000000.0,
        collectedAmount: 25000000.0,
        donorCount: 847,
        imagePath: 'assets/images/Pohon.png',
      ),
    ];
  }

  // Statistics getters
  int get totalKampanye => _campaigns.length;
  int get totalDonatur => _campaigns.fold(0, (sum, c) => sum + c.donorCount);
  double get totalDanaTerkumpul =>
      _campaigns.fold(0.0, (sum, c) => sum + c.collectedAmount);
  int get kampanyeAktif => _campaigns.where((c) => c.status == 'Aktif').length;

  void _confirmDeleteCampaign(int index) {
    final item = _campaigns[index];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Hapus Kampanye?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            'Apakah Anda yakin ingin menghapus penggalangan dana "${item.title}"? Tindakan ini tidak dapat dibatalkan.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Batal',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _campaigns.removeAt(index);
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Kampanye "${item.title}" berhasil dihapus.'),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Hapus',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showCreateCampaignDialog() {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final targetController = TextEditingController();
    final collectedController = TextEditingController();
    final donorController = TextEditingController();
    String selectedCategory = 'PENDIDIKAN';
    String selectedImage = 'assets/images/Beasiswa.png';
    String selectedStatus = 'Aktif';

    final Map<String, IconData> categoryIcons = {
      'PENDIDIKAN': Icons.school_outlined,
      'KESEHATAN': Icons.favorite_border,
      'SOSIAL': Icons.people_outline,
      'LINGKUNGAN': Icons.eco_outlined,
    };

    final Map<String, Color> categoryColors = {
      'PENDIDIKAN': const Color(0xFF0EA7E6),
      'KESEHATAN': const Color(0xFFEF4444),
      'SOSIAL': const Color(0xFF8B5CF6),
      'LINGKUNGAN': const Color(0xFF10B981),
    };

    final Map<String, Color> categoryBgs = {
      'PENDIDIKAN': const Color(0xFFE0F2FE),
      'KESEHATAN': const Color(0xFFFEE2E2),
      'SOSIAL': const Color(0xFFF3E8FF),
      'LINGKUNGAN': const Color(0xFFD1FAE5),
    };

    final Map<String, String> categoryImages = {
      'PENDIDIKAN': 'assets/images/Beasiswa.png',
      'KESEHATAN': 'assets/images/Pengobatan.png',
      'SOSIAL': 'assets/images/Korban bencana.png',
      'LINGKUNGAN': 'assets/images/Pohon.png',
    };

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: const Row(
                children: [
                  Icon(Icons.campaign, color: Color(0xFF0EA7E6)),
                  SizedBox(width: 8),
                  Text(
                    'Buat Kampanye Baru',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              content: SizedBox(
                width: 500,
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DropdownButtonFormField<String>(
                          value: selectedCategory,
                          decoration: const InputDecoration(
                            labelText: 'Kategori Kampanye',
                            border: OutlineInputBorder(),
                          ),
                          items:
                              [
                                    'PENDIDIKAN',
                                    'KESEHATAN',
                                    'SOSIAL',
                                    'LINGKUNGAN',
                                  ]
                                  .map(
                                    (cat) => DropdownMenuItem(
                                      value: cat,
                                      child: Text(cat),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (val) {
                            if (val != null) {
                              setDialogState(() {
                                selectedCategory = val;
                                selectedImage =
                                    categoryImages[val] ??
                                    'assets/images/Beasiswa.png';
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: titleController,
                          decoration: const InputDecoration(
                            labelText: 'Judul Penggalangan Dana',
                            border: OutlineInputBorder(),
                            hintText:
                                'Contoh: Bantu Renovasi Sekolah Dasar Garut',
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Judul tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: targetController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Target Dana (Rp)',
                            border: OutlineInputBorder(),
                            hintText: 'Contoh: 15000000',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Target dana tidak boleh kosong';
                            }
                            if (double.tryParse(value) == null ||
                                double.parse(value) <= 0) {
                              return 'Masukkan jumlah target dana yang valid';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: collectedController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Dana Terkumpul Awal (Rp)',
                            border: OutlineInputBorder(),
                            hintText: 'Contoh: 1000000 (Isi 0 jika baru)',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Dana terkumpul awal tidak boleh kosong';
                            }
                            if (double.tryParse(value) == null ||
                                double.parse(value) < 0) {
                              return 'Masukkan jumlah dana awal yang valid';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: donorController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Jumlah Donatur Awal',
                            border: OutlineInputBorder(),
                            hintText: 'Contoh: 0',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Jumlah donatur tidak boleh kosong';
                            }
                            if (int.tryParse(value) == null ||
                                int.parse(value) < 0) {
                              return 'Masukkan jumlah donatur yang valid';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: selectedStatus,
                          decoration: const InputDecoration(
                            labelText: 'Status Kampanye',
                            border: OutlineInputBorder(),
                          ),
                          items: ['Aktif', 'Pending', 'Selesai']
                              .map(
                                (status) => DropdownMenuItem(
                                  value: status,
                                  child: Text(status),
                                ),
                              )
                              .toList(),
                          onChanged: (val) {
                            if (val != null) {
                              setDialogState(() {
                                selectedStatus = val;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Batal',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final double target = double.parse(targetController.text);
                      final double collected = double.parse(
                        collectedController.text,
                      );
                      final int donors = int.parse(donorController.text);

                      final Color statColor = selectedStatus == 'Aktif'
                          ? const Color(0xFF10B981)
                          : (selectedStatus == 'Pending'
                                ? const Color(0xFFF59E0B)
                                : const Color(0xFF3B82F6));

                      final Color statBgColor = selectedStatus == 'Aktif'
                          ? const Color(0xFFD1FAE5)
                          : (selectedStatus == 'Pending'
                                ? const Color(0xFFFEF3C7)
                                : const Color(0xFFDBEAFE));

                      final newCampaign = _CampaignData(
                        category: selectedCategory,
                        categoryIcon:
                            categoryIcons[selectedCategory] ??
                            Icons.help_outline,
                        categoryColor:
                            categoryColors[selectedCategory] ?? Colors.blue,
                        categoryBgColor:
                            categoryBgs[selectedCategory] ??
                            Colors.blue.shade50,
                        title: titleController.text.trim(),
                        status: selectedStatus,
                        statusColor: statColor,
                        statusBgColor: statBgColor,
                        targetAmount: target,
                        collectedAmount: collected,
                        donorCount: donors,
                        imagePath: selectedImage,
                      );

                      setState(() {
                        _campaigns.add(newCampaign);
                      });

                      Navigator.pop(context);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Kampanye "${newCampaign.title}" berhasil dibuat!',
                          ),
                          backgroundColor: const Color(0xFF1EA0E5),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0EA7E6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Simpan',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildHeroText(BuildContext context, {required bool isMobile}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'HALO, ASYA 🍃',
            style: TextStyle(
              color: Color(0xFFFFD54F),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Buat Galang Dana,\nWujudkan Harapan Bersama',
          style: TextStyle(
            color: Colors.white,
            fontSize: isMobile ? 24 : 32,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Mulai galang dana dengan mudah dan cepat. Ribuan donatur siap mendukung kampanyemu.',
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: isMobile ? 14 : 15,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: _showCreateCampaignDialog,
              icon: const Icon(Icons.add, color: Colors.white, size: 18),
              label: const Text('Buat Baru Galang Dana'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF5722),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                elevation: 0,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Membuka panduan galang dana...'),
                    backgroundColor: Color(0xFF1EA0E5),
                  ),
                );
              },
              icon: const Icon(
                Icons.chrome_reader_mode_outlined,
                color: Colors.white,
                size: 18,
              ),
              label: const Text('Panduan Galang Dana'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white, width: 1.5),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyContent(BoxConstraints constraints) {
      final double width = constraints.maxWidth;
      final bool isDesktop = width >= 1024;
      final bool isTablet = width >= 600 && width < 1024;
      final bool isMobile = width < 600;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. HERO SECTION (Bounded Rounded Card)
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1100),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF0EA7E6), // Biru terang Kitabisa
                    Color(0xFF0075B7), // Biru agak gelap
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LayoutBuilder(
                  builder: (context, cardConstraints) {
                    if (isDesktop) {
                      return IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(32),
                                child: _buildHeroText(context, isMobile: false),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Image.network(
                                'https://images.unsplash.com/photo-1559027615-cd4628902d4a?q=80&w=800&auto=format&fit=crop',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                      color: Colors.white.withOpacity(0.1),
                                      child: const Icon(
                                        Icons.people,
                                        color: Colors.white,
                                        size: 48,
                                      ),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: _buildHeroText(context, isMobile: true),
                          ),
                          Image.network(
                            'https://images.unsplash.com/photo-1559027615-cd4628902d4a?q=80&w=800&auto=format&fit=crop',
                            height: 200,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                                  height: 200,
                                  color: Colors.white.withOpacity(0.1),
                                  child: const Icon(
                                    Icons.people,
                                    color: Colors.white,
                                    size: 48,
                                  ),
                                ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // 2. STAT CARDS SECTION
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1100),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: isDesktop ? 4 : (isTablet ? 2 : 1),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                mainAxisExtent: 88,
                children: [
                  _StatCard(
                    icon: Icons.campaign_outlined,
                    iconColor: const Color(0xFF0EA7E6),
                    iconBgColor: const Color(0xFFE0F2FE),
                    value: _formatNumber(totalKampanye),
                    label: 'Total Kampanye',
                    trendText: 'kampanye dibuat',
                    trendColor: const Color(0xFF0EA7E6),
                  ),
                  _StatCard(
                    icon: Icons.people_alt_outlined,
                    iconColor: const Color(0xFF8B5CF6),
                    iconBgColor: const Color(0xFFF3E8FF),
                    value: _formatNumber(totalDonatur),
                    label: 'Total Donatur',
                    trendText: 'orang telah berdonasi',
                    trendColor: const Color(0xFF8B5CF6),
                  ),
                  _StatCard(
                    icon: Icons.monetization_on_outlined,
                    iconColor: const Color(0xFF10B981),
                    iconBgColor: const Color(0xFFD1FAE5),
                    value: _formatRupiah(totalDanaTerkumpul),
                    label: 'Dana Terkumpul',
                    trendText: 'dari semua kampanye',
                    trendColor: const Color(0xFF10B981),
                  ),
                  _StatCard(
                    icon: Icons.local_fire_department_outlined,
                    iconColor: const Color(0xFFF59E0B),
                    iconBgColor: const Color(0xFFFEF3C7),
                    value: _formatNumber(kampanyeAktif),
                    label: 'Kampanye Akif',
                    trendText: 'sedang berjalan',
                    trendColor: const Color(0xFFF59E0B),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 32),

          // 3. KELOLA SECTION HEADER
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1100),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Kelola Galang Dana',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Pantau dan kelola semua kampanye galang danamu',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: _showCreateCampaignDialog,
                    icon: const Icon(Icons.add, size: 16),
                    label: const Text('Tambah Kampanye'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0EA7E6),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // 4. CAMPAIGN CARDS GRID
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1100),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _campaigns.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isDesktop ? 2 : 1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  mainAxisExtent: isMobile ? 240 : 210,
                ),
                itemBuilder: (context, index) {
                  final item = _campaigns[index];
                  return _CampaignCard(
                    data: item,
                    onDelete: () => _confirmDeleteCampaign(index),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 48),

          // 5. FOOTER
          const FooterSection(),
        ],
      );
    }

    if (widget.showScaffold) {
      return Scaffold(
        backgroundColor: const Color(0xFFF5F7FA),
        drawer: const AppDrawer(selectedIndex: 1),
        appBar: MainHeader(
          selectedIndex: 1, // Highlight the "Galang Dana" tab
          onTabChanged: (index) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
              arguments: index,
            );
          },
        ),
        body: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) => bodyContent(constraints),
          ),
        ),
      );
    } else {
      return SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) => bodyContent(constraints),
        ),
      );
    }
  }
}

class _CampaignData {
  final String category;
  final IconData categoryIcon;
  final Color categoryColor;
  final Color categoryBgColor;
  final String title;
  final String status;
  final Color statusColor;
  final Color statusBgColor;
  final double targetAmount;
  final double collectedAmount;
  final int donorCount;
  final String imagePath;

  _CampaignData({
    required this.category,
    required this.categoryIcon,
    required this.categoryColor,
    required this.categoryBgColor,
    required this.title,
    required this.status,
    required this.statusColor,
    required this.statusBgColor,
    required this.targetAmount,
    required this.collectedAmount,
    required this.donorCount,
    required this.imagePath,
  });
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String value;
  final String label;
  final String trendText;
  final Color trendColor;

  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.value,
    required this.label,
    required this.trendText,
    required this.trendColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Icon(Icons.trending_up, color: trendColor, size: 10),
                    const SizedBox(width: 2),
                    Expanded(
                      child: Text(
                        trendText,
                        style: TextStyle(
                          color: trendColor,
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CampaignCard extends StatelessWidget {
  final _CampaignData data;
  final VoidCallback onDelete;

  const _CampaignCard({
    required this.data,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = (data.collectedAmount / data.targetAmount).clamp(
      0.0,
      1.0,
    );
    final int progressPercent = (progress * 100).round();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. TOP ROW: KATEGORI & STATUS BADGE
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    color: Color(0xFF0EA7E6),
                    size: 14,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    data.category,
                    style: const TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: data.statusBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      data.status == 'Pending'
                          ? Icons.access_time_filled
                          : Icons.check_circle,
                      color: data.statusColor,
                      size: 11,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      data.status,
                      style: TextStyle(
                        color: data.statusColor,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // 2. CONTENT ROW: GAMBAR & DETAIL
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    data.imagePath,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.image, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Color(0xFF1E293B),
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 5,
                          backgroundColor: Colors.grey.shade100,
                          color: const Color(0xFF0EA7E6),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatRupiah(data.collectedAmount),
                            style: const TextStyle(
                              color: Color(0xFF0EA7E6),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '$progressPercent% dari ${_formatRupiah(data.targetAmount)}',
                            style: const TextStyle(
                              color: Color(0xFF64748B),
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.people_alt_outlined,
                            size: 12,
                            color: Color(0xFF64748B),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${_formatNumber(data.donorCount)} donatur',
                            style: const TextStyle(
                              color: Color(0xFF64748B),
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // 3. ACTION ROW: LANJUTKAN & TRASH BUTTONS
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/donasi');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0EA7E6),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Lanjutkan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward, size: 14),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              OutlinedButton(
                onPressed: onDelete,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: BorderSide(color: Colors.grey.shade300),
                  padding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Icon(Icons.delete_outline, size: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
