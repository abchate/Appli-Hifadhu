class emergencyModel {
  String? category;
  String? situation;
  String? date;
  
  emergencyModel({
    this.category,
    this.situation,
    this.date
    
    
    });

 factory emergencyModel.fromJson(Map<String, dynamic> json){
  return emergencyModel(
    
         category:json['category'],
         situation: json["situation"],
         date: json["created"]
         
         
         );}

}