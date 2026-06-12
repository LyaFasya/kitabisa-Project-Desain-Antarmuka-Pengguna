import 'package:flutter/material.dart';
import '../widgets/DonasiNavbar.dart';
import '../widgets/Footer.dart';
import '../widgets/CampaignInfoCard.dart';
import '../widgets/FundraiserCard.dart';
import '../widgets/StoryCard.dart';

class DonasiPage extends StatelessWidget {
  const DonasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 900;
    final isMobile = screenWidth < 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: const DonasiNavbar(activeMenu: 'Donasi'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 48 : (isMobile ? 0 : 24),
                vertical: isDesktop ? 32 : (isMobile ? 0 : 20),
              ),
              child: isDesktop
                  ? _buildDesktopLayout(context)
                  : _buildMobileTabletLayout(context, isMobile),
            ),
            const FooterSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1100),
      child: Column(children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(flex: 55, child: _buildCampaignImage(context, isDesktop: true)),
          const SizedBox(width: 24),
          const Expanded(flex: 45, child: CampaignInfoCard(isDesktop: true)),
        ]),
        const SizedBox(height: 24),
        const FundraiserCard(),
        const SizedBox(height: 24),
        const StoryCard(),
        const SizedBox(height: 32),
      ]),
    );
  }

  Widget _buildMobileTabletLayout(BuildContext context, bool isMobile) {
    final hPad = isMobile ? 16.0 : 0.0;
    return Container(
      constraints: const BoxConstraints(maxWidth: 700),
      child: Column(children: [
        _buildCampaignImage(context, isDesktop: false),
        Padding(padding: EdgeInsets.symmetric(horizontal: hPad), child: const CampaignInfoCard(isDesktop: false)),
        const SizedBox(height: 16),
        Padding(padding: EdgeInsets.symmetric(horizontal: hPad), child: const FundraiserCard()),
        const SizedBox(height: 16),
        Padding(padding: EdgeInsets.symmetric(horizontal: hPad), child: const StoryCard()),
        const SizedBox(height: 24),
      ]),
    );
  }

  Widget _buildCampaignImage(BuildContext context, {required bool isDesktop}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: isDesktop ? BorderRadius.circular(12) : BorderRadius.zero,
        boxShadow: isDesktop
            ? const [BoxShadow(color: Color(0x0F000000), blurRadius: 12, offset: Offset(0, 4))]
            : [],
      ),
      child: ClipRRect(
        borderRadius: isDesktop ? BorderRadius.circular(12) : BorderRadius.zero,
        child: Stack(children: [
          Container(
            height: isDesktop ? 320 : 240,
            width: double.infinity,
            decoration: const BoxDecoration(color: Color(0xFFF0F0F0)),
            child: CustomPaint(painter: _CheckerboardPainter()),
          ),
          Positioned(
            top: 16, left: 16,
            child: Container(
              width: 36, height: 36,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                shape: BoxShape.circle,
                boxShadow: const [BoxShadow(color: Color(0x1F000000), blurRadius: 6, offset: Offset(0, 2))],
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.arrow_back_ios_new, size: 16, color: Color(0xFF555555)),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class _CheckerboardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const cellSize = 20.0;
    final paint1 = Paint()..color = const Color(0xFFE8E8E8);
    final paint2 = Paint()..color = const Color(0xFFF5F5F5);
    for (double y = 0; y < size.height; y += cellSize) {
      for (double x = 0; x < size.width; x += cellSize) {
        final isEven = ((x ~/ cellSize) + (y ~/ cellSize)) % 2 == 0;
        canvas.drawRect(Rect.fromLTWH(x, y, cellSize, cellSize), isEven ? paint1 : paint2);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

