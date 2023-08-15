import 'package:website/application/strings/app_contents.dart';
import 'package:website/domain/model/app_model.dart';

class AppRepository {
  Future<List<AppModel>> fetchApps() async {
    return [
      AppModel(
        id: 1,
        appName: AppContents.shelfMuslimName,
        appDescription: AppContents.shelfMuslimDescription,
        qrAppStore: AppContents.shelfMuslumQrAS,
        qrGooglePlay: AppContents.shelfMuslimQrGP,
        linkAppStore: AppContents.shelfMuslumLinkAS,
        linkGooglePlay: AppContents.shelfMuslimLinkGP,
      ),
      AppModel(
        id: 2,
        appName: AppContents.fortressName,
        appDescription: AppContents.fortressDescription,
        qrAppStore: AppContents.fortressQrAS,
        qrGooglePlay: AppContents.fortressQrGP,
        linkAppStore: AppContents.fortressLinkAS,
        linkGooglePlay: AppContents.fortressLinkGP,
      ),
      AppModel(
        id: 3,
        appName: AppContents.sfqName,
        appDescription: AppContents.sfqDescription,
        qrAppStore: AppContents.sfqQrAS,
        qrGooglePlay: AppContents.sfqQrGP,
        linkAppStore: AppContents.sfqLinkAS,
        linkGooglePlay: AppContents.sfqLinkGP,
      ),
      AppModel(
        id: 4,
        appName: AppContents.arabicInName,
        appDescription: AppContents.arabicInDescription,
        qrAppStore: AppContents.arabicInQrAS,
        qrGooglePlay: AppContents.arabicInQrGP,
        linkAppStore: AppContents.arabicInLinkAS,
        linkGooglePlay: AppContents.arabicInLinkGP,
      ),
      AppModel(
        id: 5,
        appName: AppContents.namesOfName,
        appDescription: AppContents.namesOfDescription,
        qrAppStore: AppContents.namesOfQrAS,
        qrGooglePlay: AppContents.namesOfQrGP,
        linkAppStore: AppContents.namesOfLinkAS,
        linkGooglePlay: AppContents.namesOfLinkGP,
      ),
      AppModel(
        id: 6,
        appName: AppContents.hadeethName,
        appDescription: AppContents.hadeethDescription,
        qrAppStore: AppContents.hadeethQrAS,
        qrGooglePlay: AppContents.hadeethQrGP,
        linkAppStore: AppContents.hadeethLinkAS,
        linkGooglePlay: AppContents.hadeethLinkGP,
      ),
      AppModel(
        id: 7,
        appName: AppContents.questionsName,
        appDescription: AppContents.questionsDescription,
        qrAppStore: AppContents.questionsQrAS,
        qrGooglePlay: AppContents.questionsQrGP,
        linkAppStore: AppContents.questionsLinkAS,
        linkGooglePlay: AppContents.questionsLinkGP,
      ),
      AppModel(
        id: 8,
        appName: AppContents.gemsName,
        appDescription: AppContents.gemsDescription,
        qrAppStore: AppContents.gemsQrAS,
        qrGooglePlay: AppContents.gemsQrGP,
        linkAppStore: AppContents.gemsLinkAS,
        linkGooglePlay: AppContents.gemsLinkGP,
      ),
      AppModel(
        id: 9,
        appName: AppContents.replacerName,
        appDescription: AppContents.replacerDescription,
        qrAppStore: AppContents.replacerQrAS,
        qrGooglePlay: AppContents.replacerQrGP,
        linkAppStore: AppContents.replacerLinkAS,
        linkGooglePlay: AppContents.replacerLinkGP,
      ),
    ];
  }
}
