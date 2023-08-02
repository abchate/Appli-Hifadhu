class histories {
  int? id;
  String? name;
  String? type;
  int? likes;
  String? text;
  int? vues;
  String? created;

  histories({
    this.id,
    this.name,
    this.type,
    this.likes,
    this.vues,
    this.text, 

    this.created
    });

   histories.fromJson(Map json)
  : type = json['type_violence'],
    text= json['description'],
    created = json['created'];

  

}