class numeroUrgence {
  String? name;
  String? phone;
  
  numeroUrgence({
    this.name,
    this.phone
    
    
    });

 factory numeroUrgence.fromJson(Map<String, dynamic> json){
  return numeroUrgence(
    
         name:json['name'],
         phone: json["phone"]
         
         
         );}

}