class MatchInfo {
  MatchInfo({
    required this.matchId,
    required this.seriesId,
    this.seriesName,
    this.matchDesc,
    this.matchFormat,
    this.startDate,
    this.endDate,
    this.state,
    this.status,
    this.team1,
    this.team2,
    this.venueInfo,
    this.currBatTeamId,
    this.seriesStartDt,
    this.seriesEndDt,
    this.isTimeAnnounced,
    this.stateTitle,
    this.isFantasyEnabled,
  });

  factory MatchInfo.fromJson(dynamic json) {
    return MatchInfo(
        matchId: json['matchId'],
        seriesId: json['seriesId'],
        seriesName: json['seriesName'],
        matchDesc: json['matchDesc'],
        matchFormat: json['matchFormat'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        state: json['state'],
        status: json['status'],
        team1: json['team1'] != null ? Team.fromJson(json['team1']) : null,
        team2: json['team2'] != null ? Team.fromJson(json['team2']) : null,
        venueInfo: json['venueInfo'] != null
            ? VenueInfo.fromJson(json['venueInfo'])
            : null,
        currBatTeamId: json['currBatTeamId'],
        seriesStartDt: json['seriesStartDt'],
        seriesEndDt: json['seriesEndDt'],
        isTimeAnnounced: json['isTimeAnnounced'],
        stateTitle: json['stateTitle'],
        isFantasyEnabled: json['isFantasyEnabled']);
  }

  final num matchId;
  final num seriesId;
  String? seriesName;
  String? matchDesc;
  String? matchFormat;
  String? startDate;
  String? endDate;
  String? state;
  String? status;
  Team? team1;
  Team? team2;
  VenueInfo? venueInfo;
  num? currBatTeamId;
  String? seriesStartDt;
  String? seriesEndDt;
  bool? isTimeAnnounced;
  String? stateTitle;
  bool? isFantasyEnabled;

  MatchInfo copyWith({
    num? matchId,
    num? seriesId,
    String? seriesName,
    String? matchDesc,
    String? matchFormat,
    String? startDate,
    String? endDate,
    String? state,
    String? status,
    Team? team1,
    Team? team2,
    VenueInfo? venueInfo,
    num? currBatTeamId,
    String? seriesStartDt,
    String? seriesEndDt,
    bool? isTimeAnnounced,
    String? stateTitle,
    bool? isFantasyEnabled,
  }) =>
      MatchInfo(
        matchId: matchId ?? this.matchId,
        seriesId: seriesId ?? this.seriesId,
        seriesName: seriesName ?? this.seriesName,
        matchDesc: matchDesc ?? this.matchDesc,
        matchFormat: matchFormat ?? this.matchFormat,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        state: state ?? this.state,
        status: status ?? this.status,
        team1: team1 ?? this.team1,
        team2: team2 ?? this.team2,
        venueInfo: venueInfo ?? this.venueInfo,
        currBatTeamId: currBatTeamId ?? this.currBatTeamId,
        seriesStartDt: seriesStartDt ?? this.seriesStartDt,
        seriesEndDt: seriesEndDt ?? this.seriesEndDt,
        isTimeAnnounced: isTimeAnnounced ?? this.isTimeAnnounced,
        stateTitle: stateTitle ?? this.stateTitle,
        isFantasyEnabled: isFantasyEnabled ?? this.isFantasyEnabled,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['matchId'] = matchId;
    map['seriesId'] = seriesId;
    map['seriesName'] = seriesName;
    map['matchDesc'] = matchDesc;
    map['matchFormat'] = matchFormat;
    map['startDate'] = startDate;
    map['endDate'] = endDate;
    map['state'] = state;
    map['status'] = status;
    if (team1 != null) {
      map['team1'] = team1?.toJson();
    }
    if (team2 != null) {
      map['team2'] = team2?.toJson();
    }
    if (venueInfo != null) {
      map['venueInfo'] = venueInfo?.toJson();
    }
    map['currBatTeamId'] = currBatTeamId;
    map['seriesStartDt'] = seriesStartDt;
    map['seriesEndDt'] = seriesEndDt;
    map['isTimeAnnounced'] = isTimeAnnounced;
    map['stateTitle'] = stateTitle;
    map['isFantasyEnabled'] = isFantasyEnabled;
    return map;
  }
}

class VenueInfo {
  VenueInfo({
    required this.id,
    required this.ground,
    required this.city,
    required this.timezone,
    required this.latitude,
    required this.longitude,
  });

  factory VenueInfo.fromJson(dynamic json) {
    return VenueInfo(
        id: json['id'],
        ground: json['ground'],
        city: json['city'],
        timezone: json['timezone'],
        latitude: json['latitude'],
        longitude: json['longitude']);
  }

  num id;
  String ground;
  String city;
  String timezone;
  String latitude;
  String longitude;

  VenueInfo copyWith({
    num? id,
    String? ground,
    String? city,
    String? timezone,
    String? latitude,
    String? longitude,
  }) =>
      VenueInfo(
        id: id ?? this.id,
        ground: ground ?? this.ground,
        city: city ?? this.city,
        timezone: timezone ?? this.timezone,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['ground'] = ground;
    map['city'] = city;
    map['timezone'] = timezone;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    return map;
  }
}

class Team {
  Team({
    required this.teamId,
    required this.teamName,
    required this.teamSName,
    required this.imageId,
  });

  factory Team.fromJson(dynamic json) {
    return Team(
        teamId: json['teamId'],
        teamName: json['teamName'],
        teamSName: json['teamSName'],
        imageId: json['imageId']);
  }

  num teamId;
  String teamName;
  String teamSName;
  num imageId;

  Team copyWith({
    num? teamId,
    String? teamName,
    String? teamSName,
    num? imageId,
  }) =>
      Team(
        teamId: teamId ?? this.teamId,
        teamName: teamName ?? this.teamName,
        teamSName: teamSName ?? this.teamSName,
        imageId: imageId ?? this.imageId,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['teamId'] = teamId;
    map['teamName'] = teamName;
    map['teamSName'] = teamSName;
    map['imageId'] = imageId;
    return map;
  }
}
