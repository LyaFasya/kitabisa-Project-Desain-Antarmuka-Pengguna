import 'package:flutter/material.dart';

class MenuGrid extends StatelessWidget {
  const MenuGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 5,
      childAspectRatio: 0.9,
      children: [
        _buildMenuIcon(Icons.favorite, 'Donasi', Colors.pink, isNew: false),
        _buildMenuIcon(Icons.account_balance, 'Zakat', Colors.green, isNew: false),
        _buildMenuIcon(Icons.volunteer_activism, 'Galang Dana', Colors.blue, isNew: false),
        _buildMenuIcon(Icons.event_repeat, 'Donasi\nOtomatis', Colors.blueGrey, isNew: false),
        _buildMenuIcon(Icons.stars, 'Kitabisa\nExperience', Colors.orange, isNew: false),
        _buildMenuIcon(Icons.handshake, 'Kolaborasi CSR', Colors.blue.shade300, isNew: false),
        _buildMenuIcon(Icons.health_and_safety, 'Asuransi\nSalingJaga', Colors.orange.shade700, isNew: false),
      ],
    );
  }

  Widget _buildMenuIcon(IconData icon, String label, Color color, {required bool isNew}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
              child: Icon(icon, color: color, size: 28),
            ),

            // ngasih label fitur baru cek boolean
            if (isNew)
              Positioned(
                bottom: -10,
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
    );
  }
}