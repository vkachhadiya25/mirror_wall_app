import 'package:flutter/material.dart';
import 'package:mirror_wall_app/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

void alertDialog (BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return Consumer<HomeProvider>(
            builder: (context, HomeProvider, browser) {
          return AlertDialog(
            title: const Text("Search Engine"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile(
                  value: "Google",
                  groupValue: HomeProvider.browser,
                  title: const Text("Google"),
                  onChanged: (value) {
                    HomeProvider.setBrowser(value.toString());
                  },
                ),
                RadioListTile(
                  value: "Bing",
                  groupValue: HomeProvider.browser,
                  onChanged: (value) {
                    HomeProvider.setBrowser(value.toString());
                  },
                  title: const Text("Bing"),
                ),
                RadioListTile(
                  value: "Yahoo",
                  groupValue: HomeProvider.browser,
                  onChanged: (value) {
                    HomeProvider.setBrowser(value.toString());
                  },
                  title: const Text("Yahoo"),
                ),
                RadioListTile(
                  value: "DuckDuckGo",
                  groupValue: HomeProvider.browser,
                  onChanged: (value) {
                    HomeProvider.setBrowser(value.toString());
                  },
                  title: const Text("DuckDuckGo"),
                ),
              ],
            ),
          );
        });
      });
}
