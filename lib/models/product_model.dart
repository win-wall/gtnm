class ProductModel {
  String ten;
  String image;
  String category;
  int gia;  
  ProductModel({
    this.ten = 'No Name',
    this.image = 'http://www.kyosemi.co.jp/mgt/wp-content/uploads/products/kpdg020c/kpdg020c.jpg',
    this.category = 'hot',
    this.gia = 0,
    }
  );
}

List<ProductModel> m_products = [
  ProductModel(
    ten: 'Hang hoa 1',
    category: 'laptop',
    gia: 1000000,
  ),
  ProductModel(
    ten: 'Hang hoa 1',
    gia: 1000000,
  ),
  ProductModel(
    ten: 'Hang hoa 1',
    category: 'laptop',
    gia: 1000000,
  ),
  ProductModel(
    ten: 'Hang hoa 1',
    category: 'laptop',
    gia: 1000000,
  ),
  ProductModel(
    ten: 'Hang hoa 1',
    category: 'laptop',
    gia: 1000000,
  ),
  ProductModel(
    ten: 'Hang hoa 1',
    category: 'laptop',
    gia: 1000000,
  ),
  ProductModel(
    ten: 'Hang hoa 1',
    category: 'linh kien',
    gia: 1000000,
  ),
  ProductModel(
    ten: 'Hang hoa 1',
    category: 'phu kien',
    gia: 1000000,
  ),
];


List<ProductModel> m_cart = [
  ProductModel(
    ten: 'Hang hoa 1',
    category: 'linh kien',
    gia: 1000000,
  ),
  ProductModel(
    ten: 'Hang hoa 1',
    category: 'phu kien',
    gia: 1000000,
  ),
];