import 'package:examen_3er_parcial/models/psychonaut_model.dart';
import 'package:flutter/material.dart';

class CardWidgetTile extends StatelessWidget {
  final String? psychonautGender;
  final String? psychonautImg;
  final String? psychonautId;
  final String? psychonautName;
  
  const CardWidgetTile({
    this.psychonautGender,
    this.psychonautImg,
    this.psychonautId,
    this.psychonautName,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> genderStyles = (psychonautGender == "male") ? 
    {"color": Colors.blue,
      "icon": Icons.male} : 
    {"color": Colors.pink,
      "icon": Icons.female};
    const textStyles = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 15,
      overflow: TextOverflow.clip
    );
    return Card(
      margin: const EdgeInsets.all(10),
      color: const Color.fromRGBO(51, 123, 109, 1),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 1.5),
            child: FadeInImage(
                placeholder: const AssetImage("assets/img/loading.gif"), 
                image: NetworkImage(psychonautImg!),
                height: 120, width: 100 
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 100,
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Text("Name: $psychonautName", style: textStyles,),
                Row(
                  children: [
                    const Text("Gender: ", style: textStyles),
                    Icon(genderStyles["icon"],color: genderStyles["color"], size: 30),
                  ],
                ),
                Text("Id: $psychonautId", style: textStyles,)
              ],
            ),
          )
        ]
      ),
    );
  }
}