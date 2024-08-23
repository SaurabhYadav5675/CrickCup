class ApiUrl {
  static late String baseUrl;
  static late String getProducts;

  Future<void> init() async {
    baseUrl = "https://fakestoreapi.com";
    getProducts = "$baseUrl/products";
  }
}
