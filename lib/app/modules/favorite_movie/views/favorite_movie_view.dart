import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favorite_movie_controller.dart';

class FavoriteMovieView extends GetView<FavoriteMovieController> {
  const FavoriteMovieView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FavoriteMovieView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FavoriteMovieView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
