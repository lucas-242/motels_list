import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moteis/core/theme/theme.dart';

class ImageSelector extends StatelessWidget {
  ImageSelector({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.alignment = Alignment.center,
    this.fit = BoxFit.fill,
    this.filterQuality = FilterQuality.medium,
    this.placeholderWidget,
    double borderRadius = AppInsets.sm,
  }) : borderRadius = BorderRadius.circular(borderRadius);

  final String url;
  final Widget? placeholderWidget;
  final double? height;
  final double? width;
  final Alignment alignment;
  final BoxFit fit;
  final FilterQuality filterQuality;

  late final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return _defaultImage;
    }

    return CachedNetworkImage(
      imageUrl: url,
      alignment: alignment,
      filterQuality: filterQuality,
      fit: fit,
      height: height,
      width: width,
      imageBuilder: (context, imageProvider) => ClipRRect(
        borderRadius: borderRadius,
        child: Image(image: imageProvider, fit: fit),
      ),
      errorWidget: (context, url, error) => _defaultImage,
    );
  }

  Widget get _defaultImage => ClipRRect(
        borderRadius: borderRadius,
        child: Image.asset(
          AppImages.noImage,
          fit: BoxFit.cover,
          height: height,
          width: width,
        ),
      );
}
