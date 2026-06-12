import 'package:flutter/material.dart';
import '../models/DonationData.dart';
import '../widgets/DonationListItem.dart';
import '../widgets/Footer.dart';

class DonasiListPage extends StatelessWidget {
  const DonasiListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final items = DonationData.sampleData;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: _buildAppBar(context, isMobile),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildFilterBar(isMobile),
            _buildCategoryChips(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24, vertical: 16),
              child: isMobile
                  ? _buildMobileList(context, items)
                  : _buildDesktopGrid(context, items),
            ),
            _buildLihatLainnya(),
            const SizedBox(height: 24),
            const FooterSection(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, bool isMobile) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(48),
      child: Container(
        height: 48 + MediaQuery.of(context).padding.top,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF10A8E5), Color(0xFF0887C2)]),
        ),
        child: Row(children: [
          IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white, size: 22),
              onPressed: () => Navigator.of(context).pop()),
          const Text('Bantu Siapa Hari Ini?',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
          const Spacer(),
          if (!isMobile) ...[
            _buildAppBarTab('Donasi', isActive: true),
            _buildAppBarTab('Kabar'),
            _buildAppBarTab('Pesan'),
            _buildAppBarTab('Akun'),
            const SizedBox(width: 12),
          ],
        ]),
      ),
    );
  }

  Widget _buildAppBarTab(String label, {bool isActive = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(label, style: TextStyle(
        color: Colors.white, fontSize: 13,
        fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
      )),
    );
  }

  Widget _buildFilterBar(bool isMobile) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildFilterItem(Icons.tune, 'Kategori'),
          Container(width: 1, height: 20, color: const Color(0xFFE0E0E0)),
          _buildFilterItem(Icons.swap_vert, 'Urutkan'),
          Container(width: 1, height: 20, color: const Color(0xFFE0E0E0)),
          _buildFilterItem(Icons.filter_list, 'Filter'),
        ],
      ),
    );
  }

  Widget _buildFilterItem(IconData icon, String label) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Icon(icon, size: 16, color: const Color(0xFF555555)),
      const SizedBox(width: 6),
      Text(label, style: const TextStyle(fontSize: 13, color: Color(0xFF555555))),
    ]);
  }

  Widget _buildCategoryChips() {
    const categories = ['REKOMENDASI', 'Darurat', 'Kesehatan', 'Pendidikan', 'Lingkungan', 'Sosial'];
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 16, bottom: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories.map((cat) {
            final isActive = cat == 'REKOMENDASI';
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                decoration: BoxDecoration(
                  color: isActive ? const Color(0xFFE63946) : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: isActive ? const Color(0xFFE63946) : const Color(0xFFD0D0D0)),
                ),
                child: Text(cat, style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w600,
                  color: isActive ? Colors.white : const Color(0xFF555555),
                )),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildDesktopGrid(BuildContext context, List<DonationData> items) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1100),
      child: Column(children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(flex: 6, child: DonationListItem(data: items[0], layout: DonationCardLayout.featured, onTap: () => _goToDetail(context))),
          const SizedBox(width: 16),
          Expanded(flex: 4, child: DonationListItem(data: items[1], layout: DonationCardLayout.vertical, onTap: () => _goToDetail(context))),
        ]),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 0.72,
          ),
          itemCount: items.length - 2,
          itemBuilder: (_, i) => DonationListItem(data: items[i + 2], layout: DonationCardLayout.vertical, onTap: () => _goToDetail(context)),
        ),
      ]),
    );
  }

  Widget _buildMobileList(BuildContext context, List<DonationData> items) {
    return Column(
      children: items.map((item) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: DonationListItem(data: item, layout: DonationCardLayout.horizontal, onTap: () => _goToDetail(context)),
      )).toList(),
    );
  }

  Widget _buildLihatLainnya() {
    return Center(
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: const Text('Lihat Lainnya', style: TextStyle(fontSize: 13, color: Color(0xFF555555))),
        label: const Icon(Icons.keyboard_arrow_down, size: 18, color: Color(0xFF555555)),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          side: const BorderSide(color: Color(0xFFD0D0D0)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }

  void _goToDetail(BuildContext context) {
    Navigator.pushNamed(context, '/donasi');
  }
}

