import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../widgets/loading/custom_loading_api.dart';

// ignore: must_be_immutable
class WebPaymentScreen extends StatelessWidget {
  WebPaymentScreen({super.key, required this.title, required this.url});

  final String title, url;

  late InAppWebViewController webViewController;
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.primaryColor,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          title.tr,
          style: CustomStyle.appbarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    String paymentUrl = url;

    return Stack(
      children: [
        InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(paymentUrl)),
          onWebViewCreated: (controller) {
            webViewController = controller;
            controller.addJavaScriptHandler(
              handlerName: 'jsHandler',
              callback: (args) {
                // Handle JavaScript messages from WebView
              },
            );
          },
          onLoadStart: (controller, url) {
            isLoading.value = true;
          },
          onLoadStop: (controller, url) {
            isLoading.value = false;
          },
          // ... other callbacks ...
        ),
        ValueListenableBuilder<bool>(
          valueListenable: isLoading,
          builder: (context, isLoading, _) {
            return isLoading
                ? const Center(child: CustomLoadingAPI())
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
