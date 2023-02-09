import 'package:chateau_mobile_homescreen/chateau_icons.dart';
import 'package:chateau_mobile_homescreen/pages/apps_page.dart';
import 'package:chateau_mobile_homescreen/pages/chat_page.dart';
import 'package:chateau_mobile_homescreen/pages/profile_page.dart';
import 'package:chateau_mobile_homescreen/scale.dart';
import 'package:chateau_mobile_homescreen/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> pageIndex = ValueNotifier(1);
  final ValueNotifier<String> titleBar = ValueNotifier("Chats");

  final pages = const [
    AppsPage(),
    ChatPage(),
    ProfilePage(),
  ];

  final nameTitles = const [
    'Apps',
    'Chats',
    'Profile',
  ];

  void _onNavigationItemSelected(index) {
    titleBar.value = nameTitles[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70 * context.sc,
        backgroundColor: BaseColors.secondary,
        centerTitle: true,
        title: ValueListenableBuilder(
          valueListenable: titleBar,
          builder: (BuildContext context, String value, _) {
            return Text(
              titleBar.value,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            );
          },
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0) * context.sc,
          child: IconButton(
            icon: Icon(
              ChateauIcons.add,
              size: 20 * context.sc,
            ),
            onPressed: () {},
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12) * context.sc,
            child: IconButton(
              icon: Icon(
                ChateauIcons.search,
                size: 20 * context.sc,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
      bottomNavigationBar: const _BottomNavigationBar(),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIndex = 0;

  void selectItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20),
      ),
      child: TooltipVisibility(
        visible: false,
        child: SizedBox(
          height: 70 * context.sc,
          child: BottomNavigationBar(
            selectedItemColor: BaseColors.textLigth,
            unselectedItemColor: BaseColors.textDark,
            currentIndex: selectedIndex,
            onTap: selectItem,
            selectedIconTheme: IconThemeData(
              color: BaseColors.textLigth,
              size: 26 * context.sc,
            ),
            unselectedIconTheme: IconThemeData(
              color: BaseColors.textDark,
              size: 26 * context.sc,
            ),
            selectedLabelStyle: const TextStyle(
              color: BaseColors.textLigth,
            ),
            unselectedLabelStyle: const TextStyle(
              color: BaseColors.textDark,
            ),
            selectedFontSize: 13,
            unselectedFontSize: 13,
            backgroundColor: BaseColors.secondary,
            landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(ChateauIcons.apps),
                label: 'Apps',
              ),
              BottomNavigationBarItem(
                icon: Icon(ChateauIcons.chats),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(ChateauIcons.profile),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
