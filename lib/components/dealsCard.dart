import 'package:flutter/material.dart';
import 'package:familysupermarket/bloc/deals.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DealsCard extends StatelessWidget {
  final Deals deals;

  DealsCard({@required this.deals});

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
            imageUrl: deals.image,
            height: 120,
            width: 120,
          ),
        ),
      ),
    );
  }
}
