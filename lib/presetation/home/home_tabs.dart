import 'package:flutter/material.dart';

import 'favorites_pokemon/home_list_pokemon_favorite.dart';
import 'home_page/widget/home_list_pokemon.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: const Color(0xff18191a),
          appBar: AppBar(
            backgroundColor: const Color(0xff18191a),
            elevation: 0,
            bottom: const TabBar(
                labelColor: Color(0xff18191a),
                unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(color: Colors.white),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Home Page",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Pokemon favoritos",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                    ),
                  ),
                ]),
          ),
          body: const TabBarView(children: [
            HomeListPokemon(),
            HomeListPokemonFavorite(),
          ]),
        ));
  }
}
