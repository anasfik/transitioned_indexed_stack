extension ToProperNameExt on Type {
  String toProperName() {
    String asString = toString();
    String result = '';
    for (int index = 0; index < asString.length; index += 1) {
      final currentLetter = asString[index];
      if (currentLetter.isUppercase()) {
        result = '$result${index == 0 ? '' : ' '}$currentLetter';
      } else {
        result = '$result$currentLetter';
      }
    }
    return result;
  }
}

extension IsUppercaseExt on String {
  bool isUppercase() {
    bool isUppercase = false;
    for (int index = 0; index < length; index += 1) {
      final current = this[index];
      if (current.codeUnitAt(0) >= 65 && current.codeUnitAt(0) <= 90) {
        isUppercase = true;
      } else {
        return false;
      }
    }
    return isUppercase;
  }
}
