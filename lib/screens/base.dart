import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waygo/screens/home.dart';
import 'package:waygo/screens/profile.dart';
import 'package:waygo/screens/search.dart';
import 'package:waygo/screens/settings.dart';

final screens = [
  HomeScreen(),
  SearchScreen(),
  ProfilePage(),
  SettingsScreen(),
];

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen>
    with SingleTickerProviderStateMixin {
  late final tabController = TabController(
    vsync: this,
    length: tabs.length,
  );

  final tabs = [
    Tab(
      icon: SvgPicture.asset(
        "assets/icons/home.svg",
        width: 30,
        height: 30,
      ),
    ),
    Tab(
      icon: SvgPicture.asset(
        "assets/icons/search.svg",
        width: 30,
        height: 30,
      ),
    ),
    Tab(
      icon: SvgPicture.asset(
        "assets/icons/profile.svg",
        width: 30,
        height: 30,
      ),
    ),
    Tab(
      icon: SvgPicture.asset(
        "assets/icons/setting.svg",
        width: 30,
        height: 30,
      ),
    ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: screens[currentIndex],
          ),
          Container(
            color: Colors.white,
            child: TabBar(
              controller: tabController,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: Color(0xFF2B478B), width: 4.0),
                insets: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 42.0),
              ),
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              tabs: [
                Tab(
                  icon: SvgPicture.asset(
                    "assets/icons/home.svg",
                    width: 30,
                    height: 30,
                  ),
                ),
                Tab(
                  icon: SvgPicture.asset(
                    "assets/icons/search.svg",
                    width: 30,
                    height: 30,
                  ),
                ),
                Tab(
                  icon: SvgPicture.asset(
                    "assets/icons/profile.svg",
                    width: 30,
                    height: 30,
                  ),
                ),
                Tab(
                  icon: SvgPicture.asset(
                    "assets/icons/setting.svg",
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
