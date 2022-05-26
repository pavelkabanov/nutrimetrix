import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutrimetrix/bloc/nutrition_bloc.dart';
import 'package:nutrimetrix/data/models/nutrition.dart';
import 'package:nutrimetrix/data/repositories/nutrition_repository.dart';

class MockRepository extends Mock implements NutritionRepository {}

void main() {
  group('NutritionBloc', () {
    late NutritionBloc nutritionBloc;
    MockRepository mockRepository;
    late Nutrition nutritionMock;

    setUp(() {
      mockRepository = MockRepository();
      nutritionMock = Nutrition();
      when(
        () => mockRepository.getNutrition(any()),
      ).thenAnswer((invokation) async => nutritionMock);
      nutritionBloc = NutritionBloc(mockRepository);
    });

    tearDown(() {
      nutritionBloc.close();
    });

    test('Начальное состояние: NutritionInitialState', () {
      expect(nutritionBloc.state, NutritionInitialState());
    });

    blocTest<NutritionBloc, NutritionState>(
      'Состояние [NutritionLoadingState] когда событие NutritionLoadEvent запущено',
      build: () => nutritionBloc,
      act: (bloc) => bloc.add(NutritionLoadEvent('1 cup rice')),
      expect: () => [
        NutritionLoadingState(),
        NutritionLoadedState(loadedNutrition: nutritionMock)
      ],
    );
  });
}
