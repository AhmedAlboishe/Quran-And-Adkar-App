extension ArabicNumbers on int {
  String toArabic() {
    //
    final arabicNumbers = {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
    };
    return toString()
        .split('')
        .map((char) => arabicNumbers[char] ?? char)
        .join('');
  }
}
