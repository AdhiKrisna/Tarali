class UserModel{
  final String uId;
  final String email;
  final int role;
  final String nama;
  final String sekolah;

  UserModel({
    required this.uId,
    required this.email,
    required this.role,
    required this.nama,
    required this.sekolah,
  });

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'email': email,
      'role': role,
      'nama': nama,
      'sekolah': sekolah,
    };
  }
}