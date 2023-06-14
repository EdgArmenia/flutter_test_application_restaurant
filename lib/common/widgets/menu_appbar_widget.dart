import 'package:flutter/material.dart';
import 'package:flutter_test_application_restaurant/common/widgets/avatar_image_widget.dart';

import '../../core/utils/date_and_location.dart';
import '../icons/app_icons.dart';

PreferredSizeWidget menuAppBarWidget(
    BuildContext context, DateAndLocation? dateAndLocation) {
  return AppBar(
    leading: Container(
      width: 15.0,
      height: 15.0,
      alignment: Alignment.center,
      child: AppIcons.locationIcon,
    ),
    title: ListTile(
      title: Text(
        dateAndLocation?.location ?? "",
        style: Theme.of(context).textTheme.titleLarge,
        locale: const Locale('ru'),
      ),
      subtitle: Text(
        dateAndLocation?.date ?? "",
        style: Theme.of(context).textTheme.titleMedium,
      ),
    ),
    actions: [
      avatarImageWidget(),
    ],
  );
}
