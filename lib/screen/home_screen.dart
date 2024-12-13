import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/cocktail.model.dart';
import 'package:flutter_application_1/screen/widgets/cocktail_detail_widget.dart';
import 'package:flutter_application_1/services/api_service.dart';
import 'package:flutter_application_1/services/cocktail.service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CocktailService _cocktailService =
      CocktailService(apiService: ApiService());
  Cocktail? _cocktail;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchRandomCocktail();
  }

  Future<void> _fetchRandomCocktail() async {
    setState(() => _isLoading = true);
    try {
      final cocktail = await _cocktailService.getRandomCocktail();
      setState(() => _cocktail = cocktail);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Random Cocktail'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchRandomCocktail,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          print("onRefresh");
          _fetchRandomCocktail();
        },
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _cocktail == null
                ? const Center(child: Text('No cocktail loaded'))
                : CocktailDetailsWidget(
                    cocktail: _cocktail!,
                  ),
      ),
    );
  }
}
