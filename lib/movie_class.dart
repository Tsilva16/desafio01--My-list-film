class Movies {
  List<Results> results;

  Movies.fromJson(Map<String, dynamic> json) {
    var arrayResults = json['results'] as List;

    results = arrayResults.map((item){
      return Results.fromJson(item);
    }).toList();
  }
}

class Results {
  String title;
  String posterPath;
  String releaseDate;
  double voteAverage;

  Results.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    posterPath = json['poster_path'];
    releaseDate = convertDate(json['release_Date']);
    voteAverage = json['vote_average'].toDouble();
  }
}

String convertDate(String date) {
  final dateArray = date.split("-");

  return dateArray[2] + '/' + dateArray[1] + '/' + dateArray[0];
}