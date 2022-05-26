part of 'nutrition_bloc.dart';

abstract class NutritionEvent {}

// Событие отправки запроса
class NutritionLoadEvent extends NutritionEvent {
  String query = '';

  NutritionLoadEvent(this.query);
}
