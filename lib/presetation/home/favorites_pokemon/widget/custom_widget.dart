import 'package:app_pokmon/presetation/styles/colors.dart';
import 'package:image_network/image_network.dart';

import '../../../../imports.dart';
import '../../../custom_widget/custom_widget.dart';

Widget customListFavorite({List<ResponseFavorite>? modelPokemon}) {
  return Container(
    color: background,
    margin: const EdgeInsets.symmetric(vertical: 20),
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: modelPokemon!.length,
      padding: const EdgeInsets.all(05),
      itemBuilder: ((context, index) {
        final ResponseFavorite resultPokemon = modelPokemon[index];
        return Card(
            color: backgroundCard,
            elevation: 20,
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
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
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
                const Positioned(
                  right: 0,
                  child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        
                      )),
                ),
              ],
            ));
      }),
    ),
  );
}
