import 'package:flutter/material.dart';

class DonationData {
  final String title;
  final String orgName;
  final String badgeType;
  final String amount;
  final String amountLabel;
  final int daysLeft;
  final double progress;
  final String? urgentBadge;
  final Color gradientStart;
  final Color gradientEnd;
  final IconData icon;

  const DonationData({
    required this.title,
    required this.orgName,
    required this.badgeType,
    required this.amount,
    this.amountLabel = 'Terkumpul',
    required this.daysLeft,
    required this.progress,
    this.urgentBadge,
    required this.gradientStart,
    required this.gradientEnd,
    required this.icon,
  });

  Color get badgeColor =>
      badgeType == 'ORG' ? const Color(0xFF10A8E5) : const Color(0xFF2D9F6F);

  static final List<DonationData> sampleData = [
    const DonationData(
      title: 'KRISIS IKLIM! Ikut Jaga Bumi Sekarang!',
      orgName: 'CollabForChange',
      badgeType: 'ORG',
      amount: 'Rp142.958.968',
      amountLabel: 'Tersedia',
      daysLeft: 12,
      progress: 0.65,
      urgentBadge: 'Darurat Krisis Iklim!',
      gradientStart: Color(0xFFFF8C42),
      gradientEnd: Color(0xFFD4451A),
      icon: Icons.public,
    ),
    const DonationData(
      title: 'Bantu 15 anak panti asuhan bintang kecil',
      orgName: 'Yayasan Panti Asuhan',
      badgeType: 'ORG',
      amount: 'Rp2.442.000',
      daysLeft: 30,
      progress: 0.15,
      gradientStart: Color(0xFF2D6A4F),
      gradientEnd: Color(0xFF52B788),
      icon: Icons.people,
    ),
    const DonationData(
      title: 'Sambut Muharram dengan Zakat Terbaik',
      orgName: 'Amal Khair Yasmin',
      badgeType: 'ORG',
      amount: 'Rp696.000',
      daysLeft: 38,
      progress: 0.08,
      gradientStart: Color(0xFF6A3093),
      gradientEnd: Color(0xFFA044FF),
      icon: Icons.auto_awesome,
    ),
    const DonationData(
      title: 'Wakaf Sebagian Harta Untuk Pengadaan Al-Qur\'an',
      orgName: 'Komunitas Pemuda Sosial',
      badgeType: 'COMMUNITY',
      amount: 'Rp294.000',
      daysLeft: 30,
      progress: 0.05,
      gradientStart: Color(0xFF1B4332),
      gradientEnd: Color(0xFF40916C),
      icon: Icons.menu_book,
    ),
    const DonationData(
      title: 'Wakaf Alirkan Air Bersih & Bangun Tempat Wudhu',
      orgName: 'Komunitas Pemuda Sosial',
      badgeType: 'COMMUNITY',
      amount: 'Rp42.500.000',
      daysLeft: 5,
      progress: 0.35,
      gradientStart: Color(0xFF0077B6),
      gradientEnd: Color(0xFF48CAE4),
      icon: Icons.water_drop,
    ),
    const DonationData(
      title: 'Bantu Layanan Kesehatan Keliling Desa Terpencil',
      orgName: 'Sehat Bersama Mandiri',
      badgeType: 'ORG',
      amount: 'Rp12.800.000',
      daysLeft: 45,
      progress: 0.10,
      gradientStart: Color(0xFF3A7CA5),
      gradientEnd: Color(0xFF81C3D7),
      icon: Icons.local_hospital,
    ),
  ];
}

