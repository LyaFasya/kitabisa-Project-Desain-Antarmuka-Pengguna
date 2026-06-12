import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  // Kita siapkan 3 "Slot" untuk menampung desain yang berbeda-beda
  final Widget mobileBody;
  final Widget? tabletBody; // Tanda tanya (?) berarti opsional/boleh kosong
  final Widget desktopBody;

  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    this.tabletBody,
    required this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    // LayoutBuilder akan terus memantau ukuran layar secara real-time
    return LayoutBuilder(
      builder: (context, constraints) {
        // Jika lebar layar di bawah 600 pixel, anggap ini HP (Mobile)
        if (constraints.maxWidth < 600) {
          return mobileBody;
        } 
        // Jika layar antara 600 hingga 1000 pixel, anggap ini Tablet
        else if (constraints.maxWidth < 1000) {
          // Jika tabletBody tidak diisi, gunakan desain Mobile sebagai cadangan
          return tabletBody ?? mobileBody; 
        } 
        // Jika layar lebih dari 1000 pixel, anggap ini Desktop / Web
        else {
          return desktopBody;
        }
      },
    );
  }
}