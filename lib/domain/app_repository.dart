import 'package:website/application/strings/app_contents.dart';
import 'package:website/presentation/desktop/app_model.dart';

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
        appName: AppContents.shelfMuslimName,
        appDescription: AppContents.shelfMuslimDescription,
        qrAppStore: AppContents.shelfMuslumQrAS,
        qrGooglePlay: AppContents.shelfMuslimQrGP,
        linkAppStore: AppContents.shelfMuslumLinkAS,
        linkGooglePlay: AppContents.shelfMuslimLinkGP,
      ),
      AppModel(
        id: 4,
        appName: AppContents.fortressName,
        appDescription: AppContents.fortressDescription,
        qrAppStore: AppContents.fortressQrAS,
        qrGooglePlay: AppContents.fortressQrGP,
        linkAppStore: AppContents.fortressLinkAS,
        linkGooglePlay: AppContents.fortressLinkGP,
      ),
      AppModel(
        id: 5,
        appName: AppContents.shelfMuslimName,
        appDescription: AppContents.shelfMuslimDescription,
        qrAppStore: AppContents.shelfMuslumQrAS,
        qrGooglePlay: AppContents.shelfMuslimQrGP,
        linkAppStore: AppContents.shelfMuslumLinkAS,
        linkGooglePlay: AppContents.shelfMuslimLinkGP,
      ),
      AppModel(
        id: 6,
        appName: AppContents.fortressName,
        appDescription: AppContents.fortressDescription,
        qrAppStore: AppContents.fortressQrAS,
        qrGooglePlay: AppContents.fortressQrGP,
        linkAppStore: AppContents.fortressLinkAS,
        linkGooglePlay: AppContents.fortressLinkGP,
      ),
    ];
  }
}
