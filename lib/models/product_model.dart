// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class ProductModel with ChangeNotifier {
//   final String productId,
//       productTitle,
//       productPrice,
//       productCategory,
//       productDescription,
//       productImage,
//       productQuantity;
//   // Timestamp? createdAt;
//   ProductModel({
//     required this.productId,
//     required this.productTitle,
//     required this.productPrice,
//     required this.productCategory,
//     required this.productDescription,
//     required this.productImage,
//     required this.productQuantity,
//     // this.createdAt,
//   });

//   // factory ProductModel.fromFirestore(DocumentSnapshot doc) {
//   //   Map data = doc.data() as Map<String, dynamic>;
//   //   return ProductModel(
//   //     productId: data['productId'], //doc.get("productId"),
//   //     productTitle: data['productTitle'],
//   //     productPrice: data['productPrice'],
//   //     productCategory: data['productCategory'],
//   //     productDescription: data['productDescription'],
//   //     productImage: data['productImage'],
//   //     productQuantity: data['productQuantity'],
//   //     createdAt: data['createdAt'],
//   //   );
//   // }
// }

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class ProductModel extends ChangeNotifier {
  final String productId,
      productTitle,
      productPrice,
      productCategory,
      productDescription,
      productImage,
      productQuantity;

  ProductModel({
    required this.productId,
    required this.productTitle,
    required this.productPrice,
    required this.productCategory,
    required this.productDescription,
    required this.productImage,
    required this.productQuantity,
  });
}
