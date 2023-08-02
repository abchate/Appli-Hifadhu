class UsersInfos {
  String? name;
  String? phone;
  String? blood;
  
  UsersInfos({this.name, this.phone, this.blood});

   factory UsersInfos.fromJson(Map<String, dynamic> json){
  return UsersInfos(
    
         name:json['pseudonyme'],
         phone: json['phoneNumber'],
         blood: json["blood"]
         
         );}

}

