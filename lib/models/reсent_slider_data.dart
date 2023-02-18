import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chateau_mobile_homescreen/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
class RecentSliderDate {
  const RecentSliderDate({
    required this.name,
    required this.avatar,
  });

  final String name;
  final String avatar;
}