import 'dart:convert';


import 'package:filmslist/movie_class.dart'; 
import 'package:http/http.dart' as http;

const authority = 'api.themoviedb.org';
const queryParameters = {
  'api_key':'a5bc05fb630c9b7fdc560033345fa13e',
};

class API {
  Future<Movies> getNowPlayingMovies() async {
    final response = await http
      .get(Uri.https(authority, '/3/movie/now_playing', queryParameters));

  if (response.statusCode == 200) {
    return Movies.fromJson(jsonDecode(response.body));
  } else {
    return Future.error('Movies not Found');
    }
  }

  Future<Movies> getUpcomingMovies() async{
    final response = await http
        .get(Uri.https(authority,'/3/movie/upcoming', queryParameters));

    if (response.statusCode == 200) {
      return Movies.fromJson(jsonDecode(response.body));
    } else {
      return Future.error('Movies not Found');
    }
  }

  Future<Movies> getTopRateMovies() async{
    final response = await http
      .get(Uri.https(authority, '/3/movies/top_rated', queryParameters));

    if (response.statusCode == 200) {
      return Movies.fromJson(jsonDecode(response.body));
    } else {
      return Future.error('Movies not Found');
    }
  }
}