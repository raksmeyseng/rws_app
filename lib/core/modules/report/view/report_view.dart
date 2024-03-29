import 'package:flutter/material.dart';
import 'package:rws_app/constants/app_constant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:rws_app/translation/generated/l10n.dart';

import '../../../widgets/flat_card.dart';
import '../../../widgets/text_widget.dart';

class ReportView extends StatelessWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> reportTitle = [
      S.of(context).water_supply_detail_report,
      S.of(context).water_supply_coverage_report_by_type,
      S.of(context).water_supply_coverage_report,
      S.of(context).water_support_report_on_map
    ];
    List<String> reportUrls = [
      '${AppConstant.defaultURL}km/watersupply/reportwellbyprovince/token/',
      '${AppConstant.defaultURL}km/report/wellsumbyprovince/token/',
      '${AppConstant.defaultURL}km/watersupply/reportwatersupplycoverage/token/',
      '${AppConstant.defaultURL}km/report/coverage_by_map/token/',
    ];
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('របាយការណ៍'),
      // ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        itemBuilder: (context, index) {
          return _WaterSupplyItem(
              title: reportTitle[index], url: reportUrls[index]);
        },
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemCount: reportTitle.length,
      ),
    );
  }
}

class _WaterSupplyItem extends StatelessWidget {
  const _WaterSupplyItem({Key? key, required this.title, required this.url})
      : super(key: key);

  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FlatCard(
      onTap: () {
        //_launchURL(url);
        openUrl(url);
        // context.goNamed(
        //   AppRoute.reportDetail,
        //   extra: {

        //     'url': url,
        //   },
        // );
      },
      borderRadius: 16.0,
      side: BorderSide(
        width: 1.5,
        color: Theme.of(context).dividerColor.withOpacity(0.1),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(title.toString(), height: 1.8),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16.0),
        ],
      ),
    );
  }

  launchURL(String url1) async {
    //  if (!await launchUrl(url)) {
    //       throw Exception('Could not launch $url');
    //   }
    var urllaunchable =
        await canLaunchUrlString(url1); //canLaunch is from url_launcher package
    if (urllaunchable) {
      await launchUrlString(
          url1); //launch is from url_launcher package to launch URL
    } else {
      print("URL can't be launched.");
    }
  }

  Future<void> openUrl(String url) async {
    final url0 = Uri.parse(url);
    if (!await launchUrl(url0, mode: LaunchMode.externalApplication)) {
      // <--
      throw Exception('Could not launch $url0');
    }
  }

// enum LaunchMode {
//   /// Leaves the decision of how to launch the URL to the platform
//   /// implementation.
//
// ,

//   /// Loads the URL in an in-app web view (e.g., Safari View Controller).
//   inAppWebView,

//   /// Passes the URL to the OS to be handled by another application.
//   externalApplication,

//   /// Passes the URL to the OS to be handled by another non-browser application.
//   externalNonBrowserApplication,
// }
}
