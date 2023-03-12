import 'package:chateau_mobile_homescreen/chateau_icons.dart';
import 'package:chateau_mobile_homescreen/models/message_data.dart';
import 'package:chateau_mobile_homescreen/scale.dart';
import 'package:chateau_mobile_homescreen/theme.dart';
import 'package:chateau_mobile_homescreen/widgets/avatar.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  static Route route(MessageData data) => MaterialPageRoute(
        builder: (context) => MessageScreen(messageData: data),
      );
  final MessageData messageData;

  const MessageScreen({
    Key? key,
    required this.messageData,
  }) : super(key: key);

  static send(
    BuildContext context, {
    required Message message,
  }) =>
      context
          .findAncestorStateOfType<_MessageScreenState>()!
          .addMessage(message);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  var _messages = const <Message>[];

  void addMessage(Message message) =>
      setState(() => _messages = [..._messages, message]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody:  true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        toolbarHeight: 72 * context.sc,
        backgroundColor: BaseColors.secondary,
        centerTitle: true,
        title: _AppBarTitle(
          messageData: widget.messageData,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0) * context.sc,
          child: IconButton(
            iconSize: 16.0 * context.sc,
            icon: const Icon(ChateauIcons.navigate_back),
            onPressed: Navigator.of(context).pop,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18, top: 17) * context.sc,
            child: const Avatar.medium(
              url:
                  'https://kuban24.tv/wp-content/uploads/2019/09/3eadfdd8fd4fe3b999fbb77af980b6f1.jpg',
            ),
          )
        ],
      ),
      body: SafeArea(
        child: _MessageBackground(
          child: MessageList(
            messages: _messages,
          ),
        ),
      ),
      bottomNavigationBar: _KeyboardInsetsHandler(child: _InputBar()),
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
  final Widget child;

  const _MessageBackground({
    required this.child,
  });

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
          padding: EdgeInsets.symmetric(
            horizontal: 16.0 * context.sc,
          ),
          child: child,
        ),
      ),
    );
  }
}

class MessageList extends StatefulWidget {
  final List<Message> messages;

  const MessageList({
    super.key,
    required this.messages,
  });

  @override
  State<MessageList> createState() => _MessageListState();
}

extension on ScrollPosition {}

class _MessageListState extends State<MessageList> {
  final _scrollController = ScrollController();

  void didChangeDependencies() {
    if (MediaQuery.of(context).viewInsets.bottom > 0) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void didUpdateWidget(covariant MessageList oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.messages.length <= oldWidget.messages.length) return;

    final position = _scrollController.position;
    final pixels = position.pixels;
    final maxExtent = position.maxScrollExtent;
    final viewPort = position.viewportDimension;

    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent - 200) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: _scrollController,
      children: [
        SizedBox(
          height: 16 * context.sc,
        ),
        const _DateLabel(
          lable: '6 October ',
        ),
        SizedBox(
          height: 16 * context.sc,
        ),
        ...widget.messages
            .map((e) => _MessageTile(message: e))
            .expand((element) => [
                  element,
                  SizedBox(
                    height: 12 * context.sc,
                  )
                ]),
        SizedBox(
          height: 60 * context.sc,
        ),
        Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom))
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

class _DateLabel extends StatelessWidget {
  const _DateLabel({
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

@immutable
class _KeyboardInsetsHandler extends StatelessWidget {
  final Widget child;

  const _KeyboardInsetsHandler({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: child,
      );
}

class _InputBar extends StatefulWidget {
  const _InputBar({Key? key}) : super(key: key);

  @override
  State<_InputBar> createState() => _InputBarState();
}

class _InputBarState extends State<_InputBar> {
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
            right: 16,
            left: 16,
          ) *
          context.sc,
      child: SizedBox(
        height: 46 * context.sc,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            _AttachButton(
              onPressed: () {},
            ),
            SizedBox(
              width: 8 * context.sc,
            ),
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(7, 2, 28, 1),
                  hintText: 'Message',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(3) * context.sc,
                    child: _SendButton(
                      onPressed: () {
                        MessageScreen.send(
                          context,
                          message: Message(
                            content: _controller.text,
                          ),
                        );
                        _controller.clear();
                      },
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(
                          left: 16, bottom: 14, top: 14, right: 8) *
                      context.sc,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(90, 77, 135, 1),
                    ),
                    borderRadius: BorderRadius.circular(16 * context.sc),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(90, 77, 135, 1),
                    ),
                    borderRadius: BorderRadius.circular(16 * context.sc),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AttachButton extends StatelessWidget {
  final void Function() onPressed;

  const _AttachButton({
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
            Color.fromRGBO(54, 49, 74, 1),
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
          ChateauIcons.attach,
          size: 19.5 * context.sc,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _SendButton extends StatelessWidget {
  final void Function() onPressed;

  const _SendButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor:
              const MaterialStatePropertyAll<Color>(BaseColors.yellow),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13) * context.sc,
            ),
          ),
          padding:
              const MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.all(0)),
        ),
        onPressed: onPressed,
        child: Icon(
          ChateauIcons.send,
          size: 18.1 * context.sc,
          color: Colors.black,
        ),
      ),
    );
  }
}
