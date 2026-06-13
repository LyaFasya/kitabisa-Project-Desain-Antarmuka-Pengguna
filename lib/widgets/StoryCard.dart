import 'package:flutter/material.dart';
import 'DonasiCard.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DonasiCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const Expanded(child: Text('Cerita Penggalangan Dana',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF222222)))),
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Membuka cerita selengkapnya..."),
                    duration: Duration(seconds: 2),
                    backgroundColor: Color(0xFF1EA0E5),
                  ),
                );
              },
              child: const Icon(Icons.chevron_right, color: Color(0xFFBBBBBB), size: 22),
            ),
          ]),
          const SizedBox(height: 16),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
            style: TextStyle(fontSize: 13, color: Colors.grey.shade700, height: 1.6),
          ),
          const SizedBox(height: 12),
          Text(
            'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            style: TextStyle(fontSize: 13, color: Colors.grey.shade700, height: 1.6),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 32),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F7FA),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: const Center(
              child: Text('[Additional Story Content]',
                  style: TextStyle(color: Color(0xFFAAAAAA), fontSize: 13, fontStyle: FontStyle.italic)),
            ),
          ),
        ],
      ),
    );
  }
}

