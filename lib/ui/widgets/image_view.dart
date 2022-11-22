import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String imageName;

  const ImageView({Key? key, required this.imageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Image.asset(
        imageName,
        fit: BoxFit.fill,
      ),
    );
  }
}
