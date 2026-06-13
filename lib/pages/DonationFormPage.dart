import 'package:flutter/material.dart';

class DonationFormPage extends StatefulWidget {
  const DonationFormPage({super.key});

  @override
  State<DonationFormPage> createState() => _DonationFormPageState();
}

class _DonationFormPageState extends State<DonationFormPage> {
  static const Color primaryBlue = Color(0xFF0EA5E9);
  static const Color darkText = Color(0xFF1E293B);
  static const Color softText = Color(0xFF64748B);

  int _selectedAmount = 50000;
  String _selectedPaymentMethod = 'GoPay';
  bool _isAnonymous = false;

  final TextEditingController _customAmountController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _prayerController = TextEditingController();

  final List<int> _suggestedAmounts = [50000, 100000, 200000, 500000];

  final List<Map<String, dynamic>> _paymentMethods = [
    {
      'name': 'GoPay',
      'icon': Icons.account_balance_wallet_outlined,
      'color': Colors.blue,
    },
    {
      'name': 'ShopeePay',
      'icon': Icons.qr_code_scanner_outlined,
      'color': Colors.orange,
    },
    {
      'name': 'Virtual Account BCA',
      'icon': Icons.account_balance_outlined,
      'color': Colors.indigo,
    },
    {
      'name': 'Mandiri',
      'icon': Icons.account_balance_outlined,
      'color': Colors.blue.shade900,
    },
    {
      'name': 'Transfer Bank',
      'icon': Icons.swap_horiz_outlined,
      'color': Colors.grey.shade700,
    },
  ];

  @override
  void dispose() {
    _customAmountController.dispose();
    _nameController.dispose();
    _contactController.dispose();
    _prayerController.dispose();
    super.dispose();
  }

  void _onAmountSelected(int amount) {
    setState(() {
      _selectedAmount = amount;
      _customAmountController.clear();
    });
  }

  void _onCustomAmountChanged(String val) {
    final parsed = int.tryParse(val.replaceAll('.', ''));
    setState(() {
      _selectedAmount = parsed ?? 0;
    });
  }

  String _formatCurrency(int amount) {
    final formatted = amount.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
    return 'Rp $formatted';
  }

  void _submitDonation(String campaignTitle) {
    if (_selectedAmount < 10000) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Minimal donasi adalah Rp 10.000"),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Color(0xFFE8F5E9),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 48,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Donasi Berhasil!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: darkText,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Terima kasih, ${_isAnonymous ? 'Anonim' : (_nameController.text.isNotEmpty ? _nameController.text : 'Donatur')}! Donasi sebesar ${_formatCurrency(_selectedAmount + 1000)} (termasuk biaya layanan) untuk campaign \"$campaignTitle\" berhasil disalurkan.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: softText,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
                if (_prayerController.text.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Text(
                      "\"${_prayerController.text}\"",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        color: darkText,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close dialog
                      Navigator.pop(context); // Back to homepage
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Kembali ke Beranda", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isDesktop = width >= 1024;

    // Retrieve arguments
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final campaignTitle = args?['title'] ?? 'URGENT Bantu Pulihkan Fasilitas Kesehatan di Aceh!';
    final campaignImage = args?['image'] ?? 'https://picsum.photos/1200/400?random=11';

    // Left components
    final Widget campaignCard = Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                campaignImage,
                width: 90,
                height: 70,
                fit: BoxFit.cover,
                errorBuilder: (c, e, s) => Container(
                  width: 90,
                  height: 70,
                  color: Colors.pink.shade100,
                  child: const Icon(Icons.favorite, color: Colors.pink),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "ANDA BERDONASI UNTUK",
                    style: TextStyle(
                      color: primaryBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    campaignTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: darkText,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    final Widget nominalSection = Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pilih Nominal Donasi",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: darkText),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width < 480 ? 2 : 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2.2,
              ),
              itemCount: _suggestedAmounts.length,
              itemBuilder: (context, index) {
                final amt = _suggestedAmounts[index];
                final isSelected = amt == _selectedAmount;
                return InkWell(
                  onTap: () => _onAmountSelected(amt),
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFFE0F2FE) : Colors.white,
                      border: Border.all(
                        color: isSelected ? primaryBlue : const Color(0xFFCBD5E1),
                        width: isSelected ? 1.5 : 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      _formatCurrency(amt),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: isSelected ? primaryBlue : darkText,
                        fontSize: 13,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Nominal Lainnya",
              style: TextStyle(fontSize: 12, color: softText, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _customAmountController,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontWeight: FontWeight.bold, color: darkText, fontSize: 14),
              decoration: InputDecoration(
                hintText: "Minimal 10.000",
                prefixText: "Rp ",
                hintStyle: const TextStyle(fontWeight: FontWeight.normal, color: Color(0xFF94A3B8), fontSize: 13),
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: primaryBlue, width: 1.5),
                ),
              ),
              onChanged: _onCustomAmountChanged,
            ),
          ],
        ),
      ),
    );

    final Widget paymentSection = Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Metode Pembayaran",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: darkText),
            ),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _paymentMethods.length,
              separatorBuilder: (c, i) => const Divider(height: 1, color: Color(0xFFF1F5F9)),
              itemBuilder: (context, index) {
                final method = _paymentMethods[index];
                final isSelected = method['name'] == _selectedPaymentMethod;
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    setState(() {
                      _selectedPaymentMethod = method['name'];
                    });
                  },
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFFE0F2FE) : const Color(0xFFF8FAFC),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      method['icon'],
                      color: isSelected ? primaryBlue : method['color'],
                      size: 20,
                    ),
                  ),
                  title: Text(
                    method['name'],
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: darkText,
                    ),
                  ),
                  trailing: Icon(
                    isSelected ? Icons.check_circle : Icons.chevron_right,
                    color: isSelected ? primaryBlue : const Color(0xFFCBD5E1),
                    size: 20,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );

    final Widget donorDataSection = Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Data Donatur",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: darkText),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Nama Lengkap (Opsional)",
                        style: TextStyle(fontSize: 12, color: softText),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _nameController,
                        style: const TextStyle(fontSize: 13, color: darkText),
                        decoration: InputDecoration(
                          hintText: "Tulis nama Anda",
                          hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Email atau Nomor HP",
                        style: TextStyle(fontSize: 12, color: softText),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _contactController,
                        style: const TextStyle(fontSize: 13, color: darkText),
                        decoration: InputDecoration(
                          hintText: "Untuk laporan donasi",
                          hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: _isAnonymous,
                  activeColor: primaryBlue,
                  onChanged: (val) {
                    setState(() {
                      _isAnonymous = val ?? false;
                    });
                  },
                ),
                const Text(
                  "Sembunyikan nama saya (Anonim)",
                  style: TextStyle(fontSize: 13, color: darkText),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    final Widget prayerSection = Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Doa untuk Campaign Ini",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: darkText),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _prayerController,
              maxLines: 3,
              style: const TextStyle(fontSize: 13, color: darkText),
              decoration: InputDecoration(
                hintText: "Tulis doa atau dukungan (opsional)",
                hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                contentPadding: const EdgeInsets.all(12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // Right/Bottom components
    final Widget summaryCard = Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ringkasan Donasi",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: darkText),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Nominal Donasi", style: TextStyle(fontSize: 13, color: softText)),
                Text(_formatCurrency(_selectedAmount), style: const TextStyle(fontSize: 13, color: darkText, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Biaya Layanan", style: TextStyle(fontSize: 13, color: softText)),
                Text("Rp 1.000", style: TextStyle(fontSize: 13, color: darkText, fontWeight: FontWeight.bold)),
              ],
            ),
            const Divider(height: 24, color: Color(0xFFE2E8F0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total", style: TextStyle(fontSize: 14, color: darkText, fontWeight: FontWeight.bold)),
                Text(
                  _formatCurrency(_selectedAmount + 1000),
                  style: const TextStyle(fontSize: 16, color: primaryBlue, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _submitDonation(campaignTitle),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: const Text("Lanjutkan Pembayaran", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              ),
            ),
            const SizedBox(height: 12),
            const Center(
              child: Text(
                "Dengan berdonasi, Anda setuju dengan Syarat &\nKetentuan DonasiKita",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, color: softText, height: 1.4),
              ),
            ),
          ],
        ),
      ),
    );

    final Widget securityBox = Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFE0F2FE),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(Icons.shield_outlined, color: primaryBlue, size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "Transaksi Anda dijamin aman dengan sistem enkripsi berlapis.",
              style: TextStyle(fontSize: 11, color: Color(0xFF0369A1), height: 1.4, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: darkText),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Donasi",
          style: TextStyle(color: darkText, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: softText),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Butuh bantuan? Silakan hubungi pusat bantuan kami."),
                  backgroundColor: primaryBlue,
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Column(
                          children: [
                            campaignCard,
                            const SizedBox(height: 16),
                            nominalSection,
                            const SizedBox(height: 16),
                            paymentSection,
                            const SizedBox(height: 16),
                            donorDataSection,
                            const SizedBox(height: 16),
                            prayerSection,
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            summaryCard,
                            const SizedBox(height: 16),
                            securityBox,
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      campaignCard,
                      const SizedBox(height: 16),
                      nominalSection,
                      const SizedBox(height: 16),
                      paymentSection,
                      const SizedBox(height: 16),
                      donorDataSection,
                      const SizedBox(height: 16),
                      prayerSection,
                      const SizedBox(height: 24),
                      summaryCard,
                      const SizedBox(height: 16),
                      securityBox,
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
