// import 'dart:async';

// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:vindulaapp/models/model_vindula/publicacao/publicacao.dart';
// import 'package:vindulaapp/respositorys/vindula/buscar-dados/postagem/buscar_postagem.dart';
// import 'package:vindulaapp/respositorys/vindula/criar-dados/likes/like.dart';
// import 'package:vindulaapp/ui_vindula/ui_postage,.dart';
// import 'package:vindulaapp/utils/metodos.dart';

// class ControllerSplash extends GetxController with StateMixin {
//   UIVindulaPostage uiVindulaPostage;
//   bool sempublicacoes;
//   int next;
//   Timer _timer;
//   List<Result> _publicacoes = [];
//   List<Result> get publicacoes => _publicacoes;

//   RefreshController controllerrefresh = RefreshController(initialRefresh: true);
//   LikePublicacao like = LikePublicacao();
//   Metodos metodotos = new Metodos();
//   List<bool> listIsLiked = [];

//   ControllerSplash([this.uiVindulaPostage]) {
//     uiVindulaPostage = BuscarPostagem();
//   }

//   Future<void> getNextPosts() async {
//     try {
//       next++;
//       change([], status: RxStatus.loading());
//       _publicacoes = await uiVindulaPostage.buscarPublicacao();
//       update();
//       verficartoken();
//       if (_publicacoes.isNotEmpty) {
//         listIsLiked =
//             List<bool>.generate(_publicacoes.length, (index) => false);
//         update();
//       }
//       change(_publicacoes, status: RxStatus.success());
//       update();
//     } catch (e) {
//       change(
//         [],
//         status: RxStatus.error("Sem publicações"),
//       );
//     }
//   }

//   Future<void> getPreviPost() async {
//     try {
//       next--;
//       change([], status: RxStatus.loading());
//       _publicacoes = await uiVindulaPostage.buscarPublicacao();
//       update();
//       verficartoken();
//       if (_publicacoes.isNotEmpty) {
//         listIsLiked =
//             List<bool>.generate(_publicacoes.length, (index) => false);
//         update();
//       }
//       change(_publicacoes, status: RxStatus.success());
//       update();
//     } catch (e) {
//       change(
//         [],
//         status: RxStatus.error("Sem publicações"),
//       );
//     }
//   }

//   Future<void> criaLikepublicacao(id, remove) async {
//     try {
//       await like.criarLike(id);
//       update();
//     } catch (e) {
//       print(e);
//     }
//   }

//   void onTapLikeFunction(int index) async {
//     listIsLiked[index] = !listIsLiked[index];
//     await criaLikepublicacao(
//       _publicacoes[index].publicacaoid,
//       !listIsLiked[index],
//     );
//     if (listIsLiked[index] == true) {
//       _publicacoes[index].likes =
//           (int.parse(_publicacoes[index].likes) + 1).toString();
//     } else {
//       _publicacoes[index].likes =
//           (int.parse(_publicacoes[index].likes) - 1).toString();
//     }
//     update();
//   }




//   Future<void> getPosts() async {
//     try {
//       change([], status: RxStatus.loading());
//       _publicacoes = await uiVindulaPostage.buscarPublicacaoprevi();
//       sempublicacoes = true;
//       verficartoken();
//       if (_publicacoes.isNotEmpty) {
//         listIsLiked =
//             List<bool>.generate(_publicacoes.length, (index) => false);
//         update();
//       }
//       change(_publicacoes, status: RxStatus.success());
//       update();
//     } catch (e) {
//       change(
//         [],
//         status: RxStatus.error("Conexão ruim, Tenta Novamente"),
//       );
//     }
//   }

//   Future<bool> refreshdata() async {
//     try {
//       change([], status: RxStatus.loading());
//       _publicacoes = await uiVindulaPostage.buscarPublicacaonext();
//       change(_publicacoes, status: RxStatus.success());
//       update();
//       if (_publicacoes.isNotEmpty) {
//         listIsLiked =
//             List<bool>.generate(_publicacoes.length, (index) => false);
//         update();
//         change(_publicacoes, status: RxStatus.success());
//       }
//       return true;
//     } catch (e) {
//       change([], status: RxStatus.error("Página vazia"));
//       return false;
//     }
//   }

//   Future<void> getChecandoAconexao() async {
//     try {
//       change([], status: RxStatus.loading());
//       _publicacoes = await uiVindulaPostage.buscarPublicacao();
//       update();
//       verficartoken();
//       if (_publicacoes.isNotEmpty) {
//         listIsLiked =
//             List<bool>.generate(_publicacoes.length, (index) => false);
//         update();
//       }
//       change(_publicacoes, status: RxStatus.success());
//       update();
//     } catch (e) {
//       change(
//         [],
//         status: RxStatus.error("Sem publicações"),
//       );
//     }
//   }

//   verficartoken() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     var token = sharedPreferences.getString("access");
//     // ignore: unused_local_variable
//     var refreshtoken = sharedPreferences.getString("refresh");
//     if (token != null) {
//       update();

//       return Get.offNamed("/menu");
//     } else {
//       update();
//       return Get.offNamed("/login");
//     }
//   }

//   @override
//   void onInit() {
//     EasyLoading.addStatusCallback((status) {
//       print('EasyLoading Status $status');
//       if (status == EasyLoadingStatus.dismiss) {
//         _timer?.cancel();
//       }
//     });
//     Future.delayed(Duration(seconds: 1), () {
//       verficartoken();
//       getChecandoAconexao();
//     });

//     super.onInit();
//   }
// }


//  GetBuilder<ControllerSplash>(builder: (_) {
//                               return _.publicacoes == null ||
//                                       _.publicacoes.isEmpty
//                                   ? CircularProgressIndicator.adaptive()
//                                   : Expanded(
//                                       child: Text(
//                                         "${_.publicacoes[index].likes}",
//                                         style:
//                                             TextStyle(color: Colors.grey[600]),
//                                       ),
//                                     );
//                             }),