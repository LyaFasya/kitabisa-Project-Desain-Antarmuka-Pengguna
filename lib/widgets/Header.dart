import 'package:flutter/material.dart';

class MainHeader extends StatelessWidget implements PreferredSizeWidget {
  final int selectedIndex;
  final ValueChanged<int>? onTabChanged;

  const MainHeader({
    super.key,
    this.selectedIndex = 0,
    this.onTabChanged,
  });

  static const Color primaryBlue = Color(0xFF18AEE2);

  void _handleNavigation(BuildContext context, int index) {
    if (onTabChanged != null) {
      onTabChanged!.call(index);
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/home',
        (route) => false,
        arguments: index,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width >= 1024;

    if (isLargeScreen) {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        automaticallyImplyLeading: false,
        title: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _handleNavigation(context, 0),
                  child: const MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text(
                      "Kitabisa",
                      style: TextStyle(
                        color: Color(0xFF159BD3),
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                _navLink("Beranda", selectedIndex == 0, () => _handleNavigation(context, 0)),
                const SizedBox(width: 24),
                _navLink("Galang Dana", selectedIndex == 1, () => _handleNavigation(context, 1)),
                const SizedBox(width: 24),
                _navLink("Donasi", selectedIndex == 2, () => _handleNavigation(context, 2)),
                const SizedBox(width: 24),
                _navLink("Inbox", selectedIndex == 3, () => _handleNavigation(context, 3)),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.blueGrey),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Fitur Pencarian akan segera hadir!"),
                        duration: Duration(seconds: 2),
                        backgroundColor: Color(0xFF1EA0E5),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 12),
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Fitur Notifikasi akan segera hadir!"),
                        duration: Duration(seconds: 2),
                        backgroundColor: Color(0xFF1EA0E5),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(Icons.notifications_none, color: Colors.blueGrey),
                      Positioned(
                        right: -6,
                        top: -8,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Color(0xFFFF7043), // Orange/red notification badge
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            "3",
                            style: TextStyle(color: Colors.white, fontSize: 8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                InkWell(
                  onTap: () => _handleNavigation(context, 4),
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: selectedIndex == 4 ? const Color(0xFFE0F2FE) : const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 14,
                          backgroundColor: primaryBlue,
                          child: Text(
                            "AF",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "Aulya Fasya",
                          style: TextStyle(
                            color: Color(0xFF1E293B),
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: selectedIndex == 4 ? const Color(0xFF0284C7) : Colors.blueGrey,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () => _handleNavigation(context, 0),
          child: const MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              "Kitabisa",
              style: TextStyle(
                color: Color(0xFF159BD3),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.blueGrey),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Fitur Pencarian akan segera hadir!"),
                  duration: Duration(seconds: 2),
                  backgroundColor: Color(0xFF1EA0E5),
                ),
              );
            },
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Fitur Notifikasi akan segera hadir!"),
                  duration: Duration(seconds: 2),
                  backgroundColor: Color(0xFF1EA0E5),
                ),
              );
            },
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.notifications_none, color: Colors.blueGrey),
                Positioned(
                  right: -6,
                  top: -8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: primaryBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      "3",
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          InkWell(
            onTap: () => _handleNavigation(context, 4),
            borderRadius: BorderRadius.circular(15),
            child: const CircleAvatar(
              radius: 15,
              backgroundColor: primaryBlue,
              child: Text(
                "AF",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.blueGrey),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          const SizedBox(width: 8),
        ],
      );
    }
  }

  Widget _navLink(String text, bool isActive, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFE0F2FE) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? const Color(0xFF0284C7) : const Color(0xFF64748B),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}

