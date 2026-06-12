import 'package:flutter/material.dart';
import '../widgets/Header.dart';
import '../widgets/Footer.dart';

class ProfilePage extends StatelessWidget {
  final bool showScaffold;
  const ProfilePage({super.key, this.showScaffold = true});

  static const Color primaryBlue = Color(0xFF18AEE2);
  static const Color darkText = Color(0xFF1E293B);
  static const Color softText = Color(0xFF94A3B8);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isDesktop = width >= 1530;
    final bool isTablet = width >= 1024 && width < 1530;
    final bool isLargeScreen = isDesktop || isTablet;

    final Widget profileCard = Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.only(top: 24),
      decoration: cardDecoration(),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 42,
            backgroundColor: primaryBlue,
            child: Text(
              "AF",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Aulya Fasya",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: darkText,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "aulyafasya@gmail.com",
            style: TextStyle(
              color: softText,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/edit-profile');
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: primaryBlue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Edit Profile",
                style: TextStyle(
                  color: primaryBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                ProfileStat(title: "24", subtitle: "Donasi"),
                VerticalDividerLine(),
                ProfileStat(title: "Rp 5,2jt", subtitle: "Total"),
                VerticalDividerLine(),
                ProfileStat(title: "3", subtitle: "Didukung"),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    icon: const Icon(Icons.favorite_border, size: 18),
                    label: const Text(
                      "Donasi",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: primaryBlue,
                      side: const BorderSide(color: primaryBlue),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text(
                      "Galang Dana",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    final Widget walletCard = Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: primaryBlue,
        borderRadius: BorderRadius.circular(14),
        boxShadow: cardShadow(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.account_balance_wallet_outlined,
                color: Colors.white,
                size: 14,
              ),
              SizedBox(width: 6),
              Text(
                "Kantong Donasi",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Spacer(),
              Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 14,
              ),
              SizedBox(width: 6),
              Text(
                "Riwayat",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "Rp 0",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF7043),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.add),
                  label: const Text(
                    "Isi Saldo",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: BorderSide(
                      color: Colors.white.withOpacity(0.3),
                    ),
                    backgroundColor: Colors.white.withOpacity(0.18),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.south_west, size: 17),
                  label: const Text(
                    "Tarik Saldo",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    final Widget preferencesCard = Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: cardDecoration(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                Text(
                  "PREFERENSI DONASI",
                  style: TextStyle(
                    color: softText,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.4,
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                Text(
                  "Lihat Semua",
                  style: TextStyle(
                    color: primaryBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const PreferenceTile(
            icon: Icons.notifications_none,
            iconColor: Colors.blue,
            bgColor: Color(0xFFE6F6FF),
            title: "Pengingat Donasi",
            value: true,
          ),
          const PreferenceTile(
            icon: Icons.sync,
            iconColor: Colors.pink,
            bgColor: Color(0xFFFFE8F2),
            title: "Donasi Otomatis",
            value: false,
          ),
          const PreferenceTile(
            icon: Icons.flash_on_outlined,
            iconColor: Colors.orange,
            bgColor: Color(0xFFFFF5DF),
            title: "Menunaikan Zakat",
            value: true,
            showDivider: false,
          ),
        ],
      ),
    );

    final Widget settingsCard = Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "PENGATURAN & BANTUAN",
              style: TextStyle(
                color: softText,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.4,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 10),
          isLargeScreen
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Expanded(
                            child: SettingTile(
                              icon: Icons.settings_outlined,
                              title: "Pengaturan",
                              subtitle: "Akun & notifikasi",
                              iconColor: Colors.indigo,
                              bgColor: Color(0xFFE9ECFF),
                              showDivider: false,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: SettingTile(
                              icon: Icons.help_outline,
                              title: "Bantuan",
                              subtitle: "Pusat bantuan & FAQ",
                              iconColor: Colors.green,
                              bgColor: Color(0xFFE4FBEF),
                              showDivider: false,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: const [
                          Expanded(
                            child: SettingTile(
                              icon: Icons.info_outline,
                              title: "Tentang KitaBisa",
                              subtitle: "Visi, misi & tim",
                              iconColor: Colors.lightBlue,
                              bgColor: Color(0xFFE3F5FF),
                              showDivider: false,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: SettingTile(
                              icon: Icons.article_outlined,
                              title: "Syarat & Ketentuan",
                              subtitle: "Privasi & kebijakan",
                              iconColor: Colors.deepOrange,
                              bgColor: Color(0xFFFFEFE2),
                              showDivider: false,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const SettingTile(
                        icon: Icons.verified_user_outlined,
                        title: "Akuntabilitas & Transparansi",
                        subtitle: "Laporan dan audit dana publik",
                        iconColor: Colors.purple,
                        bgColor: Color(0xFFF7E8FF),
                        showDivider: false,
                      ),
                    ],
                  ),
                )
              : Column(
                  children: const [
                    SettingTile(
                      icon: Icons.settings_outlined,
                      title: "Pengaturan",
                      iconColor: Colors.indigo,
                      bgColor: Color(0xFFE9ECFF),
                    ),
                    SettingTile(
                      icon: Icons.help_outline,
                      title: "Bantuan",
                      iconColor: Colors.green,
                      bgColor: Color(0xFFE4FBEF),
                    ),
                    SettingTile(
                      icon: Icons.info_outline,
                      title: "Tentang KitaBisa",
                      iconColor: Colors.lightBlue,
                      bgColor: Color(0xFFE3F5FF),
                    ),
                    SettingTile(
                      icon: Icons.article_outlined,
                      title: "Syarat & Ketentuan",
                      iconColor: Colors.deepOrange,
                      bgColor: Color(0xFFFFEFE2),
                    ),
                    SettingTile(
                      icon: Icons.verified_user_outlined,
                      title: "Akuntabilitas & Transparansi",
                      iconColor: Colors.purple,
                      bgColor: Color(0xFFF7E8FF),
                      showDivider: false,
                    ),
                  ],
                ),
        ],
      ),
    );

    final Widget downloadBanner = Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(
        horizontal: isLargeScreen ? 24 : 16,
        vertical: isLargeScreen ? 20 : 16,
      ),
      decoration: cardDecoration(),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: const Color(0xFF0EA5E9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.file_download_outlined,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Download Aplikasi KitaBisa",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: darkText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isLargeScreen
                      ? "Donasi lebih mudah kapan saja dan di mana saja lewat aplikasi kami"
                      : "Pengalaman donasi lebih mudah",
                  style: const TextStyle(
                    color: softText,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          if (isLargeScreen) ...[
            TextButton(
              onPressed: () {},
              child: const Text(
                "Pelajari",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF7043),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
            ),
            child: const Text(
              "Install",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );

    if (!showScaffold) {
      if (isLargeScreen) {
        final double contentMaxWidth = isDesktop ? 1200 : 960;
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: contentMaxWidth),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: isDesktop ? 2 : 5,
                            child: Column(
                              children: [
                                profileCard,
                                const SizedBox(height: 20),
                                walletCard,
                              ],
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            flex: isDesktop ? 3 : 7,
                            child: Column(
                              children: [
                                preferencesCard,
                                const SizedBox(height: 20),
                                settingsCard,
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      downloadBanner,
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
              const FooterSection(),
            ],
          ),
        );
      } else {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              profileCard,
              const SizedBox(height: 16),
              walletCard,
              const SizedBox(height: 16),
              preferencesCard,
              const SizedBox(height: 16),
              settingsCard,
              const SizedBox(height: 16),
              downloadBanner,
              const SizedBox(height: 24),
              const FooterSection(),
            ],
          ),
        );
      }
    }

    if (isLargeScreen) {
      final double contentMaxWidth = isDesktop ? 1200 : 960;
      return Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        appBar: const MainHeader(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: contentMaxWidth),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: isDesktop ? 2 : 5,
                            child: Column(
                              children: [
                                profileCard,
                                const SizedBox(height: 20),
                                walletCard,
                              ],
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            flex: isDesktop ? 3 : 7,
                            child: Column(
                              children: [
                                preferencesCard,
                                const SizedBox(height: 20),
                                settingsCard,
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      downloadBanner,
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
              const FooterSection(),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        appBar: const MainHeader(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              profileCard,
              const SizedBox(height: 16),
              walletCard,
              const SizedBox(height: 16),
              preferencesCard,
              const SizedBox(height: 16),
              settingsCard,
              const SizedBox(height: 16),
              downloadBanner,
              const SizedBox(height: 24),
              const FooterSection(),
            ],
          ),
        ),
      );
    }
  }

  static BoxDecoration cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: cardShadow(),
    );
  }

  static List<BoxShadow> cardShadow() {
    return [
      BoxShadow(
        color: Colors.black.withOpacity(0.08),
        blurRadius: 8,
        offset: const Offset(0, 3),
      ),
    ];
  }
}

class ProfileStat extends StatelessWidget {
  final String title;
  final String subtitle;

  const ProfileStat({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: ProfilePage.darkText,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 12,
            color: ProfilePage.softText,
          ),
        ),
      ],
    );
  }
}

class VerticalDividerLine extends StatelessWidget {
  const VerticalDividerLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 1,
      color: const Color(0xFFE5E7EB),
    );
  }
}

class PreferenceTile extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final String title;
  final bool value;
  final bool showDivider;

  const PreferenceTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.title,
    required this.value,
    this.showDivider = true,
  });

  @override
  State<PreferenceTile> createState() => _PreferenceTileState();
}

class _PreferenceTileState extends State<PreferenceTile> {
  late bool isActive;

  @override
  void initState() {
    super.initState();
    isActive = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF18AEE2);
    const Color darkText = Color(0xFF1E293B);

    final double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth < 360 ? 12 : 16,
            vertical: 2,
          ),
          leading: CircleAvatar(
            radius: screenWidth < 360 ? 18 : 20,
            backgroundColor: widget.bgColor,
            child: Icon(
              widget.icon,
              color: widget.iconColor,
              size: screenWidth < 360 ? 17 : 19,
            ),
          ),
          title: Text(
            widget.title,
            style: TextStyle(
              fontSize: screenWidth < 360 ? 13 : 14,
              color: darkText,
            ),
          ),
          trailing: Transform.scale(
            scale: screenWidth < 360 ? 0.80 : 0.90,
            child: Switch(
              value: isActive,
              activeColor: Colors.white,
              activeTrackColor: primaryBlue,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: const Color(0xFFD6C4CB),
              onChanged: (value) {
                setState(() {
                  isActive = value;
                });
              },
            ),
          ),
        ),
        if (widget.showDivider)
          const Divider(
            height: 1,
            indent: 70,
            endIndent: 16,
          ),
      ],
    );
  }
}
class SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Color iconColor;
  final Color bgColor;
  final bool showDivider;

  const SettingTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.iconColor,
    required this.bgColor,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: bgColor,
            child: Icon(icon, color: iconColor, size: 20),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: ProfilePage.darkText,
            ),
          ),
          subtitle: subtitle != null
              ? Text(
                  subtitle!,
                  style: const TextStyle(
                    fontSize: 11,
                    color: ProfilePage.softText,
                  ),
                )
              : null,
          trailing: const Icon(
            Icons.chevron_right,
            color: Color(0xFFCBD5E1),
          ),
        ),
        if (showDivider)
          const Divider(height: 1, indent: 70, endIndent: 16),
      ],
    );
  }
}
