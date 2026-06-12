import 'package:flutter/material.dart';

class DonasiNavbar extends StatelessWidget implements PreferredSizeWidget {
  final String activeMenu;

  const DonasiNavbar({super.key, this.activeMenu = 'Donasi'});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      height: 56,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Color(0x14000000), blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 24),
        child: Row(
          children: [
            if (isMobile)
              IconButton(
                icon: const Icon(Icons.menu, color: Color(0xFF333333)),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            Text(
              'Kitabisa',
              style: TextStyle(
                fontSize: isMobile ? 18 : 22,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF10A8E5),
                fontStyle: FontStyle.italic,
              ),
            ),
            if (!isMobile) ...[
              const SizedBox(width: 32),
              _buildNavItem('Beranda', activeMenu == 'Beranda'),
              const SizedBox(width: 24),
              _buildNavItem('Galang Dana', activeMenu == 'Galang Dana'),
              const SizedBox(width: 24),
              _buildNavItem('Donasi', activeMenu == 'Donasi'),
              const SizedBox(width: 24),
              _buildNavItem('Inbox', activeMenu == 'Inbox'),
            ],
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.search, color: Color(0xFF555555), size: 22),
              onPressed: () {},
            ),
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications_outlined, color: Color(0xFF555555), size: 22),
                  onPressed: () {},
                ),
                Positioned(
                  right: 8, top: 8,
                  child: Container(
                    width: 8, height: 8,
                    decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 4),
            Container(
              width: 32, height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(colors: [Color(0xFF10A8E5), Color(0xFF0D8ECF)]),
                border: Border.all(color: Colors.white, width: 1.5),
              ),
              child: const Center(
                child: Text('AF', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
            ),
            if (!isMobile) ...[
              const SizedBox(width: 8),
              const Text('Aulya Fasya', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF333333))),
              const Icon(Icons.keyboard_arrow_down, size: 18, color: Color(0xFF888888)),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF10A8E5) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
          color: isActive ? Colors.white : const Color(0xFF444444),
        ),
      ),
    );
  }
}
