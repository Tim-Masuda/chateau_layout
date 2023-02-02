import 'package:chateau_mobile_homescreen/models/message_data.dart';
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
        SliverList(delegate: SliverChildBuilderDelegate(_delegate))
      ],
    );
  }

  Widget _delegate(BuildContext context, int index) {
    final Faker faker = Faker();
    return MessageBloc(
        messageData: MessageData(
            senderName: faker.person.name(),
            message: faker.lorem.sentence(),
            messageDate: DateTime(66666),
            dateMessage: Jiffy(DateTime(66666)).fromNow(),
            profilePicture: const Avatar.large(
              url:
                  "https://cdn.discordapp.com/attachments/1004867968271908974/1037045682193846282/unknown.png",
            )));
  }
}

class MessageBloc extends StatelessWidget {
  const MessageBloc({Key? key, required this.messageData}) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MessageScreen.route(messageData));
      },
      child: SizedBox(
        height: 87,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Avatar.large(
                url:
                    "https://cdn.discordapp.com/attachments/1004867968271908974/1037045682193846282/unknown.png",
              ),
              const SizedBox(
                width: 8,
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
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 3,
                      horizontal: 6,
                    ),
                    decoration: const BoxDecoration(
                      color: BaseColors.textLigth,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const Text(
                      '1',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
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


/*
child: Row(children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Avatar.large(
              url:
                "https://cdn.discordapp.com/attachments/1004867968271908974/1037045682193846282/unknown.png",
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Text(
                  messageData.senderName,
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.3),
                ),
              ),
              SizedBox(
                height: 40,
                child: Text(
                  messageData.message,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16,
                    color: BaseColors.textDark,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          )),
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      messageData.dateMessage.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 11,
                        letterSpacing: -0.2,
                        fontWeight: FontWeight.w600,
                        color: BaseColors.textDark,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: BaseColors.textLigth,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ]))
        ]),
*/
