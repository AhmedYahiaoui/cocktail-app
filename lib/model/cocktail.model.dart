class Cocktail {
  final String id;
  final String name;
  final String category;
  final String alcoholic;
  final String glass;
  final String instructions;
  final String thumbnailUrl;
  final List<String> ingredients;
  final List<String> measures;

  Cocktail({
    required this.id,
    required this.name,
    required this.category,
    required this.alcoholic,
    required this.glass,
    required this.instructions,
    required this.thumbnailUrl,
    required this.ingredients,
    required this.measures,
  });

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    List<String> getIngredients(Map<String, dynamic> json) {
      List<String> ingredients = [];
      for (int i = 1; i <= 15; i++) {
        String? ingredient = json['strIngredient$i'];
        if (ingredient != null && ingredient.isNotEmpty) {
          ingredients.add(ingredient);
        }
      }
      return ingredients;
    }

    List<String> getMeasures(Map<String, dynamic> json) {
      List<String> measures = [];
      for (int i = 1; i <= 15; i++) {
        String? measure = json['strMeasure$i'];
        if (measure != null && measure.isNotEmpty) {
          measures.add(measure);
        }
      }
      return measures;
    }

    return Cocktail(
      id: json['idDrink'],
      name: json['strDrink'],
      category: json['strCategory'] ?? '',
      alcoholic: json['strAlcoholic'] ?? '',
      glass: json['strGlass'] ?? '',
      instructions: json['strInstructions'] ?? '',
      thumbnailUrl: json['strDrinkThumb'] ?? '',
      ingredients: getIngredients(json),
      measures: getMeasures(json),
    );
  }
}
