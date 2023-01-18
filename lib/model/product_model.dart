class Product{
  int id;
  String title;
  String description;
  int price;
  double discountPerecentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<dynamic> images;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.discountPerecentage,
      required this.rating,
      required this.stock,
      required this.brand,
      required this.category,
      required this.thumbnail,
      required this.images});

      factory Product.fromMap(Map<String, dynamic> data) => Product(
          id: data['id'],
          title: data['title'],
          description: data['description'],
          price: data['price'],
          discountPerecentage: data['discountPrecentage'],
          rating: data['rating'],
          stock: data['stock'],
          brand: data['brand'],
          category: data['category'],
          thumbnail: data['thumbnail'],
          images: data['images']);

      Map<String, dynamic> toMap(Product product) => {
            "id": id,
            "title": title,
            "category": category,
            "price": price,
            "discountPerecentage": discountPerecentage,
            "rating": rating,
            "stock": stock,
            "brand": brand,
            "thumbnail": thumbnail,
            "images": images
          };
}