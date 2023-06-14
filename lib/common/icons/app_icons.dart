import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors/app_colors.dart';

// Класс с иконками
class AppIcons {
  static const cancelIcon = Icon(Icons.close_rounded, color: Colors.black);
  static const favoriteIcon =
      Icon(Icons.favorite_border_rounded, color: Colors.black);

  static final unselectedMainIcon =
      SvgPicture.asset('assets/icons/ic_main.svg');
  static final selectedMainIcon = SvgPicture.asset(
    'assets/icons/ic_main.svg',
    color: AppColors.selectedButtonColor,
  );

  static final unselectedSearchIcon =
      SvgPicture.asset('assets/icons/ic_search.svg');
  static final selectedSearchIcon = SvgPicture.asset(
    'assets/icons/ic_search.svg',
    color: AppColors.selectedButtonColor,
  );

  static final unselectedBagIcon = SvgPicture.asset('assets/icons/ic_bag.svg');
  static final selectedBagIcon = SvgPicture.asset(
    'assets/icons/ic_bag.svg',
    color: AppColors.selectedButtonColor,
  );

  static final locationIcon = SvgPicture.asset(
    'assets/icons/ic_location.svg',
    height: 40.0,
    width: 40.0,
  );
}
