import 'package:sik_baitulhikmah/features/users/user.dart';

List<User> dummyUsers = _json.map((json) {
  if (json
      case {
        'userId': final String userId,
        'name': final String name,
        'role': final String role,
        'status': final int status,
      }) {
    return User(userId: userId, name: name, role: role, status: status);
  } else {
    throw const FormatException('Unexpected JSON');
  }
}).toList();

const _json = [
  {
    'userId': 'BH001',
    'name': 'Fatahillah Ardhi',
    'role': 'Kancil',
    'status': 0
  },
  {'userId': 'BH002', 'name': 'Fikry', 'role': 'Kijang', 'status': 1},
  {'userId': 'BH003', 'name': 'Ihsan Rinaldy', 'role': 'Rusa', 'status': 2},
  {'userId': 'BH004', 'name': 'Fhadil Abdul R', 'role': 'Gajah', 'status': 3},
];
