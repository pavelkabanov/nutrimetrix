import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimetrix/bloc/nutrition_bloc.dart';
import 'package:nutrimetrix/data/models/nutrition.dart';

class InfoTable extends StatefulWidget {
  @override
  State<InfoTable> createState() => _InfoTable3State();
}

class _InfoTable3State extends State<InfoTable> with TickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> animation;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // @override
  List<Widget> nutritionsList(Nutrition nutrition, BuildContext ctx) {
    List<Widget> nlist = [];
    nlist.addAll([
      Text(
        'Пищевая ценность',
        style: Theme.of(ctx).textTheme.headline5,
        textAlign: TextAlign.center,
      ),
      const Divider(),
      Row(
        children: [
          Expanded(
            flex: 5,
            child: Text(
              'Калории',
              style: Theme.of(ctx).textTheme.headline5,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              nutrition.calories.toString() + ' ккал',
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
      const Divider(),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [Text('Сут. норма, %')],
      ),
      const Divider()
    ]);
    for (var item in nutrition.nutrients.entries) {
      nlist.addAll([
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                item.value['label'],
                style: item.value['priority'] == 3
                    ? Theme.of(ctx).textTheme.headline5
                    : Theme.of(ctx).textTheme.headline6,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                item.value['quantity'].toStringAsFixed(2) +
                    ' ' +
                    item.value['unit'],
                textAlign: TextAlign.end,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                item.value['daily'].toStringAsFixed(1) + '%',
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ]);
      if (item.value['subs'] != null) {
        for (var i in item.value['subs'].entries) {
          nlist.add(Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    i.value['label'],
                    style: Theme.of(ctx)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 15),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  i.value['quantity'].toStringAsFixed(2) + ' г',
                  textAlign: TextAlign.end,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  i.value['daily'].toStringAsFixed(1) + '%',
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ));
        }
      }
      nlist.add(const Divider());
    }
    return nlist;
  }

  Decoration nutritionImage() {
    return BoxDecoration(
      image: DecorationImage(
        alignment: Alignment.center,
        image: const AssetImage('assets/images/schedule.png'),
        colorFilter:
            ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.modulate),
      ),
    );
  }

  // Row(
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
        height: size.height * .55,
        child: BlocBuilder<NutritionBloc, NutritionState>(
            builder: (context, state) {
          if (state is NutritionInitialState) {
            return Container(
              width: 180,
              height: 180,
              decoration: nutritionImage(),
            );
          }

          if (state is NutritionLoadingState) {
            controller = AnimationController(
                vsync: this, duration: const Duration(seconds: 3));
            animation =
                CurvedAnimation(parent: controller, curve: Curves.linear);
            controller.repeat();
            return Container(
              child: RotationTransition(
                turns: animation,
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: nutritionImage(),
                ),
              ),
            );
          }

          if (state is NutritionLoadedState) {
            return ListView(
              children: nutritionsList(state.loadedNutrition, context),
            );
          }

          if (state is NutritionErrorState) {
            return const Center(
              child: Text(
                'Ошибка загрузки данных. Проверьте интернет-соединение.',
                style: TextStyle(fontSize: 20),
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}
