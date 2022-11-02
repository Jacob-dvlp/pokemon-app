import '../../imports.dart';

class CircularProgressIndicatorWidgetCustom extends StatelessWidget {
  const CircularProgressIndicatorWidgetCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        color: Colors.black,
      ),
    );
  }
}
