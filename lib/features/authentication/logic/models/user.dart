class User {
  int? id;
  String? account;
  String? name;
  String? phone;
  String? address;
  List<dynamic>? roles;
  String token;

  User({
    this.id,
    this.account,
    this.name,
    this.phone,
    this.address,
    this.roles,
    required this.token,
  });

  factory User.formJson(Map<String, dynamic> json) => User(
        id: json['id'],
        account: json['account'],
        name: json['name'],
        phone: json['phone'],
        address: json['address'],
        roles: json['roles'],
        token: json['token'],
      );
}
