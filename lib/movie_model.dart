import 'package:filmslist/movie_api.dart';
import 'package:filmslist/movie_class.dart';



class MoviesModel {
  final api = API();

  Future<Movies> _nowPlayingMovies;
  Future<Movies> _upcomingMovies;
  Future<Movies> _topRatedMovies;

  Future<Movies> get nowPlayingMovies => _nowPlayingMovies;
  Future<Movies> get upcomingMovies => _upcomingMovies;
  Future<Movies> get topRatedMovies => _topRatedMovies;

  getNowPlayingMovies() {
    _nowPlayingMovies = api.getNowPlayingMovies();
  }
  getUpcomingMovies() {
    _upcomingMovies = api.getUpcomingMovies();
  }
  getTopRatedMovies() {
    _topRatedMovies = api.getNowPlayingMovies();
  }
}