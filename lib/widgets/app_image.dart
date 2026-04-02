import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final int? memCacheWidth;
  final int? memCacheHeight;

  const AppImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.memCacheWidth,
    this.memCacheHeight,
  });

  @override
  Widget build(BuildContext context) {
    final isAsset = imageUrl.startsWith('assets/');

    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    
    // Safety check for non-finite dimensions (e.g. double.infinity)
    int? resolvedCacheWidth = memCacheWidth;
    if (resolvedCacheWidth == null && width != null && width!.isFinite) {
      resolvedCacheWidth = (width! * pixelRatio).toInt();
    }
    
    int? resolvedCacheHeight = memCacheHeight;
    if (resolvedCacheHeight == null && height != null && height!.isFinite) {
      resolvedCacheHeight = (height! * pixelRatio).toInt();
    }

    Widget imageWidget;
    if (isAsset) {
      imageWidget = Image.asset(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        cacheWidth: resolvedCacheWidth,
        cacheHeight: resolvedCacheHeight,
        errorBuilder: (context, error, stackTrace) => _buildErrorWidget(),
      );
    } else {
      imageWidget = CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        memCacheWidth: resolvedCacheWidth,
        memCacheHeight: resolvedCacheHeight,
        placeholder: (context, url) => _buildPlaceholderWidget(),
        errorWidget: (context, url, error) => _buildErrorWidget(),
      );
    }

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: imageWidget,
      );
    }

    return imageWidget;
  }

  Widget _buildPlaceholderWidget() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[200],
      child: const Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[300],
      child: const Icon(Icons.error_outline, color: Colors.grey),
    );
  }
}
