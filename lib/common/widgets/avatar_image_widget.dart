import 'package:flutter/material.dart';

import '../constants.dart';

Widget avatarImageWidget() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child: Container(
      height: 50.0,
      width: 50.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(Constants.IMAGE_URL),
        ),
      ),
    ),
  );
}
