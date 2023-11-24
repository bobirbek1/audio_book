import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/presentation/pages/main_page/home_page.dart';
import 'package:audio_book/src/presentation/pages/main_page/library_page.dart';
import 'package:audio_book/src/presentation/pages/main_page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: switch (_currentIndex) {
        0 => const HomePage(),
        1 => const SearchPage(),
        2 => const LibraryPage(),
        _ => const SizedBox(),
      },
      bottomNavigationBar: DecoratedBox(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            color: ColorName.neutral10,
            blurRadius: 8,
            spreadRadius: 6,
            offset: Offset(0, -2),
          )
        ]),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            _getBottomNavItem(Assets.icons.homeOutline.path,
                Assets.icons.homeBold.path, "Home"),
            _getBottomNavItem(Assets.icons.searchOutline.path,
                Assets.icons.searchBold.path, "Search"),
            _getBottomNavItem(Assets.icons.document.path,
                Assets.icons.documentBold.path, "Library"),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _getBottomNavItem(
      String icon, String activeIcon, String label) {
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(
          icon,
          height: 24,
          width: 24,
          colorFilter: const ColorFilter.mode(
            ColorName.neutral60,
            BlendMode.srcIn,
          ),
        ),
        activeIcon: SvgPicture.asset(
          activeIcon,
          height: 24,
          width: 24,
          colorFilter: const ColorFilter.mode(
            ColorName.primary50,
            BlendMode.srcIn,
          ),
        ),
        label: label);
  }
}
