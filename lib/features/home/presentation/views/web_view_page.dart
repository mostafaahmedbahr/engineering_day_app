// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:engineering_day_app/core/shared_widgets/custom_loading.dart';
import 'package:engineering_day_app/core/utils/download_helper/download_helper.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../../../auth/login/presentation/view_model/login_provider.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
    WebViewController? controllers;

  Future<void> getController() async {
    await checkPermission();

    late final PlatformWebViewControllerCreationParams params;
    params = WebViewPlatform.instance is WebKitWebViewPlatform
        ? WebKitWebViewControllerCreationParams(
            allowsInlineMediaPlayback: true,
            mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{})
        : const PlatformWebViewControllerCreationParams();

    final controller = WebViewController.fromPlatformCreationParams(
      params,
      onPermissionRequest: (request) {
        checkPermission();
        request.grant();
      },
    );
    await controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    await controller.loadRequest(
        Uri.parse(
            "https://kauengday.mftcevents.com/newsletter/qr_reader/self_attend/very_secret/"),
        headers: {
          'Authorization': 'Bearer ${currentUser.value.access}',
        });

    controllers = controller;
    setState(() {});
    // return controller;
  }

  @override
  void initState() {
    super.initState();

    getController();
    // // #docregion webview_controller
    // controller = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..setBackgroundColor(const Color(0x00000000))
    //   ..setNavigationDelegate(
    //     NavigationDelegate(
    //       onProgress: (int progress) {
    //         // Update loading bar.
    //       },
    //       onPageStarted: (String url) {},
    //       onPageFinished: (String url) {},
    //       onWebResourceError: (WebResourceError error) {},
    //       // onNavigationRequest: (NavigationRequest request) {
    //       // if (request.url.startsWith('https://kauengday.mftcevents.com/newsletter/qr_reader/self_attend/very_secret/')) {
    //       //   return NavigationDecision.prevent;
    //       // }
    //       // return NavigationDecision.navigate;
    //       // },
    //     ),
    //   )
    //   ..loadRequest(Uri.parse(
    //       'https://kauengday.mftcevents.com/newsletter/qr_reader/self_attend/very_secret/'),
    //
    //
    //   headers: {
    //     'Authorization': 'Bearer ${currentUser.value.access}',
    //   }
    //   );

    // #enddocregion webview_controller
  }

  // #docregion webview_widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan qr')),
      body: controllers == null
          ? const Center(
              child: CustomLoading(),
            )
          : WebViewWidget(controller: controllers!),
    );
  }
// #enddocregion webview_widget
}
