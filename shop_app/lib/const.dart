Uri kPrdouctUrl() {
  return Uri.parse(
      'https://flutter-shop-app-c87f7-default-rtdb.firebaseio.com/products.json');
}

Uri kProductUrlWithId(String id) {
  return Uri.parse(
      'https://flutter-shop-app-c87f7-default-rtdb.firebaseio.com/products/$id.json');
}

Uri kOrderUrl() {
  return Uri.parse(
      'https://flutter-shop-app-c87f7-default-rtdb.firebaseio.com/orders.json');
}
