import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall_app/home/provider/home_provider.dart';
import 'package:mirror_wall_app/utils/share_helper.dart';
import 'package:mirror_wall_app/widget/bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../widget/show_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  InAppWebViewController? inAppWebViewController;
  TextEditingController? txtUrl = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("My Browser"),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: InkWell(
                      onTap: () {
                        bookMarkSheet(context);
                      },
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.bookmark_add_outlined),
                            Text("All BookMark")
                          ]),
                    ),
                  ),
                  PopupMenuItem(
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => ShowDialog(),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.screen_search_desktop_rounded),
                          Text("Search Engine")
                        ],
                      ),
                    ),
                  ),
                ];
              },
            ),
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
                          onPressed: () async {
                            String uri =( await inAppWebViewController!.getUrl()).toString();
                            context.read<HomeProvider>().bookMarkData!.add(uri);
                            ShareHelper shareHelper = ShareHelper();
                            await shareHelper.setBookMark(context.read<HomeProvider>().bookMarkData!);

                             context.read<HomeProvider>().getBookMark();

                          },
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
