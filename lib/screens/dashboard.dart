import 'package:crick_cup/bloc/recent_match/recent_match_cubit.dart';
import 'package:flutter/cupertino.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    RecentMatchCubit().fetchRecentMatch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
