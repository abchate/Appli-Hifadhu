class publicationModel {
    
  int? id;
  String? name;
  String? type;
  int? likes;
  String? text;
  int? vues;
  String? created;
  
  publicationModel({
     this.id,
    this.name,
    this.type,
    this.likes,
    this.vues,
    this.text, 

    this.created
    
    
    });

//  factory publicationModel.fromJson(Map<String, dynamic> json){
//   return publicationModel(
    
//          category:json['category'],
//          situation: json["situation"],
//          date: json["created"]
         
         
//          );}

 }