import 'package:flutter/material.dart';
import '../widgets/SubPageHeader.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  static const Color primaryBlue = Color(0xFF18AEE2);
  static const Color softText = Color(0xFF94A3B8);

  final TextEditingController nameController =
      TextEditingController(text: "Aulya Fasya");
  final TextEditingController emailController =
      TextEditingController(text: "aulyafasya@gmail.com");
  final TextEditingController phoneController =
      TextEditingController(text: "0812-3456-7890");
  final TextEditingController cityController =
      TextEditingController(text: "Malang, Jawa Timur");
  final TextEditingController bioController =
      TextEditingController(text: "Senang berbagi dan membantu sesama.");

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    cityController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width >= 1024;

    final Widget headerProfileCard = Container(
      margin: EdgeInsets.symmetric(horizontal: isLargeScreen ? 0 : 16),
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: cardShadow(),
      ),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: primaryBlue,
                child: Text(
                  "AF",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                right: -2,
                bottom: 4,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFE5E7EB),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    color: primaryBlue,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Text(
            "Ubah Foto Profile",
            style: TextStyle(
              color: primaryBlue,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "Gunakan foto yang jelas agar akun mudah dikenali",
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: softText,
                fontSize: 12,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );

    final Widget formDataCard = Container(
      margin: EdgeInsets.symmetric(horizontal: isLargeScreen ? 0 : 16),
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
      decoration: cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "DATA DIRI",
            style: TextStyle(
              color: softText,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.4,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 22),
          isLargeScreen
              ? Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ProfileInputField(
                            label: "Nama Lengkap",
                            hint: "Masukkan nama lengkap",
                            icon: Icons.person_outline,
                            controller: nameController,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ProfileInputField(
                            label: "Email",
                            hint: "Masukkan email",
                            icon: Icons.email_outlined,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Expanded(
                          child: ProfileInputField(
                            label: "Nomor Telepon",
                            hint: "Masukkan nomor telepon",
                            icon: Icons.phone_outlined,
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ProfileInputField(
                            label: "Kota Domisili",
                            hint: "Masukkan kota domisili",
                            icon: Icons.location_on_outlined,
                            controller: cityController,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    ProfileInputField(
                      label: "Bio Singkat",
                      hint: "Tulis bio singkat",
                      icon: Icons.edit_note_outlined,
                      controller: bioController,
                      maxLines: 3,
                    ),
                  ],
                )
              : Column(
                  children: [
                    ProfileInputField(
                      label: "Nama Lengkap",
                      hint: "Masukkan nama lengkap",
                      icon: Icons.person_outline,
                      controller: nameController,
                    ),
                    const SizedBox(height: 14),
                    ProfileInputField(
                      label: "Email",
                      hint: "Masukkan email",
                      icon: Icons.email_outlined,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 14),
                    ProfileInputField(
                      label: "Nomor Telepon",
                      hint: "Masukkan nomor telepon",
                      icon: Icons.phone_outlined,
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 14),
                    ProfileInputField(
                      label: "Kota Domisili",
                      hint: "Masukkan kota domisili",
                      icon: Icons.location_on_outlined,
                      controller: cityController,
                    ),
                    const SizedBox(height: 14),
                    ProfileInputField(
                      label: "Bio Singkat",
                      hint: "Tulis bio singkat",
                      icon: Icons.edit_note_outlined,
                      controller: bioController,
                      maxLines: 3,
                    ),
                  ],
                ),
        ],
      ),
    );

    final Widget accountSecurityCard = Container(
      margin: EdgeInsets.symmetric(horizontal: isLargeScreen ? 0 : 16),
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "KEAMANAN AKUN",
              style: TextStyle(
                color: softText,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.4,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(height: 8),
          EditMenuTile(
            icon: Icons.lock_outline,
            title: "Ubah Password",
            subtitle: "Perbarui password akun kamu",
            iconColor: Colors.indigo,
            bgColor: Color(0xFFE9ECFF),
          ),
          EditMenuTile(
            icon: Icons.verified_user_outlined,
            title: "Verifikasi Akun",
            subtitle: "Lengkapi verifikasi agar akun lebih aman",
            iconColor: Colors.green,
            bgColor: Color(0xFFE4FBEF),
            showDivider: false,
          ),
        ],
      ),
    );

    final Widget actionButtons = isLargeScreen
        ? Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: primaryBlue,
                    side: const BorderSide(color: primaryBlue),
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Batal",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Profile berhasil disimpan"),
                        backgroundColor: primaryBlue,
                      ),
                    );
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Simpan Perubahan",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          )
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Profile berhasil disimpan"),
                        backgroundColor: primaryBlue,
                      ),
                    );
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Simpan Perubahan",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: primaryBlue,
                    side: const BorderSide(color: primaryBlue),
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Batal",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          );

    if (isLargeScreen) {
      return Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        appBar: const SubPageHeader(title: "Edit Profile"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            headerProfileCard,
                            const SizedBox(height: 20),
                            accountSecurityCard,
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        flex: 7,
                        child: Column(
                          children: [
                            formDataCard,
                            const SizedBox(height: 24),
                            actionButtons,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        appBar: const SubPageHeader(title: "Edit Profile"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 22),
              headerProfileCard,
              const SizedBox(height: 20),
              formDataCard,
              const SizedBox(height: 20),
              accountSecurityCard,
              const SizedBox(height: 30),
              actionButtons,
              const SizedBox(height: 40),
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

class ProfileInputField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int maxLines;

  const ProfileInputField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF18AEE2);
    const Color darkText = Color(0xFF1E293B);
    const Color softText = Color(0xFF94A3B8);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: darkText,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),

        const SizedBox(height: 8),

        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: const TextStyle(
            color: darkText,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: softText,
              fontSize: 13,
            ),
            prefixIcon: Icon(
              icon,
              color: primaryBlue,
              size: 20,
            ),
            filled: true,
            fillColor: const Color(0xFFF8FAFC),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 13,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFFE5E7EB),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: primaryBlue,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class EditMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;
  final Color bgColor;
  final bool showDivider;

  const EditMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
    required this.bgColor,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    const Color darkText = Color(0xFF1E293B);
    const Color softText = Color(0xFF94A3B8);

    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: bgColor,
            child: Icon(
              icon,
              color: iconColor,
              size: 20,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: darkText,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(
              color: softText,
              fontSize: 11,
            ),
          ),
          trailing: const Icon(
            Icons.chevron_right,
            color: Color(0xFFCBD5E1),
          ),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Membuka pengaturan $title..."),
                duration: const Duration(seconds: 2),
                backgroundColor: const Color(0xFF1EA0E5),
              ),
            );
          },
        ),
        if (showDivider)
          const Divider(
            height: 1,
            indent: 70,
            endIndent: 16,
          ),
      ],
    );
  }
}
