import 'package:flutter/material.dart';
import 'package:wallpaper/pages/categories/categories_page.dart';
import 'package:wallpaper/pages/favorite/favorite_page.dart';
import 'package:wallpaper/pages/home/home_page.dart';
import 'package:wallpaper/pages/settingPage/setting_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int activePage = 0;

  final List<BottomNavigationBarItem> listItem = [
    BottomNavigationBarItem(
      icon: SizedBox(
        width: 24, // Fixed width
        height: 24, // Fixed height
        child: Image.asset('assets/images/Icon/home.png'),
      ),
      activeIcon: SizedBox(
        width: 24,
        height: 24,
        child: Image.asset(
          'assets/images/Icon/home.png',
          color: const Color(0xff00AD9F),
        ),
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: SizedBox(
        width: 24,
        height: 24,
        child: Image.asset('assets/images/Icon/category.png'),
      ),
      activeIcon: SizedBox(
        width: 24,
        height: 24,
        child: Image.asset(
          'assets/images/Icon/category.png',
          color: const Color(0xff00AD9F),
        ),
      ),
      label: 'Category',
    ),
    BottomNavigationBarItem(
      icon: SizedBox(
        width: 24,
        height: 24,
        child: Image.asset('assets/images/Icon/favorite.png'),
      ),
      activeIcon: SizedBox(
        width: 24,
        height: 24,
        child: Image.asset(
          'assets/images/Icon/favorite.png',
          color: const Color(0xff00AD9F),
        ),
      ),
      label: 'Favorite',
    ),
    const BottomNavigationBarItem(
      icon: SizedBox(
        width: 24,
        height: 24,
        child: Icon(Icons.control_point_duplicate),
      ),
      activeIcon: SizedBox(
        width: 24,
        height: 24,
        child: Icon(
          Icons.control_point_duplicate,
          color: Color(0xff00AD9F),
        ),
      ),
      label: 'Setting',
    ),
  ];

  final List<Widget> listPages = [
    const HomePage(),
    const CategoriesPage(),
    const FavoritePage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listPages[activePage],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context)
                  .colorScheme
                  .primary
                  .withOpacity(0.2), // Màu của bóng
              spreadRadius: 2, // Kích thước lan rộng của bóng
              blurRadius: 4, // Độ mờ của bóng
              offset: const Offset(0, -2), // Vị trí bóng (x, y)
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          items: listItem,
          currentIndex: activePage,
          onTap: (index) {
            setState(() {
              activePage = index;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
