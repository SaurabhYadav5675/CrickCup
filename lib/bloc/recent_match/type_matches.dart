import 'package:crick_cup/bloc/recent_match/match_score.dart';

import 'match_info.dart';

class TypeMatches {
  TypeMatches({
    this.matchType,
    this.seriesMatches,
  });

  TypeMatches.fromJson(dynamic json) {
    matchType = json['matchType'];
    if (json['seriesMatches'] != null) {
      seriesMatches = [];
      json['seriesMatches'].forEach((v) {
        seriesMatches?.add(SeriesMatches.fromJson(v));
      });
    }
  }

  String? matchType;
  List<SeriesMatches>? seriesMatches;

  TypeMatches copyWith({
    String? matchType,
    List<SeriesMatches>? seriesMatches,
  }) =>
      TypeMatches(
        matchType: matchType ?? matchType,
        seriesMatches: seriesMatches ?? seriesMatches,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['matchType'] = matchType;
    if (seriesMatches != null) {
      map['seriesMatches'] = seriesMatches?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class SeriesMatches {
  SeriesMatches({
    this.seriesAdWrapper,
  });

  SeriesMatches.fromJson(dynamic json) {
    seriesAdWrapper = json['seriesAdWrapper'] != null
        ? SeriesAdWrapper.fromJson(json['seriesAdWrapper'])
        : null;
  }

  SeriesAdWrapper? seriesAdWrapper;

  SeriesMatches copyWith({
    SeriesAdWrapper? seriesAdWrapper,
  }) =>
      SeriesMatches(
        seriesAdWrapper: seriesAdWrapper ?? this.seriesAdWrapper,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (seriesAdWrapper != null) {
      map['seriesAdWrapper'] = seriesAdWrapper?.toJson();
    }
    return map;
  }
}

class SeriesAdWrapper {
  SeriesAdWrapper({
    this.seriesId,
    this.seriesName,
    this.matches,
  });

  SeriesAdWrapper.fromJson(dynamic json) {
    seriesId = json['seriesId'];
    seriesName = json['seriesName'];
    if (json['matches'] != null) {
      matches = [];
      json['matches'].forEach((v) {
        matches?.add(Matches.fromJson(v));
      });
    }
  }

  late final num? seriesId;
  late final String? seriesName;

  List<Matches>? matches;

  SeriesAdWrapper copyWith({
    num? seriesId,
    String? seriesName,
    List<Matches>? matches,
  }) =>
      SeriesAdWrapper(
        seriesId: seriesId ?? this.seriesId,
        seriesName: seriesName ?? this.seriesName,
        matches: matches ?? this.matches,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['seriesId'] = seriesId;
    map['seriesName'] = seriesName;
    if (matches != null) {
      map['matches'] = matches?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Matches {
  const Matches({
    this.matchInfo,
    this.matchScore,
  });

  final MatchInfo? matchInfo;
  final MatchScore? matchScore;

  factory Matches.fromJson(dynamic json) {
    return Matches(
        matchInfo: json['matchInfo'] != null
            ? MatchInfo.fromJson(json['matchInfo'])
            : null,
        matchScore: json['matchScore'] != null
            ? MatchScore.fromJson(json['matchScore'])
            : null);
  }

  Matches copyWith({
    MatchInfo? matchInfo,
    MatchScore? matchScore,
  }) =>
      Matches(
        matchInfo: matchInfo ?? this.matchInfo,
        matchScore: matchScore ?? this.matchScore,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (matchInfo != null) {
      map['matchInfo'] = matchInfo?.toJson();
    }
    if (matchScore != null) {
      map['matchScore'] = matchScore?.toJson();
    }
    return map;
  }
}
