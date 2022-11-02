import 'imports.dart';
import 'src/dependece/dependeces.dart' as dependece;

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => dependece.getIt<GetPokemonCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        theme: ThemeData(primaryColor: const Color(0xfffeca05)),
        routes: AppRoutes.routes,
      ),
    );
  }
}
