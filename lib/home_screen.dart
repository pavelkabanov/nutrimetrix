import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimetrix/bloc/nutrition_bloc.dart';
import 'package:nutrimetrix/data/repositories/nutrition_repository.dart';
import 'package:nutrimetrix/widgets/info_table.dart';
import 'package:nutrimetrix/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  final nutritionRepository = NutritionRepository();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider<NutritionBloc>(
      create: (context) => NutritionBloc(nutritionRepository),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: size.height * .42,
                    decoration: const BoxDecoration(
                      color: Color(0xFFA9ECAA),
                      image: DecorationImage(
                        alignment: Alignment.center,
                        image: AssetImage('assets/images/food_bg3.png'),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.width < 330 ? 15 : size.height * .1,
                          ),
                          Center(
                            child: AutoSizeText(
                              'Узнайте пищевую ценность продуктов',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  const Shadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 3,
                                    color: Color.fromRGBO(10, 20, 10, .8),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SearchBar(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              InfoTable(),
            ],
          ),
        ),
      ),
    );
  }
}
