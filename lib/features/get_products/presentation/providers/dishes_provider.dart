// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_application_restaurant/common/colors/app_colors.dart';
import 'package:flutter_test_application_restaurant/core/utils/list_of_tegs.dart'
    as listOfTegs;

import '../bloc/dishes_bloc/dishes_bloc.dart';
import '../bloc/dishes_bloc/dishes_event.dart';

// Класс провайдер для страницы DishesPage
class DishesProvider extends ChangeNotifier {
  List<bool> _selectedTegs = [true, false, false, false];

  List<Color> _selectedColor = [];

  List<Color> get selectedColor => _selectedColor;

  DishesProvider() {
    _initTegsButtons();
  }

  // Метод добавления нового события страницы
  void addEvent(BuildContext context, int index) {
    final DishesBloc bloc = context.read<DishesBloc>();

    bloc.add(DishesLoadWithTegEvent(listOfTegs.tegs[index]));

    _changeButtonsColors(index);
    notifyListeners();
  }

  // Метод обновлящий цвета кнопок тегов
  void _changeButtonsColors(int index) {
    _selectedTegs = _selectedTegs.map((_) => false).toList();
    notifyListeners();

    _selectedTegs[index] = true;
    _initSelectedColors();
  }

  // Метод инициализирующий кнопки тегов
  void _initTegsButtons() {
    _initSelectedColors();
  }

  // Метод инициализирующий цвета кнопок тегов
  void _initSelectedColors() {
    _selectedColor = _selectedTegs.map((selected) {
      if (selected) {
        return AppColors.selectedButtonColor;
      } else {
        return AppColors.unselectedElevatedButtonColor;
      }
    }).toList();
    notifyListeners();
  }

  Color setTextColor(int index) {
    if (_selectedTegs[index]) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}
