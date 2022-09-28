import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimetrix/bloc/nutrition_bloc.dart';
import 'package:nutrimetrix/generated/locale_keys.g.dart';
import 'package:nutrimetrix/utils/search_examples.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 30,
            bottom: 5,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(29.5),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 1,
                color: Color.fromRGBO(10, 20, 10, .2),
              ),
            ],
          ),
          child: TextField(
            onSubmitted: (query) {
              context.read<NutritionBloc>().add(NutritionLoadEvent(query));
            },
            decoration: const InputDecoration(
              // hintText: "Поиск...",
              icon: Icon(Icons.search),
              border: InputBorder.none,
            ),
          ),
        ),
        AutoSizeText(
          '${LocaleKeys.for_example.tr()}: ${(SEARCH_EXAMPLES[context.locale.toString()].toList()..shuffle()).first}',
          maxLines: 1,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: const [
              Shadow(
                offset: Offset(0, 0),
                blurRadius: 2,
                color: Color.fromRGBO(10, 20, 10, 1),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
