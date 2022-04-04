import 'package:examen_3er_parcial/controllers/psychonaut_controller.dart';
import 'package:examen_3er_parcial/widgets/card_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchByGender extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // Cosas para poner a la derecha de la barra
    return [
      IconButton(
        onPressed: () => query="", 
        icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Cosa para poner a la izquierda de la barra
    return IconButton(
      onPressed: () => Navigator.pop(context), 
      icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Get.find<PsychonautController>().buscarPsychonaut(query);
    // TODO: implement buildSuggestions
    return GetBuilder<PsychonautController>(
      builder: (controller) {
        return (query != "") ? ListView.builder(
          itemCount: controller.psychonautsSearch.length,
          itemBuilder: (context, i){
            final psychonaut = controller.psychonautsSearch[i];
            return ListTile(
              onTap: (){ 
                controller.psychonaut = psychonaut;
                Navigator.pushNamed(context, "/detalles/psychonaut"); 
              },
                title: Text(psychonaut.name!),
                leading: CircleAvatar(radius:20, backgroundImage:NetworkImage(psychonaut.img!)),
                subtitle: Text(psychonaut.id!, style: const TextStyle(overflow: TextOverflow.clip)),
              );
          }): const Center(
            child: Text("..."),
          );
      }
    );
  }
  
}