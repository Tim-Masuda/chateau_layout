import 'package:chateau_mobile_homescreen/models/message_data.dart';
import 'package:chateau_mobile_homescreen/scale.dart';
import 'package:chateau_mobile_homescreen/screens/message_screen.dart';
import 'package:chateau_mobile_homescreen/theme.dart';
import 'package:chateau_mobile_homescreen/widgets/avatar.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(),
        SliverList(
          delegate: SliverChildBuilderDelegate(_delegate),
        )
      ],
    );
  }

  Widget _delegate(BuildContext context, int index) {
    return MessageBloc(
      messageData: MessageData(
        senderName: faker.person.name(),
        message: faker.lorem.sentence(),
        messageDate: DateTime(66666),
        dateMessage: Jiffy(DateTime(66666)).fromNow(),
        profilePicture: const Avatar.large(
          url:
              "https://cdn.discordapp.com/attachments/1004867968271908974/1037045682193846282/unknown.png",
        ),
      ),
    );
  }
}

class MessageBloc extends StatelessWidget {
  const MessageBloc({
    Key? key,
    required this.messageData,
  }) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MessageScreen.route(messageData)),
      child: SizedBox(
        height: 80 * context.sc,
        child: Padding(
          padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ) *
              context.sc,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Avatar.large(
                isOnline: true,
                url:
                    "https://cdn.discordapp.com/attachments/1004867968271908974/1037045682193846282/unknown.png",
              ),
              SizedBox(
                width: 8 * context.sc,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      messageData.senderName,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.3,
                      ),
                    ),
                    Text(
                      messageData.message,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        color: BaseColors.textDark,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    messageData.dateMessage.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 11,
                      letterSpacing: -0.2,
                      fontWeight: FontWeight.w600,
                      color: BaseColors.textDark,
                    ),
                  ),
                  const Spacer(
                    flex: 14,
                  ),
                  const AnimatedRound(
                    counter: 5,
                  ),
                  const Spacer(
                    flex: 9,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedRound extends StatefulWidget {
  final int counter;

  const AnimatedRound({
    Key? key,
    required this.counter,
  }) : super(key: key);

  @override
  State<AnimatedRound> createState() => _AnimatedRoundState();
}

const _duration = Duration(milliseconds: 125);
const _curve = Curves.easeInCubic;

class _AnimatedRoundState extends State<AnimatedRound>
    with SingleTickerProviderStateMixin {
  late final _controller =
      AnimationController(duration: _duration, vsync: this);
  late final _animation = CurvedAnimation(parent: _controller, curve: _curve);
  final _slideTween =
      Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero);

  @override
  void didUpdateWidget(covariant AnimatedRound oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.counter == oldWidget.counter) return;

    _controller.forward().then((_) {
      if (mounted && !_controller.isAnimating) _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => RepaintBoundary(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: ColoredBox(
            color: Colors.white,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget? child) => Padding(
                padding: const EdgeInsets.symmetric(
                      vertical: 3,
                      horizontal: 6,
                    ) +
                    EdgeInsets.symmetric(
                            vertical: _animation.value * 2,
                            horizontal: _animation.value * 2) *
                        context.sc,
                child: child,
              ),
              child: AnimatedSwitcher(
                switchInCurve: _curve,
                switchOutCurve: _curve,
                duration: _duration,
                // reverseDuration: const Duration(milliseconds: 75),
                transitionBuilder:
                    (Widget child, Animation<double> animation) =>
                        SlideTransition(
                  position: _slideTween.animate(animation),
                  child: child,
                ),
                child: Text(
                  '${widget.counter}',
                  key: ValueKey<int>(widget.counter),
                  style: const TextStyle(fontSize: 10, color: Colors.black),
                ),
              ),
            ),
          ),
        ),
      );
}
