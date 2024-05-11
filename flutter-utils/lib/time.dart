
import 'package:date_format/date_format.dart';

enum TimeLength {
  ten,
  thirteen,
}

/// 时间戳转时间
DateTime timestampToTime(int? timestamp, {TimeLength timeLength = TimeLength.ten}) {
  if (timestamp == null) {
    return DateTime.now();
  }
  int a = 0;
  if (timeLength == TimeLength.ten) {
    a = timestamp * 1000;
  } else {
    a = timestamp;
  }
  return DateTime.fromMillisecondsSinceEpoch(a);
}

/// like: 2020-01-01 00:00:00.000(完整的)
/// 默认从第19位截取
String timestampToString(int? timestamp, {TimeLength timeLength = TimeLength.ten, int cutDown = 19}) {
  String str = timestampToTime(timestamp, timeLength: timeLength).toString();
  return str.substring(0, cutDown);
}

Duration compareTimeToNowTime(DateTime compatreTime) {
  final date2 = DateTime.now();
  final diff = date2.difference(compatreTime);
  return diff;
}

String compareTimeToNowTimeToDayString(DateTime compatreTime){
  final diff = compareTimeToNowTime(compatreTime);
  int day = diff.inDays;
  if (day > 7) {
    return '$day天前';
  } else {
    if (7 >= day && day >= 1) {
      return '$day天前';
    } else {
      int hours = diff.inHours - day * 24;
      if (24 > hours && hours >= 1) {
        return '$hours小时前';
      } else {
        int minutes = diff.inMinutes - day * 24 * 60 - hours * 60;
        if (60 > minutes && minutes >= 1) {
          return '$minutes分钟前';
        } else {
          int seconds = diff.inSeconds - day * 24 * 60 - hours * 60 - minutes * 60;
          // llog('min==${seconds}');
          if (60 > seconds) {
            return '$seconds秒前';
          }
        }
      }
    }
  }

  return diff.toString();
}

DateTime utcTimeToLocalTime(String? utcTimeString) {
  if (utcTimeString == null || utcTimeString.isEmpty) {
    return DateTime.now();
  }
  DateTime dateTime = DateTime.parse(utcTimeString);
  dateTime = dateTime.add(dateTime.timeZoneOffset);
  return dateTime;
}

/// formats like is [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn]
String utcTimeToLocalTimeString(String? utcTimeString, List<String> formats) {
  if (utcTimeString == null) {
    return '';
  }
  DateTime dateTime = utcTimeToLocalTime(utcTimeString);
  String dateStr = formatDate(dateTime, formats);
  return dateStr;
}

//时间格式化，根据总秒数转换为对应的 mm:ss 格式
String constructTime(int seconds) {
  int hour = seconds ~/ 3600;
  int minute = seconds % 3600 ~/ 60;
  int second = seconds % 60;
  if (seconds > 0 && seconds < 3600) {
    return "${formatTime(minute)}:${formatTime(second)}";
  } else if (seconds >= 3600 && seconds < 3600 * 60) {
    return "${formatTime(hour)}:${formatTime(minute)}:${formatTime(second)}";
  } else {
    return '00:00';
  }
}

//数字格式化，将 0~9 的时间转换为 00~09
String formatTime(int timeNum) {
  return timeNum < 10 ? "0$timeNum" : timeNum.toString();
}