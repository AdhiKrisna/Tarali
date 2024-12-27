class UserModel{
  final String uId;
  final String email;
  final int absen;
  final String kelas;
  final int role;
  final String nama;
  final String sekolah;

  UserModel({
    required this.uId,
    required this.absen,
    required this.email,
    required this.kelas,
    required this.role,
    required this.nama,
    required this.sekolah,
  });

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'email': email,
      'absen': absen,
      'role': role,
      'kelas': kelas,
      'nama': nama,
      'sekolah': sekolah,
    };
  }
}