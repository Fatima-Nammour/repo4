import 'package:objectbox/objectbox.dart';

@Entity()
class Product {
  @Id(assignable: true)
  int id = 0;
  String imageUrl;
  String name;
  String price;
  String description;
  String rate;
  String marketName;
  String marketAddress;
  int count = 0;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.rate,
    required this.price,
    required this.marketAddress,
    required this.marketName,
    required this.imageUrl,
    required this.count,
  });
}
