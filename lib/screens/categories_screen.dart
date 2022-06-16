import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView(
        padding:EdgeInsets.all(25),
        children:DUMMY_CATEGORIES.map((catdate) =>
            CategoryItem(catdate.id,catdate.title,catdate.color),
        ).toList(),

        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing:10,
          mainAxisSpacing: 10,
          childAspectRatio: 3/2,
        ),

      ),
    );
  }
}
