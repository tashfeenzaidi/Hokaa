import 'package:gold_crowne/models/products_response_model.dart';

class CartItem {
  Data product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}
