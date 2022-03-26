import 'package:flutter/material.dart';
import 'package:orilla_fresca/models/sub_category.dart';

class PartsList extends StatefulWidget {
  final SubCategoryModel subCategory;

  const PartsList(this.subCategory, {Key? key}) : super(key: key);

  @override
  State<PartsList> createState() => _PartsList();
}

class _PartsList extends State<PartsList> {
  @override
  Widget build(BuildContext context) {
    final parts = widget.subCategory.parts;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Text(
            'Select items',
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 190,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: parts.length,
            itemBuilder: (context, i) => GestureDetector(
              onTap: () => setState(() {
                for (var part in parts) {
                  part.isSelected = parts[i] == part;
                }
              }),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 140,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: parts[i].isSelected
                          ? Border.all(color: widget.subCategory.color, width: 2)
                          : null,
                      image: DecorationImage(
                        image: AssetImage('assets/imgs/${parts[i].imgName}.png'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    parts[i].name,
                    style: TextStyle(color: widget.subCategory.color),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
