class Buyer{
  String name;
  String email;
  String password;
  String? photoUrl;


//<editor-fold desc="Data Methods">

  Buyer({
    required this.name,
    required this.email,
    required this.password,

    this.photoUrl,
  });



  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
      'password': this.password,

      'photoUrl': this.photoUrl,
    };
  }

  factory Buyer.fromMap(Map<String, dynamic> map) {
    return Buyer(
      name: map['name'] as String,

      email: map['email'] as String,
      password: map['password'] as String,
      photoUrl: map['photoUrl'] as String,
    );
  }





}