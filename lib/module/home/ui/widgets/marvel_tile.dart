import 'package:flutter/material.dart';

class MarvelTile extends StatelessWidget {
  const MarvelTile({
    super.key,
    required this.image,
    required this.extension,
    required this.title,
    required this.onTap,
  });

  final String image;
  final String extension;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
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
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
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
      ),
    );
  }
}
