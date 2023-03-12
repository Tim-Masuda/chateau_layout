import 'package:cached_network_image/cached_network_image.dart';
import 'package:chateau_mobile_homescreen/scale.dart';
import 'package:chateau_mobile_homescreen/theme.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    required this.url,
    required this.radius,
    this.isOnline = false,
  }) : super(key: key);

  const Avatar.small({
    Key? key,
    required this.url,
    this.isOnline = false,
  })  : radius = 16,
        super(key: key);

  const Avatar.bigSmall({
    Key? key,
    required this.url,
    this.isOnline = false,
  })  : radius = 18,
        super(key: key);

  const Avatar.medium({
    Key? key,
    required this.url,
    this.isOnline = false,
  })  : radius = 20,
        super(key: key);

  const Avatar.large({
    Key? key,
    required this.url,
    this.isOnline = false,
  })  : radius = 30,
        super(key: key);

  final double radius;
  final String url;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: radius * context.sc,
          backgroundImage: CachedNetworkImageProvider(url),
          backgroundColor: Theme.of(context).cardColor,
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          height: isOnline ? 14.7 * context.sc : 0,
          width: isOnline ? 14.7 * context.sc : 0,
          right: isOnline ? 1 : 10 * context.sc,
          bottom: isOnline ? 1 : 10 * context.sc,
          child: Container(
            decoration: BoxDecoration(
              color: BaseColors.pink,
              shape: BoxShape.circle,
              border: Border.all(
                width: 3,
                color: const Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
