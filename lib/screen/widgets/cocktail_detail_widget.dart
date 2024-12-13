import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/cocktail.model.dart';
import 'package:flutter_application_1/screen/cocktail_details_screen.dart';

class CocktailDetailsWidget extends StatelessWidget {
  final Cocktail cocktail;

  const CocktailDetailsWidget({super.key, required this.cocktail});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .38,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CocktailDetailScreen(cocktail: cocktail),
            ),
          );
        },
        child: Card(
          color: Colors.white,
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                cocktail.thumbnailUrl,
                height: 300,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cocktail.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      cocktail.category,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      cocktail.alcoholic,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
