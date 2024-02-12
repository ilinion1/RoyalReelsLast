import 'package:flutter/material.dart';

extension DurationExtensions on Duration {
  String get toTime {
    final formattedVal = toString().split('.').first;
    final data = formattedVal.split(':');
    if (data.first.toInt == 0) data.removeAt(0);

    return data.join(':');
  }
}

extension FromStringtoInt on String {
  int get toInt => int.parse(this);
  String get toRouteName => replaceAll('/', '');
}

extension ToSliverBox on Widget {
  SliverToBoxAdapter get toSliverBox => SliverToBoxAdapter(child: this);
  SingleChildScrollView get toSingleChildScrollView => SingleChildScrollView(
        child: this,
      );
}

extension NumExtensions on num {
  EdgeInsets get topPad => EdgeInsets.only(top: toDouble());
  EdgeInsets get bottomPad => EdgeInsets.only(bottom: toDouble());
  EdgeInsets get rightPad => EdgeInsets.only(right: toDouble());
  EdgeInsets get leftPad => EdgeInsets.only(left: toDouble());
  EdgeInsets get verticPad => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get horizPad => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get toAllPad => EdgeInsets.all(toDouble());
  //!
  BorderRadius get circleBorder => BorderRadius.circular(toDouble());

  Duration get msDuration => Duration(milliseconds: toInt());
}

extension DateTImeExtension on DateTime {
  String get yearMonthDayFormat => '$year-$month-$day';
}
