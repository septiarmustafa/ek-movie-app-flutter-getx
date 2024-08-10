import 'dart:convert';
import 'package:ek_movie_app/app/models/genre.dart';
import 'package:ek_movie_app/app/models/movie.dart';
import 'package:ek_movie_app/app/services/api_string.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Movie>> fetchNowPlayingMovies() async {
    final response =
        await http.get(Uri.parse('$baseUrl/movie/now_playing?api_key=$apiKey'));
    if (response.statusCode == 200) {
      final List movies = json.decode(response.body)['results'];
      return movies.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> fetchPopularMovies() async {
    final response =
        await http.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));
    if (response.statusCode == 200) {
      final List movies = json.decode(response.body)['results'];
      return movies.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> fetchSimilarMovies(int movieId) async {
    final response = await http
        .get(Uri.parse('$baseUrl/movie/$movieId/similar?api_key=$apiKey'));
    if (response.statusCode == 200) {
      final List movies = json.decode(response.body)['results'];
      return movies.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load similar movies');
    }
  }

  Future<List<Movie>> fetchTopRatedMovies() async {
    final response =
        await http.get(Uri.parse('$baseUrl/movie/top_rated?api_key=$apiKey'));
    if (response.statusCode == 200) {
      final List movies = json.decode(response.body)['results'];
      return movies.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load top rated movies');
    }
  }

  Future<List<Genre>> fetchGenres() async {
    final response =
        await http.get(Uri.parse('$baseUrl/genre/movie/list?api_key=$apiKey'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List genres = data['genres'];
      return genres.map((json) => Genre.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load genres');
    }
  }

  Future<void> postFavoriteMovie(String movieId, bool isFavorite) async {
    final response = await http.post(
      Uri.parse('$baseUrl/account/$accountId/favorite/movies?api_key=$apiKey'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
          {"media_type": "movie", "media_id": movieId, "favorite": isFavorite}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add to favorites');
    }
  }

  Future<void> postWatchlistMovie(String movieId, bool isWatchlist) async {
    final response = await http.post(
      Uri.parse('$baseUrl/account/$accountId/watchlist/movies?api_key=$apiKey'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "media_type": "movie",
        "media_id": movieId,
        "watchlist": isWatchlist
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add to watchlist');
    }
  }

  Future<List<Movie>> fetchFavoriteMovies() async {
    final response = await http.get(Uri.parse(
        '$baseUrl/account/$accountId/favorite/movies?api_key=$apiKey'));

    if (response.statusCode == 200) {
      final List movies = json.decode(response.body)['results'];
      return movies.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load favorite movies');
    }
  }

  Future<List<Movie>> fetchWatchlistMovies() async {
    final response = await http.get(Uri.parse(
        '$baseUrl/account/$accountId/watchlist/movies?api_key=$apiKey'));

    if (response.statusCode == 200) {
      final List movies = json.decode(response.body)['results'];
      return movies.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load watchlist movies');
    }
  }
}
