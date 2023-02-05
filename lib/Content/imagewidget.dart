import 'package:flutter/material.dart';


class ImageWidget extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String ImageAsset;
  // ignore: non_constant_identifier_names
  final double ImageHeight;
  const ImageWidget({
    super.key,
    // ignore: non_constant_identifier_names
    required this.ImageAsset,
    // ignore: non_constant_identifier_names
    required this.ImageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Image(
        
        image: AssetImage(ImageAsset),
        
        width: MediaQuery.of(context).size.width,
        height: ImageHeight,
      ),
    );
  }
}
