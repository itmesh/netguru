import 'dart:async';
import 'dart:math';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netguru/features/add_new_value/add_new_page.dart';
import 'package:netguru/features/favorites/favorites_page.dart';
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
  final _valuesManager = getIt.get<NetguruValuesManager>();
  final _random = Random();

  int _generatedValue = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _generatedValue = _random.nextInt(_valuesManager.values.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appBarTitle, style: TextStyles.bodyBold),
        actions: [
          IconButton(
            onPressed: () => _valuesManager.addToFavoriteAt(_generatedValue),
            icon: Icon(
              Icons.favorite,
              color: Theme.of(context).secondaryHeaderColor,
            ),
          )
        ],
      ),
      floatingActionButton: OpenContainer(
        closedShape: CircleBorder(),
        closedElevation: 10,
        transitionDuration: Duration(milliseconds: 800),
        closedBuilder: (_, __) => Container(
          color: Colors.white,
          width: 64.0,
          height: 64.0,
          child: Icon(Icons.add),
        ),
        openBuilder: (_, __) => AddNewValuePage(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 400),
            child: Text(
              _valuesManager.values[_generatedValue].value,
              key: ValueKey<String>(
                _valuesManager.values[_generatedValue].value,
              ),
              style: TextStyles.title,
              textAlign: TextAlign.center,
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
                          Strings.valuesBottomBar,
                          style:
                              TextStyles.caption.copyWith(color: Colors.white),
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
                          Strings.favoritesBottomBar,
                          style:
                              TextStyles.caption.copyWith(color: Colors.white),
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
