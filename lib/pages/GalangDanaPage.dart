import 'package:flutter/material.dart';

class GalangDanaPage extends StatelessWidget {
  const GalangDanaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final isDesktop = width >= 1200;
    final isTablet = width >= 768 && width < 1200;

    final campaignImages = [
      'assets/images/Beasiswa.png',
      'assets/images/Korban bencana.png',
      'assets/images/Pengobatan.png',
      'assets/images/Pohon.png',
    ];

    final campaignTitles = [
      'Beasiswa untuk Anak Indonesia',
      'Bantu Korban Bencana Alam',
      'Pengobatan untuk Pasien Kritis',
      'Tanam Pohon untuk Masa Depan',
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 60,
              ),
              decoration: const BoxDecoration(
                color: Color(0xff08A8E8),
              ),
              child: Column(
                children: const [
                  Text(
                    "Galang Dana Online untuk\nBantu Sesama",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 16),

                  Text(
                    "Buat kampanye dan kumpulkan dukungan dari ribuan donatur.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: isDesktop ? 4 : 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 2,
                children: const [
                  _StatCard("4", "Kampanye"),
                  _StatCard("1.351", "Donatur"),
                  _StatCard("Rp40JT", "Dana Terkumpul"),
                  _StatCard("2", "Aktif"),
                ],
              ),
            ),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Kelola Galang Dana",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text("Tambah"),
                  )
                ],
              ),
            ),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isDesktop
                      ? 2
                      : isTablet
                          ? 2
                          : 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio:
                      isDesktop ? 2.2 : 1.5,
                ),
                itemBuilder: (context, index) {
                  return _CampaignCard(
                    imagePath: campaignImages[index],
                    title: campaignTitles[index],
                  );
                },
              ),
            ),

            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xff08A8E8),
            ),
          ),
          Text(label),
        ],
      ),
    );
  }
}

class _CampaignCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const _CampaignCard({
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [

            ClipRRect(
              borderRadius:
                  BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [

                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const LinearProgressIndicator(
                    value: .45,
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    "Rp8.900.000 terkumpul",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 12),

                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Lanjutkan",
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
