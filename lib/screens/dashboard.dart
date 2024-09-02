import 'package:crick_cup/bloc/recent_match/recent_match_cubit.dart';
import 'package:crick_cup/bloc/recent_match/recent_match_state.dart';
import 'package:crick_cup/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    context.read<RecentMatchCubit>().fetchRecentMatch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentMatchCubit, RecentMatchState>(
        builder: (ctx, state) {
      if (state.isLoading) {
        return Container();
      } else {
        return Container();
      }
    });
  }
}
