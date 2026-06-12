import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final int selectedIndex;
  final ValueChanged<int>? onTabChanged;

  const CustomHeader({
    super.key,
    this.selectedIndex = 0,
    this.onTabChanged,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

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
            if (constraints.maxWidth < 800) {
              return _buildMobileHeader(context);
            } else {
              return _buildDesktopHeader(context);
            }
          },
        ),
      ),
    );
  }

  // --- HEADER TAMPILAN MOBILE ---
  Widget _buildMobileHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF1EA0E5), size: 30),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        GestureDetector(
          onTap: () => onTabChanged?.call(0),
          child: const MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              'Kitabisa',
              style: TextStyle(
                color: Color(0xFF1EA0E5),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const Spacer(),
        _buildActionIcons(context, showName: false),
      ],
    );
  }

  // --- HEADER TAMPILAN DESKTOP & TABLET ---
  Widget _buildDesktopHeader(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => onTabChanged?.call(0),
          child: const MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              'Kitabisa',
              style: TextStyle(
                color: Color(0xFF1EA0E5),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 40),
        _navItem('Beranda', selectedIndex == 0, () => onTabChanged?.call(0)),
        _navItem('Galang Dana', selectedIndex == 1, () => onTabChanged?.call(1)),
        _navItem('Donasi Saya', selectedIndex == 2, () => onTabChanged?.call(2), isButton: true),
        _navItem('Inbox', selectedIndex == 3, () => onTabChanged?.call(3)),
        const Spacer(),
        _buildActionIcons(context, showName: true),
      ],
    );
  }

  // Widget Item Navigasi (Teks)
  Widget _navItem(String title, bool isActive, VoidCallback onTap, {bool isButton = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: isButton || isActive ? const EdgeInsets.symmetric(horizontal: 20, vertical: 8) : null,
          decoration: isActive
              ? BoxDecoration(
                  color: const Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(10),
                )
              : isButton
                  ? BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    )
                  : null,
          child: Text(
            title,
            style: TextStyle(
              color: isActive
                  ? const Color(0xFF1EA0E5)
                  : isButton
                      ? Colors.black87
                      : Colors.black54,
              fontWeight: isActive || isButton ? FontWeight.bold : FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  // Ikon Pencarian, Notifikasi, dan Profil
  Widget _buildActionIcons(BuildContext context, {bool showName = false}) {
    return Row(
      children: [
        const Icon(Icons.search, color: Colors.black54, size: 26),
        const SizedBox(width: 20),
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
        const SizedBox(width: 20),
        InkWell(
          onTap: () => onTabChanged?.call(4),
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: selectedIndex == 4 ? const Color(0xFFE3F2FD) : Colors.white,
              border: Border.all(
                color: selectedIndex == 4 ? const Color(0xFF1EA0E5) : Colors.grey.shade200,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 16,
                  backgroundColor: Color(0xFF1EA0E5),
                  child: Text('AF', style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
                if (showName) ...[
                  const SizedBox(width: 8),
                  Text(
                    'Aulya Fasya',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: selectedIndex == 4 ? const Color(0xFF1EA0E5) : Colors.black87,
                    ),
                  ),
                ],
                const SizedBox(width: 4),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: selectedIndex == 4 ? const Color(0xFF1EA0E5) : Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}