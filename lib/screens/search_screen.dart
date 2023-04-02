import 'package:chateau_mobile_homescreen/chateau_icons.dart';
import 'package:chateau_mobile_homescreen/models/re%D1%81ent_slider_data.dart';
import 'package:chateau_mobile_homescreen/scale.dart';
import 'package:chateau_mobile_homescreen/theme.dart';
import 'package:chateau_mobile_homescreen/widgets/avatar.dart';
import 'package:flutter/material.dart';

var listUserRecent = [
  const RecentSliderDate(
    name: "Bob",
    avatar:
        'https://images.wallpapershq.com/wallpapers/1284/wallpaper_1284_1920x1080.jpg',
    status: 'last seen yesterday',
  ),
  const RecentSliderDate(
    name: "Bob",
    avatar:
        'https://images.wallpapershq.com/wallpapers/1284/wallpaper_1284_1920x1080.jpg',
    status: 'last seen yesterday',
  ),
  const RecentSliderDate(
    name: "Bob",
    avatar:
        'https://images.wallpapershq.com/wallpapers/1284/wallpaper_1284_1920x1080.jpg',
    status: 'last seen yesterday',
  ),
  const RecentSliderDate(
    name: "Bob",
    avatar:
        'https://images.wallpapershq.com/wallpapers/1284/wallpaper_1284_1920x1080.jpg',
    status: 'last seen yesterday',
  ),
  const RecentSliderDate(
    name: "Bob",
    avatar:
        'https://images.wallpapershq.com/wallpapers/1284/wallpaper_1284_1920x1080.jpg',
    status: 'last seen yesterday',
  ),
];

var listUserSearchOne = [
  const RecentSliderDate(
      name: "Bob",
      avatar:
          'https://images.wallpapershq.com/wallpapers/1284/wallpaper_1284_1920x1080.jpg',
      status: 'last seen yesterday'),
  const RecentSliderDate(
      name: "Bob",
      avatar:
          'https://images.wallpapershq.com/wallpapers/1284/wallpaper_1284_1920x1080.jpg',
      status: 'last seen yesterday'),
  const RecentSliderDate(
      name: "Bob",
      avatar:
          'https://images.wallpapershq.com/wallpapers/1284/wallpaper_1284_1920x1080.jpg',
      status: 'last seen yesterday'),
];

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 76 * context.sc,
            backgroundColor: BaseColors.secondary,
            title: SafeArea(child: _InputBarState()),
          ),
          // -----ПЕРВОЕ СОСТОЯНИЕ-----
          const SliverToBoxAdapter(
            child: RecentSlider(),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 18 * context.sc,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 17),
                  child: Text(
                    'Recent',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20 * context.sc,
                ),
                ...listUserRecent
                    .map((e) => RecentStateWidget(recentSliderData: e))
              ],
            ),
          ),

          // -----ПЕРВОЕ СОСТОЯНИЕ-----
          // SliverList(
          //   delegate: SliverChildListDelegate(
          //     [
          //       SizedBox(
          //         height: 10 * context.sc,
          //       ),
          //       const RecentBlocTwo(
          //         recentSliderData: RecentSliderDate(
          //             name: "Bob",
          //             avatar:
          //                 'https://kuban24.tv/wp-content/uploads/2019/09/3eadfdd8fd4fe3b999fbb77af980b6f1.jpg',
          //             status: 'last seen yesterday'),
          //       ),
          //       const RecentBlocTwo(
          //         recentSliderData: RecentSliderDate(
          //             name: "Bob",
          //             avatar:
          //                 'https://kuban24.tv/wp-content/uploads/2019/09/3eadfdd8fd4fe3b999fbb77af980b6f1.jpg',
          //             status: 'last seen yesterday'),
          //       ),
          //       const RecentBlocTwo(
          //         recentSliderData: RecentSliderDate(
          //             name: "Bob",
          //             avatar:
          //                 'https://kuban24.tv/wp-content/uploads/2019/09/3eadfdd8fd4fe3b999fbb77af980b6f1.jpg',
          //             status: 'last seen yesterday'),
          //       ),
          //       SizedBox(
          //         height: 13 * context.sc,
          //       ),
          //       const Padding(
          //         padding: EdgeInsets.only(left: 17),
          //         child: Text(
          //           'Global search',
          //           style: TextStyle(
          //             fontSize: 18,
          //             fontWeight: FontWeight.w500,
          //           ),
          //         ),
          //       ),
          //       SizedBox(
          //         height: 13 * context.sc,
          //       ),
          //       const RecentBlocTwo(
          //         recentSliderData: RecentSliderDate(
          //             name: "Bob",
          //             avatar:
          //                 'https://kuban24.tv/wp-content/uploads/2019/09/3eadfdd8fd4fe3b999fbb77af980b6f1.jpg',
          //             status: '@crowncrown'),
          //       ),
          //       const RecentBlocTwo(
          //         recentSliderData: RecentSliderDate(
          //             name: "Bob",
          //             avatar:
          //                 'https://kuban24.tv/wp-content/uploads/2019/09/3eadfdd8fd4fe3b999fbb77af980b6f1.jpg',
          //             status: '@crowncrown'),
          //       ),
          //       const RecentBlocTwo(
          //         recentSliderData: RecentSliderDate(
          //             name: "Bob",
          //             avatar:
          //                 'https://kuban24.tv/wp-content/uploads/2019/09/3eadfdd8fd4fe3b999fbb77af980b6f1.jpg',
          //             status: '@crowncrown'),
          //       ),

          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class _InputBarState extends StatefulWidget {
  @override
  State<_InputBarState> createState() => _InputBarStateState();
}

class _InputBarStateState extends State<_InputBarState> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
            bottom: 20,
          ) *
          context.sc,
      child: SizedBox(
        height: 46 * context.sc,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(255, 255, 255, 0.15),
                  hintText: 'Search chats',
                  contentPadding: const EdgeInsets.only(
                        left: 16,
                        bottom: 14,
                        top: 14,
                        right: 8,
                      ) *
                      context.sc,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(89, 77, 135, 0),
                    ),
                    borderRadius: BorderRadius.circular(16 * context.sc),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(89, 77, 135, 0),
                    ),
                    borderRadius: BorderRadius.circular(16 * context.sc),
                  ),
                  prefixIcon: const Padding(
                      padding: EdgeInsets.only(
                        bottom: 2,
                      ),
                      child: Icon(
                        ChateauIcons.search,
                        size: 22,
                      )),
                ),
              ),
            ),
            SizedBox(
              width: 10 * context.sc,
            ),
            _ClearButton(
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

class _ClearButton extends StatelessWidget {
  final void Function() onPressed;

  const _ClearButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll<Color>(
            Color.fromRGBO(255, 255, 255, 0.15),
          ),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16) * context.sc,
            ),
          ),
          padding:
              const MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.all(0)),
        ),
        onPressed: onPressed,
        child: Icon(
          Icons.clear,
          size: 25 * context.sc,
          color: Colors.white,
        ),
      ),
    );
  }
}

class RecentSlider extends StatelessWidget {
  const RecentSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: SizedBox(
        height: 100 * context.sc,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 61 * context.sc,
                child: const RecentSliderCard(
                  recentSliderData: RecentSliderDate(
                      name: "Bob",
                      avatar:
                          'https://images.wallpapershq.com/wallpapers/1284/wallpaper_1284_1920x1080.jpg',
                      status: 'last seen yesterday'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class RecentSliderCard extends StatelessWidget {
  const RecentSliderCard({
    Key? key,
    required this.recentSliderData,
  }) : super(key: key);

  final RecentSliderDate recentSliderData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar.large(
          isOnline: false,
          url: recentSliderData.avatar,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              recentSliderData.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                letterSpacing: 0.3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RecentStateWidget extends StatelessWidget {
  const RecentStateWidget({
    Key? key,
    required this.recentSliderData,
  }) : super(key: key);

  final RecentSliderDate recentSliderData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(14, 6, 45, 0.733),
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: InkWell(
          onTap: () {},
          child: SizedBox(
            height: 40 * context.sc,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Avatar.bigSmall(
                    isOnline: false,
                    url: recentSliderData.avatar,
                  ),
                  SizedBox(
                    width: 16 * context.sc,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recentSliderData.name,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 3 * context.sc,
                        ),
                        const Text(
                          'last seen yesterday',
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 11,
                            color: BaseColors.textDark,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SerchStateWidget extends StatelessWidget {
  const SerchStateWidget({
    Key? key,
    required this.recentSliderData,
  }) : super(key: key);

  final RecentSliderDate recentSliderData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          height: 40 * context.sc,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Avatar.bigSmall(
                  isOnline: false,
                  url: recentSliderData.avatar,
                ),
                SizedBox(
                  width: 16 * context.sc,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recentSliderData.name,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 3 * context.sc,
                      ),
                      Text(
                        recentSliderData.status,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 11,
                          color: BaseColors.textDark,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
