// ignore: file_names
import 'package:finder_flutter/bachelorFavoritesProvider.dart';
import 'package:finder_flutter/bachelorPreview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'models/bachelor.dart';
import 'utils/fake_data.dart';

class BachelorListScreen extends StatefulWidget {
  const BachelorListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BachelorListScreenState createState() => _BachelorListScreenState();
}

class _BachelorListScreenState extends State<BachelorListScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Bachelor> bachelors = generateBachelors();
  List<Bachelor> likedBachelors = [];
  bool isFilterApplied = false;
  List<Bachelor> filteredBachelors = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bachelors'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Rechercher...',
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isFilterApplied = !isFilterApplied;
                      if (isFilterApplied) {
                        filteredBachelors = bachelors
                            .where((bachelor) => bachelor.gender == 'Female')
                            .toList();
                      } else {
                        filteredBachelors.clear();
                      }
                    });
                  },
                  child: Text(isFilterApplied
                      ? 'Supprimer le filtre'
                      : 'Filtrer par genre'),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                final bachelorsProvider =
                    Provider.of<BachelorFavoritesProvider>(context,
                        listen: false);
                context.go('/favorites',
                    extra: bachelorsProvider.likedBachelors);
              },
            ),
          ),
        ],
      ),
      body: Consumer<BachelorFavoritesProvider>(
        builder: (context, bachelorsProvider, _) {
          final hiddenBachelors = bachelorsProvider.hiddenBachelors;
          final visibleBachelors = bachelors.where((bachelor) {
            final searchQuery = _searchController.text.toLowerCase();
            final firstName = bachelor.firstname.toLowerCase();
            final isHidden = hiddenBachelors.contains(bachelor);
            return firstName.contains(searchQuery) && !isHidden;
          }).toList();

          return ListView.builder(
            itemCount:
                isFilterApplied ? filteredBachelors.length : visibleBachelors.length,
            itemBuilder: (context, index) {
              final bachelor =
                  isFilterApplied ? filteredBachelors[index] : visibleBachelors[index];
              return BachelorPreview(
                bachelor: bachelor,
                isLiked: likedBachelors.contains(bachelor),
                onLike: () => bachelorsProvider.toggleLike(bachelor),
                onDislike: () => bachelorsProvider.hideBachelor(bachelor),
              );
            },
          );
        },
      ),
    );
  }
}
