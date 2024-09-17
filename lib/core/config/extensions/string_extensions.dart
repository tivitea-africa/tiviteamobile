import 'package:tivi_tea/core/config/extensions/date_extensions.dart';

extension StringExt on String {
  DateTime get toDate => DateTime.parse(this);

  String get capiTalizeFirst {
    return this[0].toUpperCase() + substring(1);
  }

  String get capiTalizeFirstLast {
    return this[0].toUpperCase() + substring(1);
  }

  String get capitalizeFullname {
    if (isEmpty) return this;

    final words = split(' ');
    for (var i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] = words[i][0].toUpperCase() + words[i].substring(1);
      }
    }

    return words.join(' ');
  }

  String reArrangeDOB(String pattern, [String newPattern = '-']) {
    return split(pattern).reversed.join(newPattern);
  }

  String removeCommas() {
    if (contains(',')) {
      return replaceAll(',', '');
    } else {
      return this;
    }
  }

  String obscuredMail() {
    var newString = '';
    final List<String> emailList = split("");
    for (var i = 0; i < emailList.length; i++) {
      if (i != 0 && emailList[i] != '@' && i < indexOf('.')) {
        emailList[i] = '*';
        newString = emailList.join();
      }
    }
    return newString;
  }

  String obscurePhoneNumber() {
    if (length >= 10) {
      final numberList = split('');
      for (var i = 3; i < 7; i++) {
        // Replace digits from index 3 to 6 with '*'
        numberList[i] = '*';
      }
      return numberList.join();
    } else {
      // Handle cases where the phone number is too short
      return this;
    }
  }

  String get toMonthDate {
    return DateTime.parse(this).toMonthDate;
  }

  String get toTime {
    return DateTime.parse(this).toTime;
  }

  // String get initials {
  //   final name = split(' ');

  //   if (name.length > 1) {
  //     return '${name[0][0]}${name[1][0]}';
  //   }
  //   return name[0][1];
  // }

  String get initials {
    final nameParts = split(' ');

    if (nameParts.isEmpty) {
      return '';
    }

    String initials = '';
    for (final part in nameParts) {
      if (part.isNotEmpty) {
        initials += part[0];
      }
    }

    return initials.toUpperCase();
  }

  String formatPhoneNumber() {
    String sanitizedNumber = replaceAll(RegExp(r'\D'), '');
    if (sanitizedNumber.startsWith('234') && sanitizedNumber.length > 10) {
      sanitizedNumber = sanitizedNumber.substring(3);
    }
    if (sanitizedNumber.startsWith('0') && sanitizedNumber.length > 10) {
      sanitizedNumber = sanitizedNumber.substring(1);
    }
    if (sanitizedNumber.length > 10) {
      sanitizedNumber = sanitizedNumber.substring(sanitizedNumber.length - 10);
    }
    if (sanitizedNumber.length == 10) {
      return sanitizedNumber;
    }
    return sanitizedNumber;
  }

  String get firstName {
    String trimmedName = this.trim();
    List<String> nameParts = trimmedName.split(RegExp(r'\s+'));
    if (nameParts.length >= 2) {
      return nameParts[1];
    } else {
      return trimmedName;
    }
  }

  String addDashes() {
    if (this.length <= 4) {
      return this;
    }
    StringBuffer result = StringBuffer();
    for (int i = 0; i < this.length - 4; i += 4) {
      result.write(this.substring(i, i + 4));
      result.write('-');
    }
    result.write(this.substring(this.length - 4));
    return result.toString();
  }

  String addLeadingZero() {
    if (this.startsWith('0')) {
      return this;
    } else {
      return '0$this';
    }
  }

  String get toPhoneNumber {
    String sanitizedNumber = replaceAll(RegExp(r'[^\d+]'), '');

    if (sanitizedNumber.startsWith('+234')) {
      return sanitizedNumber;
    } else if (sanitizedNumber.startsWith('0')) {
      return '+234${sanitizedNumber.substring(1)}';
    } else if (sanitizedNumber.startsWith('234')) {
      return '+$sanitizedNumber';
    } else if (sanitizedNumber.length == 10) {
      return '+234$sanitizedNumber';
    } else {
      return '+$sanitizedNumber';
    }
  }
}
