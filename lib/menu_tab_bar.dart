import 'package:bouek/app/presentation/screens/home_screen.dart';
import 'package:bouek/app/presentation/screens/like_screen.dart';
import 'package:bouek/app/presentation/screens/profile_screen.dart';
import 'package:bouek/app/presentation/screens/search_screen.dart';
import 'package:bouek/app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuTabBar extends StatefulWidget {
  const MenuTabBar({super.key});

  @override
  State<MenuTabBar> createState() => _MenuTabBarState();
}

class _MenuTabBarState extends State<MenuTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const LikeScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];

  final List<String> icons = [
    "assets/icons/home.svg",
    "assets/icons/heart.svg",
    "assets/icons/search.svg",
    "assets/icons/profile.svg",
  ];
  final List<String> namesIcons = [
    "Home",
    "Like",
    "Search",
    "Profile",
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: pages.length, vsync: this);
  }

  Widget buildIcon(String iconPath, bool isSelct) {
    return SvgPicture.asset(
      iconPath,
      width: 34,
      height: 34,
      color: isSelct ? primaryColor : const Color(0xffAEAEB4),
    );
  }

  List<NavigationDestination> pagesMenu() {
    return List.generate(
      pages.length,
      (index) => NavigationDestination(
          icon: buildIcon(icons[index], selectedIndex == index),
          label: namesIcons[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
            tabController.index = value;
          });
        },
        selectedIndex: selectedIndex,
        height: 71,
        indicatorColor: const Color(0xffffffff),
        backgroundColor: const Color(0xffffffff),
        destinations: pagesMenu(),
      ),
    );
  }
}
