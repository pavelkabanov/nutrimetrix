import 'package:equatable/equatable.dart';

class Nutrition extends Equatable {
  // Калории
  num calories = 0;

  // Пищевые элементы
  Map nutrients = {
    'fats': {
      'label': 'Жиры',
      'quantity': 0,
      'daily': 0,
      'priority': 3,
      'unit': 'г',
      'subs': {
        'saturatedFats': {
          'label': 'Насыщенные жиры',
          'quantity': 0,
          'daily': 0,
          'priority': 1,
          'unit': 'г',
        },
        'transFats': {
          'label': 'Транс жиры',
          'quantity': 0,
          'daily': 0,
          'priority': 1,
          'unit': 'г',
        },
      },
    },
    'carbohydrates': {
      'label': 'Углеводы',
      'quantity': 0,
      'daily': 0,
      'priority': 3,
      'unit': 'г',
    },
    'proteins': {
      'label': 'Белки',
      'quantity': 0,
      'daily': 0,
      'priority': 3,
      'unit': 'г',
    },
    'cholesterol': {
      'label': 'Холестерин',
      'quantity': 0,
      'daily': 0,
      'priority': 2,
      'unit': 'мг',
    },
    'sodium': {
      'label': 'Натрий',
      'quantity': 0,
      'daily': 0,
      'priority': 2,
      'unit': 'мг',
    },
    'calcium': {
      'label': 'Кальций',
      'quantity': 0,
      'daily': 0,
      'priority': 2,
      'unit': 'мг',
    },
    'iron': {
      'label': 'Железо',
      'quantity': 0,
      'daily': 0,
      'priority': 2,
      'unit': 'мг',
    },
    'phosphorus': {
      'label': 'Фосфор',
      'quantity': 0,
      'daily': 0,
      'priority': 2,
      'unit': 'мг',
    },
  };

  @override
  List<Object> get props => [calories, nutrients];
}
