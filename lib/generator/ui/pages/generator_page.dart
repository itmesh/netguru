import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netguru/resources/strings.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NG Values'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: Theme.of(context).secondaryHeaderColor,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
        onPressed: () {},
      ),
      body: Container(
        child: Center(child: Text('Some random text')),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
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
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.format_quote_sharp, color: Colors.white),
                        Text(
                          Strings.valuesBottomBar,
                          style: TextStyle(color: Colors.white),
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
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite, color: Colors.white),
                        Text(
                          Strings.favoritesBottomBar,
                          style: TextStyle(color: Colors.white),
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
      ),
    );
  }
}
