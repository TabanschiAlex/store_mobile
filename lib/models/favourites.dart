import 'dart:convert';

class Favorites {
  final String productId;

  Favorites({
    required this.productId,
  });

  Favorites copyWith({
    String? id,
    String? productId,
  }) {
    return Favorites(
      productId: productId ?? this.productId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
    };
  }

  factory Favorites.fromMap(Map<String, dynamic> map) {
    return Favorites(
      productId: map['productId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Favorites.fromJson(String source) =>
      Favorites.fromMap(json.decode(source));

  @override
  String toString() => 'Favorite(productId: $productId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Favorites && other.productId == productId;
  }

  @override
  int get hashCode => productId.hashCode;
}
