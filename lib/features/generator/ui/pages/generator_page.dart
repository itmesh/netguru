import 'dart:math';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:netguru/features/add_new_value/add_new_value_page.dart';
import 'package:netguru/features/favorites/favorites_page.dart';
import 'package:netguru/features/generator/ui/cubit/generator_cubit.dart';
import 'package:netguru/features/values/values_page.dart';
import 'package:netguru/helpers/netguru_values_manager.dart';
import 'package:netguru/locator/service_locator.dart';
import 'package:netguru/resources/strings.dart';
import 'package:netguru/resources/text_styles.dart';

class GeneratorPage extends StatefulWidget {
  @override
  _GeneratorPageState createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  GeneratorCubit _cubit;

  @override
  void initState() {
    super.initState();
    _setUpCubit();
    _cubit.startGenerator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appBarTitle, style: TextStyles.bodyBold),
        actions: [
          BlocBuilder(
            cubit: _cubit,
            builder: (_, GeneratorState state) {
              return IconButton(
                onPressed: () {
                  state.favorite
                      ? _cubit.removeFromFavorites()
                      : _cubit.addToFavorites();
                },
                icon: Icon(
                  state.favorite ? Icons.favorite : Icons.favorite_border,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              );
            },
          )
        ],
      ),
      floatingActionButton: OpenContainer(
        closedShape: CircleBorder(),
        closedElevation: 10,
        transitionDuration: Duration(milliseconds: 400),
        closedBuilder: (_, __) => Container(
          color: Colors.white,
          width: 64.0,
          height: 64.0,
          child: Icon(Icons.add),
        ),
        openBuilder: (_, __) => AddNewValuePage(
          onSave: (ctx, value) {
            Navigator.of(ctx).pop();
            _cubit.addNewValue(value);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: BlocBuilder(
            cubit: _cubit,
            builder: (_, GeneratorState state) => AnimatedSwitcher(
              duration: Duration(milliseconds: 400),
              child: Text(
                state.value,
                key: ValueKey<int>(state.valueIndex),
                style: TextStyles.title,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() => BottomAppBar(
        color: Theme.of(context).primaryColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Row(
            children: [
              SizedBox(width: 16.0),
              Material(
                borderRadius: BorderRadius.circular(8.0),
                clipBehavior: Clip.hardEdge,
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => _navigateToValuesPage(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.format_quote_sharp, color: Colors.white),
                        SizedBox(height: 4.0),
                        Text(
                          Strings.values,
                          style: TextStyles.caption.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              Material(
                borderRadius: BorderRadius.circular(8.0),
                clipBehavior: Clip.hardEdge,
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => _navigateToFavoritesPage(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite, color: Colors.white),
                        SizedBox(height: 4.0),
                        Text(
                          Strings.favorites,
                          style: TextStyles.caption.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.0),
            ],
          ),
        ),
      );

  void _setUpCubit() {
    final valuesManager = getIt<NetguruValuesManager>();
    _cubit = GeneratorCubit(
      GeneratorState(
        valueIndex: 0,
        value: valuesManager.values[0].value,
        favorite: valuesManager.values[0].favorite,
      ),
      valuesManager,
      getIt<Random>(),
    );
  }

  void _navigateToValuesPage() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => ValuesPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final begin = Offset(-1.0, 0.0);
          final end = Offset.zero;
          final tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: Curves.ease),
          );

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  void _navigateToFavoritesPage() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            FavoritesPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final begin = Offset(1.0, 0.0);
          final end = Offset.zero;
          final tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: Curves.ease),
          );

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }
}
