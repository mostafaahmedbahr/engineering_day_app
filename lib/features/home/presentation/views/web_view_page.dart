import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    // #docregion webview_controller
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          // onNavigationRequest: (NavigationRequest request) {
            // if (request.url.startsWith('https://kauengday.mftcevents.com/newsletter/qr_reader/self_attend/very_secret/')) {
            //   return NavigationDecision.prevent;
            // }
            // return NavigationDecision.navigate;
          // },
        ),
      )
      ..loadRequest(Uri.parse('https://kauengday.mftcevents.com/newsletter/qr_reader/self_attend/very_secret/'));
    // #enddocregion webview_controller
  }

  // #docregion webview_widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan qr')),
      body: WebViewWidget(controller: controller),
    );
  }
// #enddocregion webview_widget
}