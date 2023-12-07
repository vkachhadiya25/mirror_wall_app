import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirror_wall_app/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

void bookMarkSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: MediaQuery.sizeOf(context).height * 1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("https://www.google.com/search?q ${context.read<HomeProvider>().bookMarkData!}"),
            );
          },
        ),
      );
    },
  );
}
