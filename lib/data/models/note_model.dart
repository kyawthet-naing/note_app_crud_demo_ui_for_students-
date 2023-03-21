class NoteModel {
  String? id;
  String? title;
  String? desc;

  NoteModel({this.id, this.title, this.desc});

  NoteModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        title = json['title'] as String?,
        desc = json['desc'] as String?;

  Map<String, dynamic> toJson() => {"title": title, "desc": desc, "id": id};
}

/*
void main() {
  var wooCar = {"car_engine_sound": "Wooo..wooo..woooooo"};
  var puCar = {"car_engine_sound": "pu..pu..boooooo"};
  var car1 = Car.drive(puCar);
  var car2 = Car.drive(wooCar);
  print(car1.carEngineSound);
  print(car2.carEngineSound);
  print(Car(carEngineSound: "T...T...woo...").toJson());
}

class Car {
  String? carEngineSound;
  Car({this.carEngineSound});

  Car.drive(Map<String, dynamic> json)
      : carEngineSound = json["car_engine_sound"] as String?;

  toJson() => {"car_engine_sound": carEngineSound};
}
*/

// {
//   "title": "Title Updated",
//   "desc": "Desc",
//   "id": "1"
// }
