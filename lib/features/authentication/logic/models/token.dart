class Token {
  late final String value;

  Token({required this.value});

  Token.fromJson(Map<String, dynamic> json) {
    value = json['token'];
  }
}
