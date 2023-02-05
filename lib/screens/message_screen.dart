import 'package:chateau_mobile_homescreen/models/message_data.dart';
import 'package:chateau_mobile_homescreen/scale.dart';
import 'package:chateau_mobile_homescreen/theme.dart';
import 'package:chateau_mobile_homescreen/widgets/avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _testData = [
  Message(
    content: 'Are u okey & ',
    messageDate: '14:01 PM',
    isSelf: false,
  ),
  Message(
    content: 'YWow',
    messageDate: '15:02 PM',
    isSelf: true,
  ),
  Message(
    content: 'Do you want Starbucks?',
    messageDate: '16:02 PM',
    isSelf: false,
  ),
  Message(
    content: 'Would be awesome!',
    messageDate: '17:03 PM',
    isSelf: true,
  ),
  Message(
    content: 'Coming upsrfsf\nsef!dfgdfg',
    messageDate: '18:03 PM',
    isSelf: false,
  ),
  Message(
    content: 'wow',
    messageDate: '18:03 PM',
    isSelf: true,
  ),
];

class MessageScreen extends StatelessWidget {
  static Route route(MessageData data) => MaterialPageRoute(
      builder: (context) => MessageScreen(
            messageData: data,
          ));

  const MessageScreen({Key? key, required this.messageData}) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        toolbarHeight: 85 * context.sc,
        backgroundColor: BaseColors.secondary,
        centerTitle: true,
        title: _AppBarTitle(
          messageData: messageData,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0) * context.sc,
          child: IconButton(
            iconSize: 26.0,
            icon: const Icon(CupertinoIcons.back),
            onPressed: () {
              Navigator.of(context).pop();
            },
            // size: 27,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18) * context.sc,
            child: const Avatar.medium(
              url: 'https://kuban24.tv/wp-content/uploads/2019/09/3eadfdd8fd4fe3b999fbb77af980b6f1.jpg',
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          const _MessageList(),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 0,
            child: const _InputBar(),
          ),
        ],
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({
    Key? key,
    required this.messageData,
  }) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                messageData.senderName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 19,
                ),
              ),
              SizedBox(height: 2 * context.sc),
              const Text(
                'Online now',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: BaseColors.pink,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _MessageList extends StatelessWidget {
  const _MessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: BaseColors.secondary,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/chat_background.png'),
            fit: BoxFit.contain,
            repeat: ImageRepeat.repeat,
          ),
          color: BaseColors.cardDark,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            children: [
              SizedBox(
                height: 16 * context.sc,
              ),
              const _DateLable(
                lable: '6 October ',
              ),
              SizedBox(
                height: 16 * context.sc,
              ),
              ..._testData.map((e) => _MessageTile(message: e)).expand((element) => [
                    element,
                    SizedBox(
                      height: 12 * context.sc,
                    )
                  ]),
              SizedBox(
                height: 16 * context.sc,
              ),
              const _DateLable(
                lable: '6 October ',
              ),
              SizedBox(
                height: 16 * context.sc,
              ),
              ..._testData.map((e) => _MessageTile(message: e)).expand((element) => [
                    element,
                    SizedBox(
                      height: 12 * context.sc,
                    )
                  ]),
              SizedBox(
                height: 16 * context.sc,
              ),
              const _DateLable(
                lable: '6 October ',
              ),
              SizedBox(
                height: 16 * context.sc,
              ),
              ..._testData.map((e) => _MessageTile(message: e)).expand((element) => [
                    element,
                    SizedBox(
                      height: 12 * context.sc,
                    )
                  ]),
              SizedBox(
                height: 100 * context.sc,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Message {
  final String content;
  final String messageDate;
  final bool isSelf;

  const Message({
    required this.content,
    required this.messageDate,
    required this.isSelf,
  });
}

// сообщение собеседника
class _MessageTile extends StatelessWidget {
  static const _radius = Radius.circular(13);
  final Message message;

  const _MessageTile({
    Key? key,
    required this.message,
  }) : super(key: key);

  String get content => message.content;

  String get messageDate => message.messageDate;

  bool get isSelf => message.isSelf;

  AlignmentGeometry get alignment => isSelf ? Alignment.centerRight : Alignment.centerLeft;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: isSelf ? BaseColors.purple : BaseColors.purpleDark,
            borderRadius: BorderRadius.only(
              topRight: isSelf ? Radius.zero : _radius,
              bottomLeft: isSelf ? _radius : Radius.zero,
              topLeft: _radius,
              bottomRight: _radius,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  bottom: 12,
                  left: 16,
                ),
                child: Text(
                  content,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                width: 4 * context.sc,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 6,
                  right: 8,
                ),
                child: Text(
                  messageDate,
                  style: const TextStyle(
                    color: BaseColors.textDark,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// сообщение пользователя

class _DateLable extends StatelessWidget {
  const _DateLable({
    Key? key,
    required this.lable,
  }) : super(key: key);

  final String lable;

  @override
  Widget build(BuildContext context) {
    return Text(
      lable,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: BaseColors.textDark,
      ),
    );
  }
}

class _InputBar extends StatelessWidget {
  const _InputBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SafeArea(
            child: Row(
              children: [
                // Icon clip
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17) * context.sc,
                    color: const Color.fromRGBO(54, 49, 74, 1),
                  ),
                  height: 52 * context.sc,
                  width: 52 * context.sc,
                  child: IconButton(
                    icon: const Icon(
                      CupertinoIcons.paperclip,
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                ),
                // Icon clip
                SizedBox(
                  width: 10 * context.sc,
                ),
                Expanded(
                  child: Container(
                    height: 55 * context.sc,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromRGBO(90, 77, 135, 1)),
                        borderRadius: BorderRadius.circular(16) * context.sc,
                        color: const Color.fromRGBO(7, 2, 28, 1)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20 * context.sc,
                        ),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              // хз как задать размео хинту надо будет чекнуть
                              hintText: "Message",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15) * context.sc,
                            color: const Color.fromRGBO(237, 251, 139, 1),
                          ),
                          height: 47 * context.sc,
                          width: 47 * context.sc,
                          child: IconButton(
                            icon: const Icon(Icons.send),
                            color: Colors.black,
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          width: 3 * context.sc,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
