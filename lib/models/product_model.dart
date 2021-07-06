class ProductModel {
  final String id;
  final String ten;
  final String image;
  final String category;
  int gia;  
  ProductModel({
    required this.id,
    required this.ten,
    required this.image,
    required this.category,
    required this.gia,
    }
  );

  factory ProductModel.fromJson(Map<String, dynamic> parsedJson){
    return new ProductModel(
        id: parsedJson['id'].toString(),
        ten : parsedJson['ten'].toString(),
        image: parsedJson['image'].toString(),
        category: parsedJson['category'].toString(),
        gia: int.parse(parsedJson['gia']),
    );
  }
}