class Besoins {
  String? name;
  
 
 

  Besoins({
    this.name,
    
    
    
    });

 factory Besoins.fromJson(Map<String, dynamic> json){
  return Besoins(
    
         name:json['name'],
         
         
         );}

}