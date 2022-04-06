import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:project_cartridje_mobile/models/product.dart';

abstract class IProductRepository {
  Future<List<Product>> allProducts();
}

class ProductRepository extends IProductRepository {
  static final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection('products');

  @override
  Future<List<Product>> allProducts() async {
    QuerySnapshot ref = await _productsRef.get();

    List<Product> list = ref.docs.map((e) {
      Map<String, dynamic> data = e.data() as Map<String, dynamic>;
      return Product.fromMap(data);
    }).toList();
    return list;
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }
}
