import 'package:flutter/material.dart';

class SegmentedTabSwitcher extends StatefulWidget {
  const SegmentedTabSwitcher({Key? key}) : super(key: key);

  @override
  State<SegmentedTabSwitcher> createState() => _SegmentedTabSwitcherState();
}

class _SegmentedTabSwitcherState extends State<SegmentedTabSwitcher> {
  String selectedTab = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Segmented Tabs Example')),
      body: Column(
        children: [
          const SizedBox(height: 10),

          // 🟢 The segmented button bar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SegmentedButton<String>(
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                      (states) => states.contains(WidgetState.selected)
                      ? Colors.blue.shade50
                      : Colors.white,
                ),
                foregroundColor: WidgetStateProperty.resolveWith<Color?>(
                      (states) => states.contains(WidgetState.selected)
                      ? Colors.blue
                      : Colors.black,
                ),
              ),
              segments: const [
                ButtonSegment(value: 'Home', label: Text('Home')),
                ButtonSegment(value: 'Explore', label: Text('Explore')),
                ButtonSegment(value: 'Profile', label: Text('Profile')),
              ],
              selected: {selectedTab},
              onSelectionChanged: (newSelection) {
                setState(() {
                  selectedTab = newSelection.first;
                });
              },
            ),
          ),

          const SizedBox(height: 20),

          // 🧩 The content area
          Expanded(
            child: IndexedStack(
              index: _getTabIndex(selectedTab),
              children: const [
                Center(child: Text('🏠 Home Screen')),
                Center(child: Text('🌍 Explore Screen')),
                Center(child: Text('👤 Profile Screen')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper to map tab names to index
  int _getTabIndex(String tab) {
    switch (tab) {
      case 'Home':
        return 0;
      case 'Explore':
        return 1;
      case 'Profile':
        return 2;
      default:
        return 0;
    }
  }
}
