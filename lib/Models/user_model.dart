// ignore_for_file: unnecessary_null_comparison

class UserModel {
  String? name, email, userId, pic, selectedItem;

  UserModel({
    this.email,
    this.selectedItem,
    this.name,
    this.pic,
    this.userId,
  });
  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    email = map['email'];
    selectedItem = map['selectedItem'];

    pic = map['pic'];
    userId = map['userId'];
  }
  toJson() {
    return {
      'name': name,
      'email': email,
      'selectedItem': selectedItem,
      'pic': pic,
      'userId': userId,
    };
  }
}
