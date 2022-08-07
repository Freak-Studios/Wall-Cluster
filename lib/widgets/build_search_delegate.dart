import 'package:flutter/material.dart';

import 'build_search_list.dart';

class BuildSearchDelegate extends SearchDelegate<dynamic> {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            }
            query = '';
          },
        )
      ];

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: theme.primaryColor,
        iconTheme: theme.iconTheme,
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            hintStyle: searchFieldStyle ?? theme.inputDecorationTheme.hintStyle,
            border: InputBorder.none,
          ),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null));

  @override
  Widget buildResults(BuildContext context) => Center(
        child: BuildSearchList(query: query.trim().toLowerCase()),
      );

  @override
  Widget buildSuggestions(BuildContext context) => const Text('');
}
