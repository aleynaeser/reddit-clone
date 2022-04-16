import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';

Widget buildTop() {
  return Builder(builder: (context) {
    return Padding(
      padding: const EdgeInsets.only(right: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconTheme(
            data: Theme.of(context).copyWith().iconTheme,
            child: IconButton(
              icon: const Icon(
                Icons.menu_rounded,
              ),
              onPressed: () {},
            ),
          ),
          buildSearch(),
          Image.network(
            redditProfile,
            height: 40,
          ),
        ],
      ),
    );
  });
}

Widget buildSearch() {
  return Builder(builder: (context) {
    return Container(
        height: 40,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.06),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          IconTheme(
            data: Theme.of(context).copyWith().iconTheme,
            child: const Icon(
              Icons.search,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: grey,
                ),
              ),
              cursorColor: blue,
            ),
          ),
        ]));
  });
}
