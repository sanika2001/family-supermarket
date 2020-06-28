import 'package:flutter/material.dart';
import 'package:familysupermarket/models/products.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductsCard extends StatelessWidget {
  final Products products;

  ProductsCard({@required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: CachedNetworkImage(
            imageUrl: products.image,
            height: 120,
            width: 120,
          ),
        ),
      ),
    );
  }
}
