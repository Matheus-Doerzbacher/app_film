import 'package:app_film/models/movies_model.dart';
import 'package:app_film/pages/details_page.dart';
import 'package:app_film/utils/api_utils.dart';
import 'package:flutter/material.dart';

class CustomListCardWidget extends StatelessWidget {
  final Movie movie;
  const CustomListCardWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailsPage(movie: movie),
              fullscreenDialog: true,
            ),
          );
        },
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                child: Hero(
                  tag: movie.id,
                  child: Image.network(
                    API.REQUEST_IMG(movie.posterPath),
                    loadingBuilder: (_, child, progress) {
                      if (progress == null) return child;
                      return const CircularProgressIndicator.adaptive();
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(fontSize: 18),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      const Spacer(),
                      Text(
                          'Popularidade: ${movie.popularity.toStringAsFixed(2)}'),
                      const SizedBox(height: 10),
                      Text('Votos: ${movie.voteAverage.toStringAsFixed(2)}'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
