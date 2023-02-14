import 'package:chateau_mobile_homescreen/chateau_icons.dart';
import 'package:chateau_mobile_homescreen/models/message_data.dart';
import 'package:chateau_mobile_homescreen/scale.dart';
import 'package:chateau_mobile_homescreen/theme.dart';
import 'package:chateau_mobile_homescreen/widgets/avatar.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  static Route route(MessageData data) => MaterialPageRoute(
        builder: (context) => MessageScreen(
          messageData: data,
        ),
      );

  const MessageScreen({
    Key? key,
    required this.messageData,
  }) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        toolbarHeight: 72 * context.sc,
        backgroundColor: BaseColors.secondary,
        centerTitle: true,
        title: _AppBarTitle(
          messageData: messageData,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0) * context.sc,
          child: IconButton(
            iconSize: 16.0 * context.sc,
            icon: const Icon(ChateauIcons.navigate_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
            // size: 27,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18, top: 10) * context.sc,
            child: const Avatar.medium(
              url:
                  'https://kuban24.tv/wp-content/uploads/2019/09/3eadfdd8fd4fe3b999fbb77af980b6f1.jpg',
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          _MessageBackground(),
          _InputBar(),
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

class _MessageBackground extends StatelessWidget {
  _MessageBackground({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: MessageList(),
        ),
      ),
    );
  }
}

class MessageList extends StatefulWidget {
  MessageList({
    Key? key,
  }) : super(key: key);

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    var messageData = [
      Message(
        content: messageGl,
      ),
    ];
    return ListView(
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
        ...messageData
            .map((e) => _MessageTile(message: e))
            .expand((element) => [
                  element,
                  SizedBox(
                    height: 12 * context.sc,
                  )
                ]),
        SizedBox(
          height: 76 * context.sc,
        ),
      ],
    );
  }
}

class Message {
  final String content;
  final String messageDate;
  final bool isSelf;

  const Message({
    required this.content,
    this.messageDate = '18:00',
    this.isSelf = true,
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

  AlignmentGeometry get alignment =>
      isSelf ? Alignment.centerRight : Alignment.centerLeft;

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

final controller = TextEditingController();
var messageGl = '';

class _InputBar extends StatelessWidget {
  _InputBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 20, right: 16, left: 16) * context.sc,
        child: SizedBox(
          height: 46 * context.sc,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const _AttachButton(),
              SizedBox(
                width: 8 * context.sc,
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(7, 2, 28, 1),
                    hintText: 'Message',
                    suffixIconConstraints: const BoxConstraints(
                      maxHeight: 43,
                    ),
                    suffixIcon: _SendButton(),
                    contentPadding: const EdgeInsets.only(
                            left: 16, bottom: 14, top: 14, right: 8) *
                        context.sc,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(90, 77, 135, 1)),
                      borderRadius: BorderRadius.all(
                          const Radius.circular(16) * context.sc),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(90, 77, 135, 1)),
                      borderRadius: BorderRadius.all(
                          const Radius.circular(16) * context.sc),
                    ),
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

class _AttachButton extends StatelessWidget {
  const _AttachButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll<Color>(
            Color.fromRGBO(54, 49, 74, 1),
          ),
          padding: MaterialStatePropertyAll<EdgeInsets>(
            const EdgeInsets.all(11) * context.sc,
          ),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16) * context.sc,
            ),
          ),
        ),
        onPressed: () {},
        child: Icon(
          ChateauIcons.attach,
          size: 22 * context.sc,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _SendButton extends StatefulWidget {
  const _SendButton({
    Key? key,
  }) : super(key: key);

  @override
  State<_SendButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<_SendButton> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor:
              const MaterialStatePropertyAll<Color>(BaseColors.yellow),
          padding: MaterialStatePropertyAll<EdgeInsets>(
            const EdgeInsets.all(11) * context.sc,
          ),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15) * context.sc,
            ),
          ),
        ),
        onPressed: () {
          setState(() {
            messageGl = controller.text;
          });
        },
        child: Icon(
          ChateauIcons.send,
          size: 22 * context.sc,
          color: Colors.black,
        ),
      ),
    );
  }
}

class _SquareIconButton extends StatelessWidget {
  const _SquareIconButton(
      {Key? key,
      required this.backgroundColor,
      this.padding = 11,
      required this.radius,
      required this.icon,
      required this.iconTheme})
      : super(key: key);

  final Color backgroundColor;

  final double padding;

  final double radius;

  final IconData icon;

  final IconThemeData iconTheme;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(backgroundColor),
        padding: MaterialStatePropertyAll<EdgeInsets>(
          EdgeInsets.all(padding) * context.sc,
        ),
        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius) * context.sc,
          ),
        ),
      ),
      onPressed: () {},
      child: IconTheme(
        data: iconTheme,
        child: Icon(
          icon,
        ),
      ),
    );
  }
}
