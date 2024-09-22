import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyCustomWebview extends StatefulWidget {
  String? url;

  MyCustomWebview({super.key, this.url});

  @override
  State<MyCustomWebview> createState() => _MyCustomWebviewState();
}

class _MyCustomWebviewState extends State<MyCustomWebview> {
  late WebViewController controller;

  @override
  void initState() {
    controller = WebViewController();
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.loadRequest(Uri.parse('https://www.geeksforgeeks.org'));
    /* ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.geeksforgeeks.org'));*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Simple Example')),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          controller.loadRequest(Uri.parse("https://www.appventurez.com/"));
        });
      }),
      body: WebViewWidget(controller: controller),
    );
  }
}
