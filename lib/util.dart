class Util {
  static addSpaceTo4DigitNumber(int number) {
    String formatted = number.toString();
    String result = '';

    int length = formatted.length;
    for (int i = 0; i < length; i++) {
      if (i > 0 && (length - i) % 3 == 0) {
        result += ' '; // Add space every three digits
      }
      result += formatted[i];
    }

    return result;
  }
}
