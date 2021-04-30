class StringManipulator {
  static String getFormattedAmount(String amount) {
    return amount.replaceAll(',', '');
  }
}
