import 'package:flutter/material.dart';
import '../themes/colors.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  const CustomHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70); // Tinggi Header

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 900) { 
              return _buildMobileHeader(context);
            } else {
              return _buildDesktopHeader(context);
            }
          },
        ),
      ),
    );
  }

  Widget _buildMobileHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF1EA0E5), size: 30),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        const Text(
          'Kitabisa',
          style: TextStyle(
            color: Color(0xFF1EA0E5),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        _buildActionIcons(),
      ],
    );
  }

  Widget _buildDesktopHeader(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Kitabisa',
          style: TextStyle(
            color: Color(0xFF1EA0E5),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 40),
        _navItem('Beranda'),
        _navItem('Galang Dana'),
        _navItem('Donasi', isButton: true),
        _navItem('Inbox'),
        const Spacer(),
        _buildActionIcons(showName: true),
      ],
    );
  }

  Widget _navItem(String title, {bool isButton = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10), // Mengurangi spacing teks agar pas
      child: Container(
        padding: isButton ? const EdgeInsets.symmetric(horizontal: 18, vertical: 7) : null,
        decoration: isButton
            ? BoxDecoration(
                color: const Color(0xFFE3F2FD),
                borderRadius: BorderRadius.circular(10),
              )
            : null,
        child: Text(
          title,
          style: TextStyle(
            color: isButton ? const Color(0xFF1EA0E5) : Colors.black54,
            fontWeight: isButton ? FontWeight.bold : FontWeight.w500,
            fontSize: 14, // Sedikit mengecilkan font menu agar pas di tablet lebar
          ),
        ),
      ),
    );
  }

  Widget _buildActionIcons({bool showName = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min, // Agar Row tidak mengambil full width
      children: [
        const Icon(Icons.search, color: Colors.black54, size: 26),
        const SizedBox(width: 15), // Sedikit mengurangi jarak antar ikon
        Stack(
          children: [
            const Icon(Icons.notifications_none, color: Colors.black54, size: 26),
            Positioned(
              right: 2,
              top: 2,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
              ),
            )
          ],
        ),
        const SizedBox(width: 15), // Sedikit mengurangi jarak antar ikon
        
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 14, 
                backgroundColor: Color(0xFF1EA0E5),
                child: Text('AF', style: TextStyle(color: Colors.white, fontSize: 10)),
              ),
              if (showName) ...[
                const SizedBox(width: 6),
                
                const Flexible(
                  child: Text(
                    'Aulya Fasya',
                    style: TextStyle(
                      fontWeight: FontWeight.w500, 
                      fontSize: 13 // Mengecilkan sedikit font nama (dari default 14 ke 13)
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
              
              const SizedBox(width: 2),
              
              const Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 20),
            ],
          ),
        ),
      ],
    );
  }
}
