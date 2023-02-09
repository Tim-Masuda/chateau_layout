import 'package:chateau_mobile_homescreen/chateau_icons.dart';
import 'package:chateau_mobile_homescreen/scale.dart';
import 'package:chateau_mobile_homescreen/theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerScreen extends StatefulWidget {
  const ShimmerScreen({Key? key}) : super(key: key);

  @override
  State<ShimmerScreen> createState() => _ShimmerScreenState();
}

class _ShimmerScreenState extends State<ShimmerScreen> {
  bool enableShimmer = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      enableShimmer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70 * context.sc,
        backgroundColor: BaseColors.secondary,
        centerTitle: true,
        title: const Text(
          "Chats",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500,
          ),
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
      bottomNavigationBar: ClipRRect(
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
              currentIndex: 1,
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
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, ixdex) {
                if (1 == 1) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade700,
                    highlightColor: Colors.grey.shade100,
                    enabled: enableShimmer,
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                      ),
                      title: Container(
                        color: Colors.white,
                        height: 10,
                        width: 100,
                      ),
                      subtitle: Container(
                        color: Colors.white,
                        height: 10,
                        width: 100,
                      ),
                    ),
                  );
                } else {
                  return const  Text('elseeeeeeeeee');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
