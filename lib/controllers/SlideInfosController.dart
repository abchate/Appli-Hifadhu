import 'package:app_hifadhu/customs/image_url.dart';
import 'package:app_hifadhu/models/infos/SlideInfosModel.dart';

class GetInfos {
  static Future select() async {
    // Récuperation des informations depuis la base de données
    List<SlideInfoModel> infos = [
      SlideInfoModel("Tous contre la violence", "Contenu de cette informations",
          ImageRoute,"2508" ,"14-04-2022", "cyan"),
      SlideInfoModel("Tous contre la violence", "Contenu de cette informations",
          Shake, "2004","14-04-2022", "cyan"),
      SlideInfoModel("Tous contre la violence", "Contenu de cette informations",
          ImageTree,"1840", "14-04-2022", "cyan"),
      SlideInfoModel("Tous contre la violence", "Contenu de cette informations",
          ImageTwo,"1038", "14-04-2022", "cyan"),
      SlideInfoModel("Tous contre la violence", "Contenu de cette informations",
          ImageCard, "746","14-04-2022", "cyan"),
     ];

    return infos;
  }
}
