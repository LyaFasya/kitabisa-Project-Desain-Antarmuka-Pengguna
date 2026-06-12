import 'package:flutter/material.dart';
import 'DonasiCard.dart';

class FundraiserCard extends StatelessWidget {
  const FundraiserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DonasiCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Informasi Penggalangan Dana',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF222222))),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFEEEEEE)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(width: 44, height: 44,
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFD9534F))),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Penggalang Dana', style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
                          const SizedBox(height: 2),
                          const Text('RSUD Muda Sedia Kabupaten Aceh Tamiang',
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF222222))),
                          const SizedBox(height: 4),
                          Row(children: [
                            const Icon(Icons.verified, size: 14, color: Color(0xFF10A8E5)),
                            const SizedBox(width: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(color: const Color(0xFF10A8E5), borderRadius: BorderRadius.circular(4)),
                              child: const Text('ORG',
                                  style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
                            ),
                            const SizedBox(width: 6),
                            Text('Identitas terverifikasi', style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                const Divider(height: 1, color: Color(0xFFEEEEEE)),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: Row(children: [
                    Container(
                      width: 28, height: 28,
                      decoration: BoxDecoration(color: const Color(0xFFE8F4FD), borderRadius: BorderRadius.circular(6)),
                      child: const Icon(Icons.account_balance_wallet_outlined, size: 16, color: Color(0xFF10A8E5)),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(child: Text('Rincian penggunaan dana',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF333333)))),
                    const Icon(Icons.chevron_right, color: Color(0xFFBBBBBB), size: 20),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

