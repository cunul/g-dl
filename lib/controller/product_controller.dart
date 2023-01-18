import 'dart:convert';
import 'dart:io';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_restapi/model/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var isLoading = false.obs;
  final String url = 'https://dummyjson.com';
  List<Product> products = <Product>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getProducts();
  }

  getProducts() async {
    isLoading(true);
    final response = await http.get(Uri.parse("$url/products?skip=0&limit=10"));
    isLoading.value = false;
    if (response.statusCode == 200){
      final data = jsonDecode(response.body);
      print(data);
      products =
          List<Product>.from(data['products'].map((x) => Product.fromMap(x)));
    }
    isLoading(false);
  }
}