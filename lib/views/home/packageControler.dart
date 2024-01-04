// import 'package:get/get.dart';
// import 'package:in_app_update/in_app_update.dart';
// import 'package:package_info_plus/package_info_plus.dart';
// import 'package:unicitizen/widgets/appUpdate.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:new_version_plus/new_version_plus.dart';

// class Package_update extends GetxController implements GetxService {
//   PackageInfo? packageInfo;
//   AppUpdateInfo? _updateInfo;
//   String version = "";
//   int buildnumber = 0;
//   void packageinfo() async {
//     final info = await PackageInfo.fromPlatform();
//     packageInfo = info;
//     version = packageInfo!.version.toString();
//     buildnumber = int.parse(info.buildNumber.toString());
//     print("package" +
//         packageInfo!.version.toString() +
//         "  " +
//         packageInfo!.appName.toString() +
//         "  " +
//         info.buildNumber.toString());
//     checkinfo();
//   }

//   void checkinfo() async {
//     final status = await NewVersionPlus().getVersionStatus();
//     print("ss    ${status!.storeVersion}  ${status.canUpdate}");
//     if (status.canUpdate) {
//       Get.offAll(Custome_AppUpdate());
//     }
//   }

//   Future<void> UpdatePlayStore() async {
//     if (int.parse(_updateInfo!.availableVersionCode.toString()) >
//         int.parse(buildnumber.toString())) {
//       print("Available" +
//           _updateInfo!.updateAvailability.toString() +
//           "\n" +
//           UpdateAvailability.updateAvailable.toString());
//     } else {
//       return;
//     }
//   }

//   void launchAppStore() async {
//     var url =
//         "https://play.google.com/store/apps/details?id=com.app.unicitizen";
//     if (await canLaunch(url) == null) {
//       throw 'Could not launch $url';
//     } else {
//       await launch(url);
//     }
//   }
// }
