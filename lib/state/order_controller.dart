import 'package:fyp/model/product_model.dart';
import 'package:get/get.dart';

class ProductStateController extends GetxController {
  final cart = <Product>{}.obs;
  final favourite = <Product>{}.obs;
}
