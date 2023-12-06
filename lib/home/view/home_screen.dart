import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  InAppWebViewController? inAppWebViewController;
  TextEditingController? txtUrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("My Browser"),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
          ],
        ),
        body: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(
                  url: Uri.parse(
                      "https://www.google.com/webhp?hl=en&sa=X&ved=0ahUKEwi5n-3I4vqCAxV64TgGHSDfDwMQPAgJ")),
              onLoadError: (controller, url, code, message) {
                inAppWebViewController = controller;
              },
              onLoadStop: (controller, url) {
                inAppWebViewController = controller;
              },
              onLoadStart: (controller, url) {
                inAppWebViewController = controller;
              },
              onProgressChanged: (controller, progress) {
                inAppWebViewController = controller;
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.17,
                color: Colors.grey.shade100,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: txtUrl,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "Search or type web address",
                          suffixIcon: IconButton(
                              onPressed: () {
                                inAppWebViewController?.loadUrl(
                                    urlRequest: URLRequest(
                                        url: Uri.parse(
                                            "https://www.google.com/search?q=${txtUrl!.text}")));
                              },
                              icon: const Icon(Icons.search_rounded)),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            inAppWebViewController?.loadUrl(
                                urlRequest: URLRequest(
                                    url: Uri.parse(
                                        "https://www.google.com/webhp?hl=en&sa=X&ved=0ahUKEwi5n-3I4vqCAxV64TgGHSDfDwMQPAgJ")));
                          },
                          icon: const Icon(Icons.home),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_add_outlined),
                        ),
                        IconButton(
                          onPressed: () {
                            inAppWebViewController!.goBack();
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_outlined),
                        ),
                        IconButton(
                          onPressed: () {
                            inAppWebViewController!.reload();
                          },
                          icon: const Icon(Icons.refresh),
                        ),
                        IconButton(
                          onPressed: () {
                            inAppWebViewController!.goForward();
                          },
                          icon: const Icon(Icons.arrow_forward_ios_outlined),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
