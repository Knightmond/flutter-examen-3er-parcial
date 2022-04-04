import 'package:examen_3er_parcial/controllers/power_color_switch.dart';
import 'package:examen_3er_parcial/controllers/psychonaut_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetallesPsychonaut extends StatelessWidget {
  DetallesPsychonaut({Key? key}) : super(key: key);

  final detallesController = Get.find<PsychonautController>();
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> genderStyles = (detallesController.psychonaut.gender == "male") ? 
    {"color": Colors.blue,
      "icon": Icons.male} : 
    {"color": Colors.pink,
      "icon": Icons.female};
    const textStyles = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 19, 17, 1),
      appBar: AppBar(
        title: const Text("Detalles psychonaut"),
        backgroundColor: const Color.fromRGBO(37, 90, 79, 1),
      ),
      body: GetBuilder<PsychonautController>(
        builder: (detallesController) => Column(
          children: [
            Image.network(detallesController.psychonaut.img!, height: 250, width: 210),
            Text(detallesController.psychonaut.name!, style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 35
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Gender: ${detallesController.psychonaut.gender!}", style: textStyles),
                Icon(genderStyles["icon"],color: genderStyles["color"], size: 30)
              ]
            ),
            Text("Id: ${detallesController.psychonaut.id}", style: textStyles),
            const SizedBox(height: 10),
            (detallesController.psychonaut.psiPowers!.isNotEmpty) ?
            Flexible(
              child: ListView.builder(
                itemBuilder: (context, i) {
                  final power = detallesController.psychonaut.psiPowers;
                  final Color bgColor = PowerColorSwitch().setColorForPower(power![i].powerName!);
                  return Card(
                    color: bgColor,
                    child: ListTile(
                      leading: Image.network(power[i].icon!, height: 50, width: 50),
                      title: Text(power[i].powerName!, style: textStyles,),
                      subtitle: Column(children: [
                        Text(power[i].description!, style: textStyles),
                        Text("Id: ${power[i].powerId!}", style: textStyles)
                      ]),
                      isThreeLine: true,
                    ),
                  );
                },
                itemCount: detallesController.psychonaut.psiPowers!.length,
              ),
            ): const SizedBox(height: 30, child: Text("This psychonaut has no powers ='(", style: textStyles))
          ],
        )
      ),
    );
  }
}