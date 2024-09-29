import 'dart:io';

import 'package:flutter/material.dart';

enum ImageType { network, local }

class AppImage extends StatelessWidget {
  final String link;
  final ImageType type;
  final File? file;
  final String? alt;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final BoxFit? imgHandlingfit;
  final BorderRadiusGeometry borderRadius;
  const AppImage({
    super.key,
    required this.link,
    required this.type,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.imgHandlingfit,
    this.borderRadius = BorderRadius.zero,
    this.alt,
    this.file,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: image(),
    );
  }

  Widget image() {
    if (file != null) {
      return Image.file(
        file!,
        height: height,
        width: width,
        fit: fit,
        errorBuilder: (_, __, ___) => errorImg(),
      );
    }
    if (type == ImageType.network) {
      return Image.network(
        link,
        height: height,
        width: width,
        fit: fit,
        errorBuilder: (_, __, ___) => errorImg(),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return errorImg();
          }
        },
      );
    } else {
      return Image.asset(
        link,
        height: height,
        width: width,
        fit: fit,
        errorBuilder: (_, __, ___) => errorImg(),
      );
    }
  }

  Widget errorImg() {
    return Container();
  }
}
