import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/view/home/widgets/buildTabBar.dart';

import '../../../core/utils/constants.dart';
import '../widgets/buildRedditCards.dart';
import '../widgets/buildTop.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildHomeTop(context, _tabController),
            Expanded(
              child: TabBarView(
                children: const [
                  BuildRedditCards(),
                  Center(child: Text('Popular')),
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container buildHomeTop(BuildContext context, TabController _tabController) {
  return Container(
      width: MediaQuery.of(context).size.width,
      height: 110,
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          buildTop(),
          Container(
              width: MediaQuery.of(context).size.width / 2.2,
              child: buildTapBar(_tabController)),
        ],
      ));
}
