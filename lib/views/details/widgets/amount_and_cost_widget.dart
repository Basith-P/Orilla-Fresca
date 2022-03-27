import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/sub_category.dart';
import '../../../services/category_selection_service.dart';

const int maxValue = 20;
const int minValue = 0;

// ignore: must_be_immutable
class AmountAndCost extends StatefulWidget {
  double cost = 0.0;

  AmountAndCost({Key? key}) : super(key: key);

  @override
  State<AmountAndCost> createState() => _AmountAndCostState();
}

class _AmountAndCostState extends State<AmountAndCost> {
  @override
  Widget build(BuildContext context) {
    SubCategoryModel subCategory = context.watch<CategorySelectionService>().selectedSubCategory;
    final themeColor = subCategory.color;
    int amount = subCategory.amount;
    double price = subCategory.price;
    // final quantity = subCategory.quantity;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(left: 40),
          child: RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              children: [
                TextSpan(text: 'Unit: '),
                TextSpan(text: 'Kilograms', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' (max: 20)'),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          //amount button
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (amount > minValue) {
                    amount--;
                    subCategory = subCategory;
                  }
                },
                child: Icon(
                  Icons.remove_circle_outline_rounded,
                  size: 40,
                  color: amount > minValue ? Colors.grey : Colors.grey.withOpacity(.2),
                ),
              ),
              Consumer<CategorySelectionService>(
                builder: (context, catSelection, _) => RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black87),
                    children: [
                      TextSpan(
                          text: '${catSelection.selectedSubCategory.amount}',
                          style: const TextStyle(fontSize: 40)),
                      const TextSpan(text: 'kgs', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (amount < maxValue) {
                    amount++;
                    subCategory = subCategory;
                  }
                },
                child: Icon(
                  Icons.add_circle_outline_rounded,
                  size: 40,
                  color: amount < maxValue ? themeColor : themeColor.withOpacity(.2),
                ),
              ),
            ],
          ),
        ),
        //price and cost
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: 'Price: '),
                    TextSpan(
                        text: '₹$price/kg', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Text('₹${widget.cost}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ],
          ),
        ),
      ],
    );
  }
}
