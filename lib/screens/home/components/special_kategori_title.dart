import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SectionKategoriTitle extends StatelessWidget {
  const SectionKategoriTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
