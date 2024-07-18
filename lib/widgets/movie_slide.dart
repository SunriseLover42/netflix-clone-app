import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/util/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieSlide extends StatelessWidget {
  final List<Movie> movies;
  final String headlineText;
  final ScrollController controller;

  const MovieSlide({
    super.key,
    required this.movies,
    required this.headlineText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(headlineText,
                    style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            fontSize: 22, color: Colors.white))),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              controller: controller,
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                final Movie result = movies[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Image.network(
                    '$imageUrl${result.posterPath}',
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}