import 'package:url_launcher/url_launcher.dart';

import '../components/my_components.dart';
import '../models/portfolio_menu_model.dart';

class PortfolioController {
  static Future<PortfolioDatum> getPortfolioData() async {
    final String response = portfolioDatumToJson(portfolioMapDatum);
    PortfolioDatum value = portfolioDatumFromJson(response);
    return value;
  }

  static Future<void> toSendMailer(
      {required String mailAddress,
      Map<String, dynamic>? queryParameters}) async {
    final Uri urilaunch = Uri(
        scheme: 'mailto', path: mailAddress, queryParameters: queryParameters);
    await launchUrl(urilaunch);
  }

  static Future<void> toMakeCaller({required String mobileNumber}) async {
    final Uri urilaunch = Uri(scheme: 'tel', path: mobileNumber);
    await launchUrl(urilaunch);
  }

  static Future<void> openUrlLauncher({required String siteUri}) async {
    final Uri urilaunch = Uri.parse(siteUri);
    await launchUrl(urilaunch);
  }
}
