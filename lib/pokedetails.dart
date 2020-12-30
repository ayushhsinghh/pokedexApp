import 'package:PokemonApp/model/pokeinfo.dart';
import 'package:flutter/material.dart';

class PokemonPage extends StatelessWidget {
  final Pokemon pokemon;

  bodyWidget(BuildContext context) => Stack(
        children: [
          Positioned(
            height: MediaQuery.of(context).size.height * .7,
            width: MediaQuery.of(context).size.width * .9,
            left: MediaQuery.of(context).size.width * .05,
            top: MediaQuery.of(context).size.height * .08,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Text(
                    "Height :  ${pokemon.height}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Divider(
                    color: Colors.transparent,
                  ),
                  Text(
                    "Weight :  ${pokemon.weight}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Divider(
                    color: Colors.transparent,
                  ),
                  Text(
                    "Candy :  ${pokemon.candy}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Divider(
                    color: Colors.transparent,
                  ),
                  Text(
                    "Candy Count :  ${pokemon.candyCount}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Divider(
                    color: Colors.transparent,
                  ),
                  Text(
                    "Spawn Chance :  ${pokemon.spawnChance}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Divider(
                    color: Colors.transparent,
                  ),
                  Text(
                    "Spawn Time :  ${pokemon.spawnTime}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Divider(
                    color: Colors.transparent,
                  ),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Type :",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: pokemon.type
                              .map((t) => FilterChip(
                                  backgroundColor: Colors.amber,
                                  label: Text(t),
                                  onSelected: (b) {}))
                              .toList(),
                        ),
                      ]),
                  Divider(
                    color: Colors.transparent,
                  ),

                  Text(
                    "Weekness : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Wrap(
                      children: pokemon.weaknesses
                          .map((e) => SingleChildScrollView(
                                child: FilterChip(
                                  label: Text(e),
                                  onSelected: (b) {},
                                  backgroundColor: Colors.orange,
                                ),
                              ))
                          .toList()),

                  // ),

                  Divider(
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
                tag: pokemon.img,
                child: Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(pokemon.img))),
                )),
          ),
        ],
      );

  PokemonPage({this.pokemon});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          pokemon.name,
        ),
        centerTitle: true,
      ),
      body: bodyWidget(context),
    );
  }
}
