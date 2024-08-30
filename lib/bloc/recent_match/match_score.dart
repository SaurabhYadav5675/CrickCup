class MatchScore {
  MatchScore({
    this.team1Score,
    this.team2Score,
  });

  MatchScore.fromJson(dynamic json) {
    team1Score = json['team1Score'] != null
        ? TeamScore.fromJson(json['team1Score'])
        : null;
    team2Score = json['team2Score'] != null
        ? TeamScore.fromJson(json['team2Score'])
        : null;
  }

  TeamScore? team1Score;
  TeamScore? team2Score;

  MatchScore copyWith({
    TeamScore? team1Score,
    TeamScore? team2Score,
  }) =>
      MatchScore(
        team1Score: team1Score ?? this.team1Score,
        team2Score: team2Score ?? this.team2Score,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (team1Score != null) {
      map['team1Score'] = team1Score?.toJson();
    }
    if (team2Score != null) {
      map['team2Score'] = team2Score?.toJson();
    }
    return map;
  }
}

class TeamScore {
  TeamScore({
    this.inning,
  });

  TeamScore.fromJson(dynamic json) {
    inning = json['inngs1'] != null ? Inning.fromJson(json['inngs1']) : null;
  }

  Inning? inning;

  TeamScore copyWith({
    Inning? inngs,
  }) =>
      TeamScore(
        inning: inngs ?? this.inning,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (inning != null) {
      map['inngs1'] = inning?.toJson();
    }
    return map;
  }
}

class Inning {
  Inning({
    this.inningsId,
    this.runs,
    this.wickets,
    this.overs,
  });

  Inning.fromJson(dynamic json) {
    inningsId = json['inningsId'];
    runs = json['runs'];
    wickets = json['wickets'];
    overs = json['overs'];
  }

  num? inningsId;
  num? runs;
  num? wickets;
  num? overs;

  Inning copyWith({
    num? inningsId,
    num? runs,
    num? wickets,
    num? overs,
  }) =>
      Inning(
        inningsId: inningsId ?? this.inningsId,
        runs: runs ?? this.runs,
        wickets: wickets ?? this.wickets,
        overs: overs ?? this.overs,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['inningsId'] = inningsId;
    map['runs'] = runs;
    map['wickets'] = wickets;
    map['overs'] = overs;
    return map;
  }
}
