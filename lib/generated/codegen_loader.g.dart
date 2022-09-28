// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ru = {
  "find_out_nutritional_value_of_food": "Узнайте пищевую ценность продуктов",
  "nutritional_value": "Пищевая ценность",
  "for_example": "Например",
  "calories": "Калории",
  "kcal": "ккал",
  "daily_value": "Сут. норма",
  "g": "г",
  "mg": "мг",
  "total_fat": "Жиры",
  "saturated_fat": "Насыщенные жыры",
  "trans_fat": "Транс жиры",
  "carbohydrate": "Углеводы",
  "protein": "Белки",
  "cholesterol": "Холестерин",
  "sodium": "Натрий",
  "calcium": "Кальций",
  "iron": "Железо",
  "phosphorus": "Фосфор",
  "error_check_internet_connection": "Ошибка загрузки данных. Проверьте интернет-соединение."
};
static const Map<String,dynamic> en = {
  "find_out_nutritional_value_of_food": "Find out the nutritional value of food",
  "nutritional_value": "Nutritional value",
  "for_example": "For example",
  "calories": "Calories",
  "kcal": "kcal",
  "daily_value": "Daily value",
  "g": "g",
  "mg": "mg",
  "total_fat": "Total Fat",
  "saturated_fat": "Saturated Fat",
  "trans_fat": "Trans Fat",
  "carbohydrate": "Carbohydrate",
  "protein": "Protein",
  "cholesterol": "Cholesterol",
  "sodium": "Sodium",
  "calcium": "Calcium",
  "iron": "Iron",
  "phosphorus": "Phosphorus",
  "error_check_internet_connection": "Error. Please, check the internet connection."
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": ru, "en": en};
}
