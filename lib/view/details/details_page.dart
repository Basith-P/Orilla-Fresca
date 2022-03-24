import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orilla_fresca/models/sub_category.dart';
import 'package:orilla_fresca/widgets/main_app_bar.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage(this.subcategory, {Key? key}) : super(key: key);

  final SubCategoryModel subcategory;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Center(
        child: Text(widget.subcategory.name),
      ),
    );
  }
}
