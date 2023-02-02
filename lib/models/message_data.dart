import 'package:chateau_mobile_homescreen/widgets/avatar.dart';
import 'package:flutter/material.dart';

@immutable
class MessageData {
  const MessageData({
    required this.senderName,
    required this.message, 
    required this.messageDate, 
    required this.dateMessage,
    required this.profilePicture}
  );
  final String senderName;
  final String message;
  final DateTime messageDate;
  final String dateMessage;
  final Avatar profilePicture;

}
