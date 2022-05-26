import 'package:nutrimetrix/data/models/nutrition.dart';
import 'package:nutrimetrix/data/providers/nutrition_provider.dart';

class NutritionRepository {
  NutritionRepository();

  NutritionProvider nutritionProvider = NutritionProvider();

  Nutrition nutrition = Nutrition();

  Future<Nutrition> getNutrition(query) async {
    // Получаем json-данные из провайдера
    var json = await nutritionProvider.getJsonNutrition(query);

    // Извлекаем из результата API-запроса нужные поля в модель
    nutrition.calories = json['calories'];

    nutrition.nutrients['fats']['quantity'] =
        json['totalNutrients']['FAT']['quantity'];
    nutrition.nutrients['fats']['daily'] =
        json['totalDaily']['FAT']['quantity'];

    nutrition.nutrients['fats']['subs']['saturatedFats']['quantity'] =
        json['totalNutrients']['FASAT']['quantity'];
    nutrition.nutrients['fats']['subs']['saturatedFats']['daily'] =
        json['totalDaily']['FASAT']['quantity'];

    nutrition.nutrients['fats']['subs']['transFats']['quantity'] =
        json['totalNutrients']['FAMS']['quantity'];

    nutrition.nutrients['carbohydrates']['quantity'] =
        json['totalNutrients']['CHOCDF']['quantity'];
    nutrition.nutrients['carbohydrates']['daily'] =
        json['totalDaily']['CHOCDF']['quantity'];

    nutrition.nutrients['proteins']['quantity'] =
        json['totalNutrients']['PROCNT']['quantity'];
    nutrition.nutrients['proteins']['daily'] =
        json['totalDaily']['PROCNT']['quantity'];

    nutrition.nutrients['cholesterol']['quantity'] =
        json['totalNutrients']['CHOLE']['quantity'];
    nutrition.nutrients['cholesterol']['daily'] =
        json['totalDaily']['CHOLE']['quantity'];

    nutrition.nutrients['sodium']['quantity'] =
        json['totalNutrients']['NA']['quantity'];
    nutrition.nutrients['sodium']['daily'] =
        json['totalDaily']['NA']['quantity'];

    nutrition.nutrients['calcium']['quantity'] =
        json['totalNutrients']['CA']['quantity'];
    nutrition.nutrients['calcium']['daily'] =
        json['totalDaily']['CA']['quantity'];

    nutrition.nutrients['iron']['quantity'] =
        json['totalNutrients']['FE']['quantity'];
    nutrition.nutrients['iron']['daily'] = json['totalDaily']['FE']['quantity'];

    nutrition.nutrients['phosphorus']['quantity'] =
        json['totalNutrients']['P']['quantity'];
    nutrition.nutrients['phosphorus']['daily'] =
        json['totalDaily']['P']['quantity'];

    return nutrition;
  }
}
