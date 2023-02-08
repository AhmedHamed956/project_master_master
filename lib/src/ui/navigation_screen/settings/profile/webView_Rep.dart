import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/src/ui/components/appar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

// void _launchURL() async {
//   const url = 'https://biflora.bluecode.sa/reg-representative';
//   final uri = Uri.parse(url);
//   if (await canLaunchUrl(uri)) {
//     await launchUrl(uri);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: WebView(
      initialUrl: 'https://biflora.bluecode.sa/reg-representative',
      javascriptMode: JavascriptMode.unrestricted,
    ));
  }
}
