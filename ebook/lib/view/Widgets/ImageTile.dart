import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class imageTile extends StatelessWidget {
  final String path;
  const imageTile({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: path,
    );
  }
}
