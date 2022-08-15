import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

num? extractAmount(String? amount) {
  if (amount == null || amount.isEmpty) {
    return null;
  } else {
    final val = amount.startsWith("NGN")
        ? amount.substring(3)
        : amount.startsWith("N")
            ? amount.substring(0)
            : amount;
    final number = num.tryParse(val.replaceAll(RegExp(r'[^0-9\.]'), ""));

    if (number != null) {
      return number;
    } else {
      return number;
    }
  }
}


num? extractAmountBuddy(String? amount) {
  if (amount == null || amount.isEmpty) {
    return null;
  } else {
    final val = amount.substring(0, 4);
    final number = num.tryParse(val.replaceAll(RegExp(r'[^0-9\.]'), ""));

    if (number != null) {
      return number;
    } else {
      return number;
    }
  }
}

String lower(String text) => text.toLowerCase();
String getAmountTransaction(String amount) {
  int actual = (extractAmount(amount) ?? 0).toInt() * 100;
  int multiple = 12 - "$actual".length;
  String result = "${'0' * multiple}$actual";
  return result;
}

bool contains(String base, String comparator) =>
    lower(base).contains(lower(comparator));

String parseError(
  dynamic errorResponse,
  String? defaultMessage, [
  bool ignore401 = false,
]) {
  print("xxxx: $errorResponse");
  try {
    final fallbackMessage = defaultMessage != null && defaultMessage.isNotEmpty
        ? defaultMessage
        : "My request failed due to an unexpected error, please try again";
    try {
      final int statusCode = errorResponse["statusCode"] ?? 400;
      final dynamic error = errorResponse["data"];

      print("error: $error");

      if (error is Map) {
        if (error["message"] != null &&
            error["message"] is String &&
            error["message"].isNotEmpty) {
          return error["message"];
        } else if (error.containsKey("errors") && error["errors"] != null) {
          return _parseErrorArray(error["errors"]) ??
              _fallBackMessage(statusCode, defaultMessage!);
        } else {
          return _fallBackMessage(statusCode, fallbackMessage);
        }
      }
      if (error is String) {
        return error != null && error.isNotEmpty
            ? error
            : _fallBackMessage(statusCode, fallbackMessage);
      }
      return _fallBackMessage(statusCode, fallbackMessage);
    } catch (_) {
      return fallbackMessage;
    }
  } catch (_) {
    return defaultMessage ??
        "My request failed due to an unexpected error, please try again";
  }
}

String parseSuccess(dynamic data, String defaultMessage) {
  final fallbackMessage = defaultMessage != null && defaultMessage.isNotEmpty
      ? defaultMessage
      : "Success";
  try {
    if (data is Map) {
      if (data["message"] != null &&
          data["message"] is String &&
          data["message"].isNotEmpty) {
        return data["message"];
      }
      return fallbackMessage;
    }
    return fallbackMessage;
  } catch (_) {
    return fallbackMessage;
  }
}

String? _parseErrorArray(Map error) {
  try {
    final data = Map<String, List>.from(error);
    List errorMessages = [];
    data.keys.forEach((it) {
      errorMessages.addAll(data[it]!);
    });
    return errorMessages.join(", ");
  } catch (_) {
    return null;
  }
}

String _fallBackMessage(int statusCode, String defaultMessage) {
  if (statusCode == 405) {
    return "Sorry, you are not permitted to carry out this action at this time";
  } else if (statusCode == 404) {
    return "Sorry, the requested data could not be found at this time";
  } else if (statusCode == 401) {
    return "Unauthorized";
  } else if (statusCode >= 400 && statusCode < 500) {
    return "Sorry, My request could not be resolved at this time, please retry";
  } else if (statusCode >= 500 && statusCode < 600) {
    return "Sorry, My request could not be resolved at this time because of an unexpected error";
  } else {
    return defaultMessage;
  }
}

Future<File?> exractFile(Map<String, String> data) async {
  try {
    final byteArray = base64Decode(data['b64']!);
    final file = File("${data['path']}/avatar.png");
    await file.writeAsBytes(byteArray);
    return file;
  } catch (_) {
    return null;
  }
}
// launchURL(String value) async {
//   const url = 'https://instagram.com/';
//   const url2 = 'https://twitter.com/';
//   const url3 = 'https://m.facebook.com/';
//   const url4 = 'https://google.com/';
//   const url5 = 'https://myBuddy.io/faq-mobile';
//   const url6 = 'https://myBuddy.io/terms-mobile';
//   const url7 = 'https://myBuddy.io/privacy-mobile';
//   if (value == 'instagram') {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   } else if (value == 'tweeter') {
//     if (await canLaunch(url2)) {
//       await launch(url2);
//     } else {
//       throw 'Could not launch $url2';
//     }
//   } else if (value == 'facebook') {
//     if (await canLaunch(url3)) {
//       await launch(url3);
//     } else {
//       throw 'Could not launch $url3';
//     }
//   } else if (value == 'google') {
//     if (await canLaunch(url4)) {
//       await launch(url4);
//     } else {
//       throw 'Could not launch $url4';
//     }
//   }else if (value == 'faq') {
//     if (await canLaunch(url5)) {
//       await launch(url5);
//     } else {
//       throw 'Could not launch $url4';
//     }
//   }
//   else if (value == 'terms') {
//     if (await canLaunch(url5)) {
//       await launch(url5);
//     } else {
//       throw 'Could not launch $url4';
//     }
//   }
//   else if (value == 'policy') {
//     if (await canLaunch(url5)) {
//       await launch(url5);
//     } else {
//       throw 'Could not launch $url4';
//     }
//   }

// }
class InputHelper {
  static List<int> getNumbers(bool scrambleNumbers) {
    var numberSet = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

    if (!scrambleNumbers) {
      return numberSet;
    }

    List<int> randomSet = [];

    var random = new Random();

    while (numberSet.length > 0) {
      var randomIndex = random.nextInt(numberSet.length);
      var selectedEntry = numberSet[randomIndex];
      randomSet.add(selectedEntry);
      numberSet.removeAt(randomIndex);
    }

    return randomSet;
  }
}
