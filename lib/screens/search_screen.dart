import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chateau_mobile_homescreen/chateau_icons.dart';
import 'package:chateau_mobile_homescreen/models/re%D1%81ent_slider_data.dart';
import 'package:chateau_mobile_homescreen/scale.dart';
import 'package:chateau_mobile_homescreen/theme.dart';
import 'package:chateau_mobile_homescreen/widgets/avatar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 81,
          backgroundColor: BaseColors.secondary,
          title: SafeArea(child: _InputBarState()),
        ),
        body: _RecentSlider());
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

class _RecentSlider extends StatelessWidget {
  const _RecentSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 90,
                    child: _RecentSliderCard(
                      recentSliderData: RecentSliderDate(
                        name: "Ivan",
                        avatar: 'https://kuban24.tv/wp-content/uploads/2019/09/3eadfdd8fd4fe3b999fbb77af980b6f1.jpg',
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _RecentSliderCard extends StatelessWidget {
  const _RecentSliderCard({
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
                url:
                    recentSliderData.avatar,
              ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
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
