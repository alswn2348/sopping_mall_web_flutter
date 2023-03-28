class User {
  int id;
  String account;
  String name;
  String phone;
  String address;
  List<dynamic> roles;
  String token;

  User(
    this.id,
    this.account,
    this.name,
    this.phone,
    this.address,
    this.roles,
    this.token,
  );

  factory User.formJson(Map<String, dynamic> json) => User(
        json['id'],
        json['account'],
        json['name'],
        json['phone'],
        json['address'],
        json['roles'],
        json['token'],
      );
}
