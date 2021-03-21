import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/const.dart';
import 'package:shop_app/models/http_exception.dart';
import 'package:shop_app/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    // _items 를 그대로 반환하면 포인터를 반환하게됨 -> 외부에서 수정이 가능
    // _items의 목록들만을 온전히 반환하기 위함
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> fetchAndSetProducts() async {
    try {
      final response = await http.get(kPrdouctUrl());
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProducts = [];
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(
          Product(
            id: prodId,
            title: prodData['title'],
            description: prodData['description'],
            price: prodData['price'],
            imageUrl: prodData['imageUrl'],
          ),
        );
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      final response = await http.post(kPrdouctUrl(),
          body: json.encode({
            'title': product.title,
            'description': product.description,
            'imageUrl': product.imageUrl,
            'price': product.price,
            'isFavorite': product.isFavorite,
          }));
      final newProduct = Product(
        id: json.decode(response.body)['name'],
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      );
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((element) => element.id == id);
    if (prodIndex > 0) {
      await http.patch(
        kProductUrlWithId(id),
        body: json.encode(
          {
            'title': newProduct.title,
            'description': newProduct.description,
            'price': newProduct.price,
            'imageUrl': newProduct.imageUrl,
          },
        ),
      );
    }
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    }
  }

  // http delete 요청이 실패하면 제품을 다시 삽입
  // optimistic update
  Future<void> deleteProduct(String id) async {
    final existingProductIndex =
        _items.indexWhere((element) => element.id == id);
    var existingProudct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(kProductUrlWithId(id));
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProudct);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
    existingProudct = null;
  }
}
