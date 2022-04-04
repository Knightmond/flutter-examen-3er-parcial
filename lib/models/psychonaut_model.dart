class PsychonautModel {
  String? gender;
  String? img;
  String? id;
  String? name;
  List<PsiPower>? psiPowers;

  PsychonautModel({this.gender, this.img, this.id, this.name, this.psiPowers});

  factory PsychonautModel.fromJsonMap(Map<String, dynamic> data) {
    return PsychonautModel(
      gender: data["gender"],
      img: data["img"],
      id: data["_id"],
      name: data["name"],
      psiPowers: List<PsiPower>.from(
          data["psiPowers"].map((x) => PsiPower.fromJsonMap(x))));
  }
}

class PsiPower {
  String? description;
  String? icon;
  String? powerId;
  String? powerName;

  PsiPower({this.description, this.icon, this.powerId, this.powerName});

  factory PsiPower.fromJsonMap(Map<String, dynamic> data) => PsiPower(
      description: data["description"],
      icon: data["img"],
      powerId: data["_id"],
      powerName: data["name"]);
}
