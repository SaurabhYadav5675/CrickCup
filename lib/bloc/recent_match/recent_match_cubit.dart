import 'dart:async';

import 'package:crick_cup/bloc/recent_match/recent_match_state.dart';
import 'package:crick_cup/utilities/api_endpoint.dart';
import 'package:crick_cup/utilities/network_helper/http_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentMatchCubit extends Cubit<RecentMatchState> {
  RecentMatchCubit() : super(const RecentMatchState());

  FutureOr<void> fetchRecentMatch() async {
    final response = await HttpService().get(ApiUrl.recentMatches);
    if (response != null) {
      final result = await compute(RecentMatch.fromJson, response);
      emit(state.copyWith(matchData: result, isLoading: false));
    }
  }
}
