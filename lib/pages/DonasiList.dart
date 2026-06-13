import 'package:flutter/material.dart';
import '../models/DonationData.dart';
import '../widgets/DonationListItem.dart';
import '../widgets/Footer.dart';
import '../widgets/Header.dart';
import '../widgets/AppDrawer.dart';

class DonasiListPage extends StatelessWidget {
  final bool showScaffold;
  final ValueChanged<int>? onTabChanged;

  const DonasiListPage({
    super.key,
    this.showScaffold = true,
    this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 768;

    // Filter out the Zakat/Muharram campaigns to display exactly the 5 donation campaigns from the mockup
    final items = DonationData.sampleData
        .where((d) => !d.title.contains('Zakat') && !d.title.contains('Muharram'))
        .toList();

    Widget bodyContent(BoxConstraints constraints) {
      final double width = constraints.maxWidth;
      final bool isDesktop = width >= 1024;
      final bool isTablet = width >= 600 && width < 1024;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildFilterBar(width),
          _buildCategoryChips(width),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width < 600 ? 16 : 24,
              vertical: 24,
            ),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: width < 600
                    ? _buildMobileList(context, items)
                    : (isTablet
                        ? _buildTabletGrid(context, items)
                        : _buildDesktopGrid(context, items, width)),
              ),
            ),
          ),
          _buildLihatLainnya(),
          const SizedBox(height: 40),
          const FooterSection(),
        ],
      );
    }

    if (showScaffold) {
      return Scaffold(
        backgroundColor: const Color(0xFFF8FAFC),
        drawer: const AppDrawer(selectedIndex: 2),
        appBar: MainHeader(
          selectedIndex: 2, // Highlight the "Donasi" tab
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

  Widget _buildFilterBar(double screenWidth) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: EdgeInsets.symmetric(horizontal: screenWidth < 600 ? 16 : 24),
          child: Builder(
            builder: (context) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFilterItem(context, Icons.tune, 'Kategori'),
                Container(width: 1, height: 20, color: const Color(0xFFE2E8F0)),
                _buildFilterItem(context, Icons.swap_vert, 'Urutkan'),
                Container(width: 1, height: 20, color: const Color(0xFFE2E8F0)),
                _buildFilterItem(context, Icons.filter_list, 'Filter'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterItem(BuildContext context, IconData icon, String label) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Membuka opsi $label..."),
            duration: const Duration(seconds: 2),
            backgroundColor: const Color(0xFF1EA0E5),
          ),
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: const Color(0xFF64748B)),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF1E293B),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChips(double screenWidth) {
    const categories = ['REKOMENDASI', 'Darurat', 'Kesehatan', 'Pendidikan', 'Lingkungan', 'Sosial'];
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 12, top: 12),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: EdgeInsets.symmetric(horizontal: screenWidth < 600 ? 16 : 24),
          alignment: Alignment.centerLeft,
          child: Builder(
            builder: (context) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((cat) {
                  final isActive = cat == 'REKOMENDASI';
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Menampilkan kategori $cat..."),
                            duration: const Duration(seconds: 2),
                            backgroundColor: const Color(0xFF1EA0E5),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                        decoration: BoxDecoration(
                          color: isActive ? const Color(0xFFE63946) : const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isActive ? const Color(0xFFE63946) : const Color(0xFFE2E8F0),
                          ),
                        ),
                        child: Text(
                          cat,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: isActive ? Colors.white : const Color(0xFF475569),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopGrid(BuildContext context, List<DonationData> items, double width) {
    // Top Row: Featured (flex 2) + Standard Vertical (flex 1)
    // Bottom Row: Grid of 3 Columns
    final gridWidth = (width - 48).clamp(0.0, 1200.0);
    final cellWidth = (gridWidth - 32) / 3; // 2 spacings of 16px
    final double aspect = cellWidth / 320.0;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: DonationListItem(
                data: items[0],
                layout: DonationCardLayout.featured,
                onTap: () => _goToDetail(context),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: DonationListItem(
                data: items[1],
                layout: DonationCardLayout.vertical,
                onTap: () => _goToDetail(context),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: aspect,
          children: [
            DonationListItem(
              data: items[2],
              layout: DonationCardLayout.vertical,
              onTap: () => _goToDetail(context),
            ),
            DonationListItem(
              data: items[3],
              layout: DonationCardLayout.vertical,
              onTap: () => _goToDetail(context),
            ),
            DonationListItem(
              data: items[4],
              layout: DonationCardLayout.vertical,
              onTap: () => _goToDetail(context),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTabletGrid(BuildContext context, List<DonationData> items) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return DonationListItem(
          data: items[index],
          layout: DonationCardLayout.vertical,
          onTap: () => _goToDetail(context),
        );
      },
    );
  }

  Widget _buildMobileList(BuildContext context, List<DonationData> items) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: DonationListItem(
            data: items[index],
            layout: DonationCardLayout.vertical,
            onTap: () => _goToDetail(context),
          ),
        );
      },
    );
  }

  Widget _buildLihatLainnya() {
    return Builder(
      builder: (context) => Center(
        child: OutlinedButton.icon(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Memuat lebih banyak kampanye donasi..."),
                duration: Duration(seconds: 2),
                backgroundColor: Color(0xFF1EA0E5),
              ),
            );
          },
          icon: const Text(
            'Lihat Lainnya',
            style: TextStyle(
              fontSize: 13,
            color: Color(0xFF475569),
            fontWeight: FontWeight.bold,
          ),
        ),
        label: const Icon(Icons.keyboard_arrow_down, size: 18, color: Color(0xFF475569)),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            side: const BorderSide(color: Color(0xFFCBD5E1)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            backgroundColor: const Color(0xFFF1F5F9),
          ),
        ),
      ),
    );
  }

  void _goToDetail(BuildContext context) {
    Navigator.pushNamed(context, '/donasi');
  }
}

