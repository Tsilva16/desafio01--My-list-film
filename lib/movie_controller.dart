import 'package:filmslist/movie_class.dart';
import 'package:filmslist/movie_model.dart';

class MoviesController {
  final model = MoviesModel();

  Future<Movies> get nowPlayingMovies => model.nowPlayingMovies;
  Future<Movies> get upcomingMovies => model.upcomingMovies;
  Future<Movies> get topRatedMovies => model.topRatedMovies;

  getNowPlayingMovies() => model.getNowPlayingMovies();
  getUpComingMovies() => model.getUpcomingMovies();
  getTopRatedMovies() => model.getTopRatedMovies();
}