import 'package:flutter/material.dart';
import 'package:googe_books_search/screens/homescreen/viewmodel/books_view_model.dart';
import 'package:provider/provider.dart';

class Filters extends StatelessWidget {
  List<String> filters;
  double heght;
  Filters({
    Key? key,
    required this.heght,
    required this.filters,
  }) : super(key: key);

  Widget _getFilter(String filter, BooksViewModel provider) {
    if (filter.isNotEmpty) {
      return Container(
        decoration: BoxDecoration(
          color: provider.currentFilter == filter ? Colors.orange : Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: provider.currentFilter != filter ? Border.all(color: Colors.orange, width: 1) : null,
        ),
        height: 40,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 20, right: 20),
        margin: const EdgeInsets.only(right: 10),
        child: InkWell(
          onTap: (){
            provider.setCurrentFilterName(filter);
          },
          child: Text(
            filter.toUpperCase(),
            style: TextStyle(color: provider.currentFilter == filter ?Colors.white : Colors.orange, fontSize: 16),
          ),
        ),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BooksViewModel>(context);

    return Container(
      margin: const EdgeInsets.only(left: 10),
      width: double.infinity,
      height: heght,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: filters.map((e) => _getFilter(e, provider)).toList(),
        ),
      ),
    );
  }
}
