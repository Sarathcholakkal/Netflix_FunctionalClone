import 'package:flutter/material.dart';

ValueNotifier<int> indexchangenotifier = ValueNotifier(0);

class BottamNavBar extends StatelessWidget {
  const BottamNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexchangenotifier,
        builder: (context, newindex, _) {
          return BottomNavigationBar(
            currentIndex: newindex,
            onTap: (index) {
              indexchangenotifier.value = index;
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.video_library_outlined), label: 'News&Hot'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sentiment_satisfied_alt_outlined),
                  label: 'Fast Laughs'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_circle_down_outlined),
                  label: 'Downloads'),
            ],
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            unselectedIconTheme: const IconThemeData(
              color: Colors.grey, // Set the color of unselected icons
              size: 24.0,
            ),
            selectedIconTheme: const IconThemeData(
              color: Colors.white,
              size: 30.0,
            ),
          );
        });
  }
}
