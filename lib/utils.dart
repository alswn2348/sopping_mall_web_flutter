bool isDigit(String str) {
  final regExp = RegExp(r"[^0-9]+");
  if (regExp.hasMatch(str)) {
    return false;
  }
  return true;
}
