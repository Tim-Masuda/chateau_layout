import 'package:chateau_mobile_homescreen/pages/apps_page.dart';
import 'package:chateau_mobile_homescreen/pages/chat_page.dart';
import 'package:chateau_mobile_homescreen/pages/profile_page.dart';
import 'package:chateau_mobile_homescreen/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
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
        toolbarHeight: 85,
        backgroundColor: BaseColors.secondary,
        centerTitle: true,
        title: ValueListenableBuilder(
          valueListenable: titleBar,
          builder: (BuildContext context, String value, _) {
            return Text(titleBar.value,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                ));
          },
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: const Icon(CupertinoIcons.plus, size: 31,),
            onPressed: () {},
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12),
          child: IconButton(
            icon: const Icon(CupertinoIcons.search, size: 28,),
            onPressed: () {},
          ),
          )
        ],
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onItemChoose: _onNavigationItemSelected,
      ),
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
    required this.onItemChoose,
  }) : super(key: key);

  final ValueChanged<int> onItemChoose;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIndex = 0;

  void chooseItem(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemChoose(index);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      color: BaseColors.secondary,
      margin: const EdgeInsets.all(0),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 14, left: 8, right: 8),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            _NavigationItem(
              lable: 'Apps',
              icon: Icons.crop_square,
              index: 0,
              isChoose: (selectedIndex == 0),
              onTap: chooseItem,
            ),
            _NavigationItem(
              lable: 'Chats',
              icon: Icons.circle_outlined,
              isChoose: (selectedIndex == 1),
              index: 1,
              onTap: chooseItem,
            ),
            _NavigationItem(
                lable: 'Profile',
                icon: Icons.supervised_user_circle_outlined,
                isChoose: (selectedIndex == 2),
                index: 2,
                onTap: chooseItem),
          ]),
        ),
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  const _NavigationItem(
      {Key? key,
      required this.lable,
      required this.icon,
      this.isChoose = false,
      required this.index,
      required this.onTap})
      : super(key: key);

  final int index;
  final String lable;
  final IconData icon;
  final bool isChoose;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                size: 26,
                color: isChoose ? BaseColors.textLigth : BaseColors.textDark),
            const SizedBox(
              height: 3,
            ),
            Text(
              lable,
              style: TextStyle(
                  color: isChoose ? BaseColors.textLigth : BaseColors.textDark),
            ),
            const SizedBox(
              height: 7,
            ),
            Container(
                height: 3,
                width: 25,
                decoration: isChoose
                    ? const BoxDecoration(
                        color: BaseColors.textLigth,
                        borderRadius: BorderRadius.all(Radius.circular(12)))
                    : null)
          ],
        ),
      ),
    );
  }
}
