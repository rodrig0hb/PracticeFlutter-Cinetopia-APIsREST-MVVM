import 'package:cinetopia/app/services/search_movies_service.dart';

import '../models/movie.dart';

class SearchMoviesViewmodel {

List<Movie> _moviesList = [];

  Future<List<Movie>> getPopularMovies() async {
    final SearchMoviesService service = SearchPopularMoviesService();
    _moviesList = await service.getMovies();
    return _moviesList;
  }

  Future<List<Movie>> getMovie(String query) async {
    if (query.isEmpty) {
      return getPopularMovies();
    } else{
      final SearchMoviesService service = SearchForMovie(query: query,);
      _moviesList = await service.getMovies();
    }
     return _moviesList;
  }

  List<Movie> get moviesList => _moviesList; // função para acessar variável privada pela view. é privado para evitar alterações diretas na lista de filmes vindos da view.
}