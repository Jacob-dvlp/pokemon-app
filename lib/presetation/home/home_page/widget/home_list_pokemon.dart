import 'package:app_pokmon/presetation/styles/colors.dart';
import 'package:app_pokmon/src/model/response_api_pokemon.dart';
import 'package:image_network/image_network.dart';

import '../../../../imports.dart';
import '../../../controller/imports.dart';
import '../../../custom_widget/custom_widget.dart';

class HomeListPokemon extends StatefulWidget {
  const HomeListPokemon({Key? key}) : super(key: key);

  @override
  State<HomeListPokemon> createState() => _HomeListPokemonState();
}

class _HomeListPokemonState extends State<HomeListPokemon> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPokemonCubit, GetPokemonState>(
      builder: (context, state) {
        if (state is GetPokemonLoading) {
          return const CircularProgressIndicatorWidgetCustom();
        }
        if (state is GetPokemonError) {
          return const Center(
            child: Text(errorMsg),
          );
        }
        if (state is GetPokemonSuccess) {
          final modelPokemon = state.result;
          return modelPokemon!.isEmpty
              ? const Center(
                  child: Text(msgEmpty),
                )
              : customListHomePage(modelPokemon: state.result);
        }
        return Container();
      },
    );
  }

  Widget customListHomePage({List<Pokemon>? modelPokemon}) {
    return Container(
      color: background,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: modelPokemon!.length,
          padding: const EdgeInsets.all(05),
          itemBuilder: ((context, index) {
            final Pokemon resultPokemon = modelPokemon[index];
            return Card(
                color: const Color(0xff242526),
                elevation: 25,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ImageNetwork(
                            fitAndroidIos: BoxFit.cover,
                            image: "$urlImagePokemon/${resultPokemon.num}.png",
                            height: 250,
                            width: 450,
                            onLoading: const Center(
                                child: CircularProgressIndicatorWidgetCustom()),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0)),
                            width: 100,
                            height: 30,
                            child: Center(
                              child: Text(
                                resultPokemon.name!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: GestureDetector(
                          onTap: () async {
                            modelPokemon[index].favorite =
                                !modelPokemon[index].favorite;
                            ResponseFavorite? model;
                            final data = model ??
                                ResponseFavorite(
                                    favorite: resultPokemon.favorite,
                                    name: resultPokemon.name,
                                    num: resultPokemon.num);
                            await PokemonRepositoryOffline()
                                .createFavorite(createFavorite: data);
                            setState(() {});
                            //     print(data);
                          },
                          child: resultPokemon.favorite
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_outline_outlined,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: GestureDetector(
                          onTap: () async {
                            modelPokemon[index].favorite =
                                !modelPokemon[index].favorite;
                            ResponseFavorite? model;
                            final data = model ??
                                ResponseFavorite(
                                    favorite: resultPokemon.favorite,
                                    name: resultPokemon.name,
                                    num: resultPokemon.num);
                            await PokemonRepositoryOffline()
                                .createFavorite(createFavorite: data);
                            setState(() {});
                            //     print(data);
                          },
                          child: resultPokemon.favorite
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_outline_outlined,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                    ),
                  ],
                ));
          })),
    );
  }
}
