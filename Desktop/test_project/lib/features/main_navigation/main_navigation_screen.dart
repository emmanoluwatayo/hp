import 'package:flutter/material.dart';
import 'package:test_project/features/screens/home_screen/home_screen.dart';
import 'package:test_project/features/utils/app_colors.dart';
import 'package:test_project/features/utils/app_image.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final _listPage = [
    const HomeScreen(),
    Container(),
    Container(),
    Container(),
  ];
  final _controller = PageController();
  int _indexSelected = 0;
  void _onSelected(int index) {
    setState(() {
      _indexSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: _onSelected,
        children: _listPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AppImage.homeIcon),
                size: 25,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AppImage.accountIcon),
                size: 25,
              ),
              label: 'Accounts'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AppImage.appsIcon),
                size: 25,
              ),
              label: 'Apps'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AppImage.settingsIcon),
                size: 25,
              ),
              label: 'Settings')
        ],
        currentIndex: _indexSelected,
        onTap: (index) => _controller.animateToPage(index,
            duration: const Duration(milliseconds: 200), curve: Curves.easeIn),
        selectedItemColor: AppColors.navbarColor,
        unselectedItemColor: AppColors.unselectednavbarColor,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
