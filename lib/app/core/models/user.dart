import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  int id = 0;
  String name;
  String fullName;
  String number;
  String password;
  String city;

  User({
    required this.name,
    required this.fullName,
    required this.password,
    required this.number,
    required this.city,
  });
}
