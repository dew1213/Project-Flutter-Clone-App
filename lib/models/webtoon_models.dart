class WebtoonModel {
  String? id;
  String? thumb;
  String? title;
   String? src;
  String? storie;

  WebtoonModel(this.id,this.thumb,this.title,this.src,this.storie);

  WebtoonModel.fromJson(Map<String,dynamic> json)
  {
    id = json["id"];
    title = json["title"];
    thumb = json["thumb"];
    src = json["src"];
    storie = json["storie"];
  }
}
