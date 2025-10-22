import 'package:flutter/material.dart';

class CustomSegmentedButtons extends StatefulWidget {
  const CustomSegmentedButtons({Key? key}) : super(key: key);

  @override
  State<CustomSegmentedButtons> createState() => _CustomSegmentedButtonsState();
}

class _CustomSegmentedButtonsState extends State<CustomSegmentedButtons> {
  String selected = 'Home';

  final List<String> tabs = ['Home', 'Explore', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔹 The parent container for the "segmented" look
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: tabs.map((tab) {
                  final bool isSelected = selected == tab;
                  return GestureDetector(
                    onTap: () => setState(() => selected = tab),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.blue.shade50
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        tab,
                        style: TextStyle(
                          color:
                          isSelected ? Colors.blue : Colors.black87,
                          fontWeight: isSelected ? FontWeight.bold : null,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 30),

            // 🔹 Tab content area
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _buildTabContent(selected),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(String tab) {
    switch (tab) {
      case 'Home':
        return const Text('🏠 Home Screen', key: ValueKey('home'));
      case 'Explore':
        return const Text('🌍 Explore Screen', key: ValueKey('explore'));
      case 'Profile':
        return const Text('👤 Profile Screen', key: ValueKey('profile'));
      default:
        return const SizedBox();
    }
  }
}
