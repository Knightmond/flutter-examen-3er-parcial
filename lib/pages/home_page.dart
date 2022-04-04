import 'package:examen_3er_parcial/controllers/psychonaut_controller.dart';
import 'package:examen_3er_parcial/search/search_by_gender.dart';
import 'package:examen_3er_parcial/widgets/card_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final controller = Get.find<PsychonautController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 19, 17, 1),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              showSearch(
                context: context, 
                delegate: SearchByGender()
              );
            }, 
            icon: const Icon(Icons.search),
            tooltip: "Buscar Psychonaut",
          ),
          const SizedBox(width: 30)
        ],
        title: const Text("Galería de Psychonauts"),
        backgroundColor: const Color.fromRGBO(37, 90, 79, 1),
      ),
      body: GetBuilder<PsychonautController>(
        builder: (controller) {
          return(controller.cargando == true) ?
            const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
            clipBehavior: Clip.none,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 600,
              mainAxisExtent: 200,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15
            ),
            itemCount: controller.psychonauts.length, 
            itemBuilder: (context, i) {
              final psychonaut = controller.psychonauts[i];
              return GestureDetector(
                onTap: () {
                  controller.psychonaut = psychonaut;
                  Navigator.pushNamed(context, "/detalles/psychonaut");
                },
                child: CardWidgetTile(
                  psychonautGender: psychonaut.gender,
                  psychonautId: psychonaut.id,
                  psychonautImg: psychonaut.img,
                  psychonautName: psychonaut.name,
                ),

              );
            },
          );
        }
      ),
    );
  }
}