import 'package:flutter/material.dart';

class MarvelTile extends StatelessWidget {
  const MarvelTile({
    super.key,
    required this.image,
    required this.extension,
    required this.title,
  });

  final String image;
  final String extension;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage('$image.$extension'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            color: Colors.white.withOpacity(0.5),
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
