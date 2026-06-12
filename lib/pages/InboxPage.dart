import 'package:flutter/material.dart';
import '../widgets/Footer.dart';
import '../widgets/InboxListItem.dart';
import '../models/InboxData.dart';

class InboxPage extends StatefulWidget {
  final bool showScaffold;

  const InboxPage({super.key, this.showScaffold = false});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildTab(int index, String text) {
    final isActive = _tabController.index == index;
    return InkWell(
      onTap: () {
        _tabController.animateTo(index);
      },
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : const Color(0xFF00618C), 
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? const Color(0xFF1E293B) : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildList(List<InboxData> items) {
    final double width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width >= 1024;
    
    if (items.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.notifications_off_outlined, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          const Text(
            "Belum ada pesan",
            style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 80),
          if (isLargeScreen) const FooterSection(),
        ],
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 24),
      itemCount: items.length + (isLargeScreen ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < items.length) {
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: InboxListItem(data: items[index]),
              ),
            ),
          );
        } else {
          return const Column(
            children: [
              SizedBox(height: 40),
              FooterSection(),
            ],
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final content = Column(
      children: [
        Container(
          color: const Color(0xFF1EA0E5),
          width: double.infinity,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildTab(0, "Berita"),
                    const SizedBox(width: 12),
                    _buildTab(1, "Notifikasi"),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: const Color(0xFFF8FAFC), 
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildList(InboxData.sampleData),
                _buildList([]), // Empty for notification
              ],
            ),
          ),
        ),
      ],
    );

    if (widget.showScaffold) {
      return Scaffold(
        body: content,
      );
    }

    return content;
  }
}

