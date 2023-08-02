class loginInfo {
  int? id;
  String? phoneNumber;
  String? created;

  loginInfo({this.id, this.phoneNumber, this.created});


 factory loginInfo.fromJson(Map<String, dynamic> json){
  return loginInfo(
    
         id:json['id'],
         phoneNumber:json['phoneNumber'],
         created:json['created'],
         
         
         );}

}