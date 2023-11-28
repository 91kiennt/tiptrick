import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageView extends StatelessWidget {
  final String path;
  const ImageView({Key key, this.path = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Src();
  }

  Widget _Src() {
    String _srcCdn = '';
    switch (path) {
      case '':
        _srcCdn = '';
        break;
      default:
        break;
    }
    return CachedNetworkImage(
      height: 280,
      imageUrl: _srcCdn,
      errorWidget: (context, url, error) => const SizedBox(),
    );
  }
}
