class UserModel {
  String name;
  String image;

  UserModel({required this.name, required this.image});


  factory UserModel.onChangePhoto(UserModel user,String path){
    return UserModel(name: user.name, image:path );
  }
  factory UserModel.onchangeName(UserModel user,String name){
    return UserModel(name:name, image:user.image );
  }
}