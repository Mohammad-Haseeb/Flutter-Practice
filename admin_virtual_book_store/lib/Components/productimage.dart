import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class ProductImages extends StatefulWidget {
  const ProductImages({Key? key, this.data,this.Width,this.Height}) : super(key: key);
  final Map? data;
  final double? Width;
  final double? Height;


  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  @override
  Widget build(BuildContext context) {
    return  CachedNetworkImage(
      imageUrl: widget.data!["ImageURL"].toString(),
      width: widget.Width??50,
      height: widget.Height??60,
      placeholder: (context, url) => CircularProgressIndicator(
        backgroundColor: Colors.red,
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}