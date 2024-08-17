import 'package:blurbox/blurbox.dart';
import 'package:clean_arcitechture_edu/core/widgets/dot_loading_widget.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/data/model/suggest_city_model.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/domain/use_cases/get_suggestion_city_usecase.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CitySearch extends StatelessWidget {
  const CitySearch({
    super.key,
    required this.width,
    required this.textEditingController,
    required this.getSuggestionCityUseCase,
  });

  final double width;
  final TextEditingController textEditingController;
  final GetSuggestionCityUseCase getSuggestionCityUseCase;

  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
      emptyBuilder: (context) => BlurBox(
        blur: 10,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white.withOpacity(
            0.3,
          ),
        ),
        width: width,
        height: 400,
        child: const Center(
          child: Text('Item not found'),
        ),
      ),
      errorBuilder: (context, error) => BlurBox(
        blur: 10,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white.withOpacity(
            0.3,
          ),
        ),
        width: width,
        height: 400,
        child: const Center(
          child: Text('Error...'),
        ),
      ),
      loadingBuilder: (context) => BlurBox(
        blur: 10,
        borderRadius: BorderRadius.circular(8),
        width: width,
        border: Border.all(
          color: Colors.white.withOpacity(
            0.3,
          ),
        ),
        height: 400,
        child: const Center(
          child: DotLoadingWidget(),
        ),
      ),
      listBuilder: (context, children) => ListView.builder(
          physics: const AlwaysScrollableScrollPhysics()
              .applyTo(const BouncingScrollPhysics()),
          itemBuilder: (context, position) => Column(children: children)),
      decorationBuilder: (context, child) => Material(
        type: MaterialType.card,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: child,
      ),
      builder: (context, controller, focusNode) => BlurBox(
        blur: 10,
        borderRadius: BorderRadius.circular(8),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
              border: const OutlineInputBorder(),
              hintText: 'Zanjan',
              labelText: 'City Name...',
              labelStyle: TextStyle(color: Colors.white.withOpacity(0.3))),
        ),
      ),
      controller: textEditingController,
      suggestionsCallback: (String prefix) => getSuggestionCityUseCase(prefix),
      itemBuilder: (context, Data model) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: BlurBox(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
          ),
          blur: 10,
          child: ListTile(
            tileColor: Colors.transparent,
            leading: const Icon(Icons.location_on),
            title: Text(model.name!),
            subtitle: Text("${model.region!}, ${model.country!}"),
          ),
        ),
      ),
      onSelected: (Data model) {
        textEditingController.text = model.name!;
        BlocProvider.of<HomeBloc>(context).add(LoadCwEvent(model.name!));
      },
    );
  }
}
