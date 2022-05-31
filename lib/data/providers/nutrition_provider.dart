import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';

class NutritionProvider {
  Future<Map<String, dynamic>> getJsonNutrition(query) async {
    // Переводим строку запроса на ангийский язык для API-запроса
    final translator = GoogleTranslator();
    query = await translator.translate(query, from: 'auto', to: 'en');

    query = query.toString();
    if (double.tryParse(query[0] as String) == null) {
      query = '1 ' + query;
    }

    // API-запрос
    final url = Uri.parse('${dotenv.env['API_URL']}&ingr=$query');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> nutritionsJson = json.decode(response.body);
      return nutritionsJson;
    } else {
      throw Exception('Ошибка загрузки данных.');
    }
  }
}
