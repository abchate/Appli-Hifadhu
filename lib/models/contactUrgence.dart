class contactModel {
  String? name;
  String? phone;
  String? date;
  
  contactModel({
    this.name,
    this.phone,
    this.date
    
    
    });

 factory contactModel.fromJson(Map<String, dynamic> json){
  return contactModel(
    
         name:json['name'],
         phone: json["phone"],
         date: json["created"]
         
         
         );}

}