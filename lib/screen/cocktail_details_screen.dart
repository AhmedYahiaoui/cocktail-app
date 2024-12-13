import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/cocktail.model.dart';

class CocktailDetailScreen extends StatelessWidget {
  final Cocktail cocktail;

  const CocktailDetailScreen({super.key, required this.cocktail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(cocktail.name),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
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
                  _buildSection('Category', cocktail.category),
                  _buildSection('Type', cocktail.alcoholic),
                  _buildSection('Glass', cocktail.glass),
                  _buildSection('Instructions', cocktail.instructions),
                  const SizedBox(height: 16),
                  const Text(
                    'Ingredients:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildIngredientsList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          content,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildIngredientsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cocktail.ingredients.length,
      itemBuilder: (context, index) {
        final measure =
            index < cocktail.measures.length ? cocktail.measures[index] : '';
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            '• ${measure.isNotEmpty ? "$measure of " : ""}${cocktail.ingredients[index]}',
            style: const TextStyle(fontSize: 16),
          ),
        );
      },
    );
  }
}
