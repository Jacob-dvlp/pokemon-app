import '../../../imports.dart';
import '../../custom_widget/custom_widget.dart';
import 'widget/custom_widget.dart';

class HomeListPokemonFavorite extends StatefulWidget {
  const HomeListPokemonFavorite({Key? key}) : super(key: key);

  @override
  State<HomeListPokemonFavorite> createState() =>
      _HomeListPokemonFavoriteState();
}

class _HomeListPokemonFavoriteState extends State<HomeListPokemonFavorite> {
  @override
  void initState() {
    context.read<GetPokemonCubit>().getPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPokemonCubit, GetPokemonState>(
      builder: (context, state) {
        if (state is GetPokemonLoading) {
          return const CircularProgressIndicatorWidgetCustom();
        }
        if (state is GetPokemonError) {
          return const Center(
            child: Text(errorMsgFavorite),
          );
        }
        if (state is GetPokemonSuccess) {
          final modelPokemon = state.responseFavorite;
          return modelPokemon!.isEmpty
              ? const Center(
                  child: Text(msgEmptyFavorite),
                )
              : customListFavorite(modelPokemon: state.responseFavorite);
        }
        return Container();
      },
    );
  }
}
