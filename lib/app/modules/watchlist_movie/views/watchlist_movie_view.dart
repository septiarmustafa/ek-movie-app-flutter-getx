import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/watchlist_movie_controller.dart';

class WatchlistMovieView extends GetView<WatchlistMovieController> {
  const WatchlistMovieView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WatchlistMovieView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WatchlistMovieView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
