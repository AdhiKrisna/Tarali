class UserModel{
  final String uId;
  final String email;
  final int role;
  final String nama;
  final String sekolah;
  final bool isFinishedRead;
  final bool isFinishedReadTest;

  UserModel({
    required this.uId,
    required this.email,
    required this.role,
    required this.nama,
    required this.sekolah,
    required this.isFinishedRead,
    required this.isFinishedReadTest,
  });

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'email': email,
      'role': role,
      'nama': nama,
      'sekolah': sekolah,
      'isFinishedRead': isFinishedRead,
      'isFinishedReadTest': isFinishedReadTest,
    };
  }
}