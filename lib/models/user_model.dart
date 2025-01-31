class UserModel{
 
  String? email;
  String? id;
  String ? name;
  int? createdAt;

  UserModel({required this.email, required this.id,required this.name,required this.createdAt});
  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
    name = json['name'];
    createdAt = json['createdAt'];
  }
  Map<String, dynamic> toJson(){
    return {
      'email': email,
      'id': id,
      'name': name,
      'createdAt': createdAt,
    };
  }

  
}