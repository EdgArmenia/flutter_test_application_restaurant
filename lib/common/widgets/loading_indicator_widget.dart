import 'package:flutter/material.dart';

Widget loadingIndicatorWidget() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Expanded(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ),
  );
}
