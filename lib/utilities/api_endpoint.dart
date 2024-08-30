class ApiUrl {
  static late String baseUrl;
  static late String recentMatches;

  Future<void> init() async {
    baseUrl = "https://cricbuzz-cricket.p.rapidapi.com";
    recentMatches = "$baseUrl/matches/v1/recent";
  }
}
