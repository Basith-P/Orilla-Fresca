import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orilla_fresca/models/sub_category.dart';
import 'package:orilla_fresca/widgets/main_app_bar.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage(this.subcategory, {Key? key}) : super(key: key);

  final SubCategoryModel subcategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Center(
        child: Text(subcategory.name),
      ),
    );
  }
}
