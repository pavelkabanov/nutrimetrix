import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimetrix/data/models/nutrition.dart';
import 'package:nutrimetrix/data/repositories/nutrition_repository.dart';

part 'nutrition_event.dart';
part 'nutrition_state.dart';

class NutritionBloc extends Bloc<NutritionEvent, NutritionState> {
  final NutritionRepository nutritionRepository;

  NutritionBloc(this.nutritionRepository) : super(NutritionInitialState()) {
    // Пользователь отправил форму с запросом
    on<NutritionLoadEvent>((event, emit) async {
      // Загружаем Загрузочное состояние
      emit(NutritionLoadingState());
      try {
        // Строка запроса
        final query = event.query;
        // Берем пришедшие API-данные из репозитория
        final Nutrition nutrition =
            await nutritionRepository.getNutrition(query);
        // Загружаем состояние с выводом пришедших данных
        emit(NutritionLoadedState(loadedNutrition: nutrition));
      } catch (_) {
        emit(NutritionErrorState());
      }
    });
  }
}
