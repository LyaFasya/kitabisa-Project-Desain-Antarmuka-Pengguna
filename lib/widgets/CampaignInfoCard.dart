import 'package:flutter/material.dart';
import 'DonasiCard.dart';

class CampaignInfoCard extends StatelessWidget {
  final bool isDesktop;

  const CampaignInfoCard({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return DonasiCard(
      padding: EdgeInsets.all(isDesktop ? 24 : 20),
      borderRadius: isDesktop
          ? BorderRadius.circular(12)
          : const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isDesktop) const SizedBox(height: 4),
          Text(
            'URGENT Bantu Pulihkan\nFasilitas Kesehatan di Aceh!',
            style: TextStyle(
              fontSize: isDesktop ? 18 : 17,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF222222),
              height: 1.35,
            ),
          ),
          SizedBox(height: isDesktop ? 16 : 14),
          Text(
            'Rp29.766.000',
            style: TextStyle(
              fontSize: isDesktop ? 20 : 18,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF10A8E5),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text('Terkumpul dari ', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
              Text('Rp500.000.000', style: TextStyle(fontSize: 12, color: Colors.grey.shade600, fontWeight: FontWeight.w500)),
              const Spacer(),
              Text('8 hari lagi', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
            ],
          ),
          const SizedBox(height: 10),
          const _ProgressBar(),
          const SizedBox(height: 20),
          const _StatsRow(),
          const SizedBox(height: 20),
          const _DonasiButton(),
          const SizedBox(height: 10),
          const _BagikanButton(),
        ],
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar();
  @override
  Widget build(BuildContext context) {
    const double progress = 29766000 / 500000000;
    return Container(
      height: 6, width: double.infinity,
      decoration: BoxDecoration(color: const Color(0xFFE8E8E8), borderRadius: BorderRadius.circular(3)),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft, widthFactor: progress,
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFF10A8E5), Color(0xFF0D8ECF)]),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _stat(Icons.favorite, '2.806', 'Donasi', const Color(0xFF10A8E5)),
        Container(width: 1, height: 32, color: const Color(0xFFEEEEEE)),
        _stat(Icons.article_outlined, null, 'Kabar Terbaru', const Color(0xFF666666)),
        Container(width: 1, height: 32, color: const Color(0xFFEEEEEE)),
        _stat(Icons.account_balance_wallet_outlined, null, 'Pencairan Dana', const Color(0xFF666666)),
      ],
    );
  }

  Widget _stat(IconData icon, String? value, String label, Color color) {
    return Expanded(
      child: Column(
        children: [
          if (value != null)
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 4),
              Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: color)),
            ])
          else
            Icon(icon, size: 20, color: color),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF999999)), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class _DonasiButton extends StatelessWidget {
  const _DonasiButton();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, height: 46,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF10A8E5), foregroundColor: Colors.white,
          elevation: 2, shadowColor: const Color(0x4410A8E5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
        child: const Text('Donasi Sekarang', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, letterSpacing: 0.3)),
      ),
    );
  }
}

class _BagikanButton extends StatelessWidget {
  const _BagikanButton();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, height: 46,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.share, size: 18, color: Color(0xFF555555)),
        label: const Text('Bagikan', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF555555))),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFFDDDDDD)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }
}

