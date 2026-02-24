extension StringExtension on String?{
  bool isNullOrEmpty(){
    return this == null || this!.isEmpty;
  }

  bool isNotNullOrEmpty(){
    return !isNullOrEmpty();
  }

  String? between(String start, String end) {
    final text = this;
    if (text == null) return null;

    final startIndex = text.indexOf(start);
    if (startIndex == -1) return null;

    final endIndex = text.indexOf(end, startIndex + start.length);
    if (endIndex == -1) return null;

    return text.substring(startIndex + start.length, endIndex);
  }
}