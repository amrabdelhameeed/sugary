import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCacheImage extends StatelessWidget {
  final String? imageUrl;
  final double radius;
  final bool? circularShape;
  final double height;
  final double width;
  const CustomCacheImage(
      {Key? key,
      required this.imageUrl,
      required this.radius,
      required this.height,
      required this.width,
      this.circularShape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
          bottomLeft: Radius.circular(circularShape == false ? 0 : radius),
          bottomRight: Radius.circular(circularShape == false ? 0 : radius)),
      child: CachedNetworkImage(
        imageUrl: imageUrl!,
        fit: BoxFit.cover,
        height: height,
        width: width,
        placeholder: (context, url) => Container(color: Colors.grey[300]),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey[300],
          child: Icon(Icons.error),
        ),
      ),
    );
  }
}
