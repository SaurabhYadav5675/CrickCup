import 'package:crick_cup/bloc/recent_match/recent_match_cubit.dart';
import 'package:crick_cup/bloc/recent_match/recent_match_state.dart';
import 'package:crick_cup/constants/app_colors.dart';
import 'package:crick_cup/widgets/app_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/recent_match/type_matches.dart';

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
            return const AppLoader();
          } else {
            return state.matchData?.typeMatches != null
                ? Scaffold(
              backgroundColor: AppColors.primaryColors.offWhite,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    for (TypeMatches? matches
                    in (state.matchData!.typeMatches) ?? []) ...[
                      if (matches != null) ...[
                        getMatches(matches.matchType.toString(),
                            matches.seriesMatches),
                      ]
                    ]
                  ],
                ),
              ),
            )
                : const SizedBox();
          }
        });
  }

  Widget getMatches(String type, List<SeriesMatches>? matches) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type,
          style: TextStyle(
              fontSize: 16, color: AppColors.primaryColors.oliveGreen),
        ),
        const SizedBox(
          height: 10,
        ),
        if (matches != null) ...[
          SizedBox(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: matches.length,
                      itemBuilder: (item, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(10)),
                          child:Container(),
                        );
                      }),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ]
      ],
    );
  }
}
