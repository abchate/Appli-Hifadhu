class typeAgression {
  String? name;
  String? description;
 
 

  typeAgression({
    this.name,
    this.description,
    
    
    });

 factory typeAgression.fromJson(Map<String, dynamic> json){
  return typeAgression(
    
         name:json['name'],
         description: json['description'],
         
         );}

}