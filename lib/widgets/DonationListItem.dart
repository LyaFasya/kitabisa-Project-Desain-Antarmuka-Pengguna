import 'package:flutter/material.dart';
import '../models/DonationData.dart';
import 'DonasiCard.dart';

enum DonationCardLayout { featured, vertical, horizontal }

class DonationListItem extends StatelessWidget {
  final DonationData data;
  final DonationCardLayout layout;
  final VoidCallback? onTap;

  const DonationListItem({
    super.key,
    required this.data,
    required this.layout,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: DonasiCard(
        padding: EdgeInsets.zero,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: _buildLayout(),
        ),
      ),
    );
  }

  Widget _buildLayout() {
    switch (layout) {
      case DonationCardLayout.featured:
        return SizedBox(
          height: 320,
          child: Row(children: [
            Expanded(child: _buildImage(double.infinity)),
            Expanded(child: _buildInfo(titleSize: 15, compact: false)),
          ]),
        );
      case DonationCardLayout.vertical:
        return SizedBox(
          height: 320,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(160),
              Expanded(child: _buildInfo(titleSize: 13, compact: true)),
            ],
          ),
        );
      case DonationCardLayout.horizontal:
        return SizedBox(
          height: 140,
          child: Row(children: [
            SizedBox(width: 140, child: _buildImage(double.infinity)),
            Expanded(child: _buildInfo(titleSize: 14, compact: false)),
          ]),
        );
    }
  }

  Widget _buildImage(double height) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [data.gradientStart, data.gradientEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(children: [
        Center(child: Icon(data.icon, size: 48, color: Colors.white.withValues(alpha: 0.3))),
        if (data.urgentBadge != null)
          Positioned(
            top: 10, left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(color: const Color(0xFFE63946), borderRadius: BorderRadius.circular(6)),
              child: Text(data.urgentBadge!, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
            ),
          ),
      ]),
    );
  }

  Widget _buildInfo({required double titleSize, required bool compact}) {
    return Padding(
      padding: EdgeInsets.all(compact ? 12 : 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: compact ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          Text(data.title, maxLines: compact ? 2 : 3, overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.w700, color: const Color(0xFF222222), height: 1.3)),
          const SizedBox(height: 6),
          _buildOrgBadge(),
          if (!compact) const Spacer(),
          if (compact) const SizedBox(height: 8),
          _buildProgressBar(),
          const SizedBox(height: 8),
          Row(children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(data.amountLabel, style: TextStyle(fontSize: 10, color: Colors.grey.shade500)),
              Text(data.amount, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Color(0xFF10A8E5))),
            ])),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text('Sisa hari', style: TextStyle(fontSize: 10, color: Colors.grey.shade500)),
              Text('${data.daysLeft}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF333333))),
            ]),
          ]),
        ],
      ),
    );
  }

  Widget _buildOrgBadge() {
    return Row(children: [
      Flexible(child: Text(data.orgName, overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 11, color: data.badgeColor, fontWeight: FontWeight.w500))),
      const SizedBox(width: 6),
      Icon(Icons.verified, size: 12, color: data.badgeColor),
      const SizedBox(width: 3),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        decoration: BoxDecoration(color: data.badgeColor, borderRadius: BorderRadius.circular(3)),
        child: Text(data.badgeType, style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.w700)),
      ),
    ]);
  }

  Widget _buildProgressBar() {
    return Container(
      height: 4,
      decoration: BoxDecoration(color: const Color(0xFFE8E8E8), borderRadius: BorderRadius.circular(2)),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft, widthFactor: data.progress.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(color: const Color(0xFF10A8E5), borderRadius: BorderRadius.circular(2)),
        ),
      ),
    );
  }
}

