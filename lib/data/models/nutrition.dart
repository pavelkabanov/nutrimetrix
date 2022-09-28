import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:nutrimetrix/generated/locale_keys.g.dart';

class Nutrition extends Equatable {
  // Калории
  num calories = 0;

  // Пищевые элементы
  Map nutrients = {
    'fats': {
      'label': LocaleKeys.total_fat,
      'quantity': 0,
      'daily': 0,
      'priority': 3,
      'unit': LocaleKeys.g,
      'subs': {
        'saturatedFats': {
          'label': LocaleKeys.saturated_fat,
          'quantity': 0,
          'daily': 0,
          'priority': 1,
          'unit': LocaleKeys.g,
        },
        'transFats': {
          'label': LocaleKeys.trans_fat,
          'quantity': 0,
          'daily': 0,
          'priority': 1,
          'unit': LocaleKeys.g,
        },
      },
    },
    'carbohydrates': {
      'label': LocaleKeys.carbohydrate,
      'quantity': 0,
      'daily': 0,
      'priority': 3,
      'unit': LocaleKeys.g,
    },
    'proteins': {
      'label': LocaleKeys.protein,
      'quantity': 0,
      'daily': 0,
      'priority': 3,
      'unit': LocaleKeys.g,
    },
    'cholesterol': {
      'label': LocaleKeys.cholesterol,
      'quantity': 0,
      'daily': 0,
      'priority': 2,
      'unit': LocaleKeys.mg,
    },
    'sodium': {
      'label': LocaleKeys.sodium,
      'quantity': 0,
      'daily': 0,
      'priority': 2,
      'unit': LocaleKeys.mg,
    },
    'calcium': {
      'label': LocaleKeys.calcium,
      'quantity': 0,
      'daily': 0,
      'priority': 2,
      'unit': LocaleKeys.mg,
    },
    'iron': {
      'label': LocaleKeys.iron,
      'quantity': 0,
      'daily': 0,
      'priority': 2,
      'unit': LocaleKeys.mg,
    },
    'phosphorus': {
      'label': LocaleKeys.phosphorus,
      'quantity': 0,
      'daily': 0,
      'priority': 2,
      'unit': LocaleKeys.mg,
    },
  };

  @override
  List<Object> get props => [calories, nutrients];
}
