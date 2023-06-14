import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_restaurant/common/widgets/avatar_image_widget.dart';

PreferredSizeWidget dishesPageAppBarWidget(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: Theme.of(context).textTheme.titleLarge,
    ),
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(
        Icons.chevron_left,
        color: Colors.black,
        size: 35.0,
      ),
      onPressed: () {
        context.router.pop();
      },
    ),
    actions: [
      avatarImageWidget(),
    ],
  );
}
