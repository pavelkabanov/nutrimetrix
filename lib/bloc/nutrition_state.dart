part of 'nutrition_bloc.dart';

abstract class NutritionState extends Equatable {
  @override
  List<Object> get props => [];
}

// Начальное состояние
class NutritionInitialState extends NutritionState {}

// Пользователь ввел текст в форму и отправил запрос. Идет загрузка.
class NutritionLoadingState extends NutritionState {}

// Данные из API загрузились
class NutritionLoadedState extends NutritionState {
  final Nutrition loadedNutrition;
  NutritionLoadedState({required this.loadedNutrition});

  @override
  List<Object> get props => [loadedNutrition];
}

// Состояние ошибки
class NutritionErrorState extends NutritionState {}
