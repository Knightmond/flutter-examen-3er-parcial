import 'package:examen_3er_parcial/api/requests_api.dart';
import 'package:examen_3er_parcial/models/psychonaut_model.dart';
import 'package:get/get.dart';

class PsychonautController extends GetxController {
  @override
  void onInit(){
    getPsychonauts();
    super.onInit();
  }

  final request = Get.find<RequestsAPI>();
  bool cargando = false;
  List<PsychonautModel> psychonauts = [];
  List<PsychonautModel> psychonautsSearch = [];
  late PsychonautModel psychonaut;

  Future<void> getPsychonauts() async {
    cargando = true;
    update();
    final respuesta = await request.httpGet(url: "https://psychonauts-api.herokuapp.com/api/characters?limit=40");
    final listaPsychonauts = respuesta.body;
    final psychonautsModel = List<PsychonautModel>.from(
      listaPsychonauts.map((data) => PsychonautModel.fromJsonMap(data)));
    psychonauts.addAll(psychonautsModel);
    cargando = false;
    update();
  }

  Future buscarPsychonaut(String query) async {
    final respuesta = await request.httpGet(
      url: "https://psychonauts-api.herokuapp.com/api/characters", query: {"gender": query});
    final listaPsychonauts = respuesta.body;
    final psychonautsModel = List<PsychonautModel>.from(
      listaPsychonauts.map((x)=>PsychonautModel.fromJsonMap(x)));
    psychonautsSearch = psychonautsModel;
    update();
  }
}