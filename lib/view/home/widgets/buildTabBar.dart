import 'package:flutter/material.dart';
import 'package:reddit_clone/core/utils/constants.dart';

TabBar buildTapBar(TabController _tabController) {
  return TabBar(
    unselectedLabelColor: grey,
    labelColor: black,
    indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(color: blue),
        insets: EdgeInsets.symmetric(horizontal: 70.0)),
    tabs: const [
      Tab(
        text: 'Home',
      ),
      Tab(
        text: 'Popular',
      )
    ],
    controller: _tabController,
    indicatorSize: TabBarIndicatorSize.tab,
  );
}
