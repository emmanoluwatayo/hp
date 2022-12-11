import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart' as foundation;
import 'package:intl/intl.dart';

/// This is a utility class for performing various operations.
class BaseUtils {
  /// Logs/prints out the "content" in multiple lines/chunks and in a JSON encoded format.
  /// NOTE: Logs are written to the console if and only if the application was not compiled in release mode.
  static void log(String tag, Object? content, {String message = ""}) {
    // Just a placeholder for code. !Foundation.kReleaseMode
    if (!foundation.kReleaseMode) {
      String jsonEncodedContent;
      try {
        jsonEncodedContent = jsonEncode(content);
      } catch (error) {
        jsonEncodedContent = jsonEncode(content?.toString());
      }

      developer.log(
        message.isEmpty ? tag : message,
        name: tag,
        error: jsonEncodedContent,
      );
    }
  }

  /// Recursively logs/prints out the "content" in multiple lines/chunks of 800 in length.
  /// This should be called asynchronously, to avoid locking down application thread, thereby causing the application to crash.
  static void logHelper(String tag, String content) {
    const String separator = " => ";
    final int lineLimit = 800 - tag.length - separator.length;
    if (content.length > lineLimit) {
      log(tag, separator + content);
      if (tag.contains("(Cont’d")) {
        logHelper(tag, content.substring(lineLimit));
      } else {
        logHelper('$tag (Cont’d)', content.substring(lineLimit));
      }
    } else {
      log(tag, separator + content);
    }
  }

  //Format date
  static String formatDate(
    String passedDate, {
    String format = "EEE, d MMM y",
  }) {
    String date = "...";
    try {
      passedDate.replaceAll("z", "").replaceAll("/", "-");
      final dateFormatter = DateFormat(format);
      date = dateFormatter.format(DateTime.parse(passedDate));
    } catch (e) {
      log("formatDate", e.toString());
    }
    return date;
  }

  static String breakToWords(String data) {
    if (data.isEmpty) {
      return "";
    }
    const finalString = "";
    var startIndex = 0;
    const length = 4;
    final loopCount = (data.length / 4).ceil();

    log("breakToWords : loop count", loopCount);

    try {
      final StringBuffer sb = StringBuffer();
      for (var i = 0; i < loopCount; i++) {
        sb.write(finalString);
        sb.write(data.substring(startIndex, startIndex + length));
        startIndex = startIndex + length;
        sb.write(" ");
      }
      return sb.toString().trim();
    } catch (e) {
      return finalString.trim();
    }
  }

  static String sentenceCase(String sentence) {
    if (sentence.isEmpty) {
      return sentence;
    }
    return sentence[0].toUpperCase() + sentence.substring(1).toLowerCase();
  }

  static String firstLetterCase(String sentence) {
    if (sentence.isEmpty) {
      return sentence;
    }
    return sentence.split(" ").map((e) => sentenceCase(e)).toList().join(" ");
  }

  static String getInitials({String name = ""}) {
    final nameSplit = name.split(" ");
    final firstLetter = nameSplit[0].substring(0, 1);
    var secondLetter = name.substring(1, 2);
    if (nameSplit.length > 1) {
      secondLetter = nameSplit[1].substring(0, 1);
    }
    final initials = firstLetter + secondLetter;
    return initials;
  }
}
