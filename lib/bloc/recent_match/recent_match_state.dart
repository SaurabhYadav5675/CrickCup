import 'package:crick_cup/bloc/recent_match/type_matches.dart';
import 'package:equatable/equatable.dart';

class RecentMatchState extends Equatable {
  final RecentMatch? matchData;
  final bool isLoading;

  const RecentMatchState({this.matchData, this.isLoading = true});

  RecentMatchState copyWith({
    RecentMatch? matchData,
    bool? isLoading,
  }) {
    return RecentMatchState(
        matchData: matchData ?? this.matchData,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object?> get props => [matchData, isLoading];
}

class RecentMatch {
  RecentMatch({this.typeMatches, this.filters, this.responseLastUpdated});

  List<TypeMatches>? typeMatches;
  Filters? filters;
  String? responseLastUpdated;

  RecentMatch copyWith({
    List<TypeMatches>? typeMatches,
    Filters? filters,
    String? responseLastUpdated,
  }) =>
      RecentMatch(
        typeMatches: typeMatches ?? this.typeMatches,
        filters: filters ?? this.filters,
        responseLastUpdated: responseLastUpdated ?? this.responseLastUpdated,
      );

  RecentMatch.fromJson(dynamic json) {
    typeMatches = json['typeMatches']
        ?.map((e) => TypeMatches.fromJson(e))
        .whereType<TypeMatches>()
        .toList();
    filters =
        json['filters'] != null ? Filters.fromJson(json['filters']) : null;

    responseLastUpdated = json['responseLastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (typeMatches != null) {
      map['typeMatches'] = typeMatches?.map((v) => v.toJson()).toList();
    }
    if (filters != null) {
      map['filters'] = filters?.toJson();
    }
    map['responseLastUpdated'] = responseLastUpdated;
    return map;
  }
}

class Filters {
  Filters({
    this.matchType,
  });

  Filters.fromJson(dynamic json) {
    matchType =
        json['matchType'] != null ? json['matchType'].cast<String>() : [];
  }

  List<String>? matchType;

  Filters copyWith({
    List<String>? matchType,
  }) =>
      Filters(
        matchType: matchType ?? this.matchType,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['matchType'] = matchType;
    return map;
  }
}
