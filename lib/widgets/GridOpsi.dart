import 'package:flutter/material.dart';

class MenuGrid extends StatelessWidget {
  final ValueChanged<int>? onTabChanged;

  const MenuGrid({
    super.key,
    this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        
        // Menentukan apakah ini layar besar (Desktop/Tablet) or HP
        final bool isDesktop = constraints.maxWidth > 600;

        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          
          crossAxisCount: isDesktop ? 8 : 4,
          
          mainAxisSpacing: 16,
          crossAxisSpacing: 8,
          
          children: [
            _buildMenuIcon(
              Icons.favorite,
              'Donasi',
              Colors.pink,
              isNew: false,
              onTap: () => Navigator.pushNamed(context, '/donasi-list'),
            ),
            _buildMenuIcon(
              Icons.account_balance,
              'Zakat',
              Colors.green,
              isNew: false,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Fitur Zakat akan segera hadir!"),
                    duration: Duration(seconds: 2),
                    backgroundColor: Color(0xFF1EA0E5),
                  ),
                );
              },
            ),
            _buildMenuIcon(
              Icons.volunteer_activism,
              'Galang\nDana',
              Colors.blue,
              isNew: false,
              onTap: () {
                onTabChanged?.call(1); // Ke tab Galang Dana
              },
            ),
            _buildMenuIcon(
              Icons.event_repeat,
              'Donasi\nOtomatis',
              Colors.blueGrey,
              isNew: false,
              onTap: () {
                onTabChanged?.call(4); // Ke tab Profile
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Membuka preferensi Donasi Otomatis di tab Akun..."),
                    duration: Duration(seconds: 2),
                    backgroundColor: Color(0xFF1EA0E5),
                  ),
                );
              },
            ),
            _buildMenuIcon(
              Icons.stars,
              'Kitabisa\nExperience',
              Colors.orange,
              isNew: true,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Fitur Kitabisa Experience akan segera hadir!"),
                    duration: Duration(seconds: 2),
                    backgroundColor: Color(0xFF1EA0E5),
                  ),
                );
              },
            ),
            _buildMenuIcon(
              Icons.handshake,
              'Kolaborasi\nCSR',
              Colors.blue.shade300,
              isNew: false,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Fitur Kolaborasi CSR akan segera hadir!"),
                    duration: Duration(seconds: 2),
                    backgroundColor: Color(0xFF1EA0E5),
                  ),
                );
              },
            ),
            _buildMenuIcon(
              Icons.health_and_safety,
              'Asuransi\nSalingJaga',
              Colors.orange.shade700,
              isNew: true,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Fitur Asuransi SalingJaga akan segera hadir!"),
                    duration: Duration(seconds: 2),
                    backgroundColor: Color(0xFF1EA0E5),
                  ),
                );
              },
            ),
            _buildMenuIcon(
              Icons.mosque,
              'Masjid',
              Colors.teal,
              isNew: false,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Fitur Masjid akan segera hadir!"),
                    duration: Duration(seconds: 2),
                    backgroundColor: Color(0xFF1EA0E5),
                  ),
                );
              },
            ), 
          ],
        );
      },
    );
  }

  // Fungsi desain satuan untuk ikon tetap sama dengan InkWell
  Widget _buildMenuIcon(IconData icon, String label, Color color, {required bool isNew, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: SizedBox(
                  width: 28,
                  height: 28,
                  child: ['Donasi', 'Zakat', 'Donasi Otomatis', 'Kolaborasi CSR'].contains(label.replaceAll('\n', ' '))
                      ? Image.asset(
                          'assets/images/${label.replaceAll('\n', ' ')}.png',
                          fit: BoxFit.contain,
                        )
                      : Icon(icon, color: color, size: 28),
                ),
              ),
              if (isNew)
                Positioned(
                  top: -8,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'BARU',
                        style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: Color(0xFF4A4A4A)),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
