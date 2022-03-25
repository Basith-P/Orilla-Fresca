import 'package:flutter/material.dart';

import '../../../config/theme/colors.dart';

class AmountAndCost extends StatefulWidget {
  int amount = 0;
  double price = 15.0;
  double cost = 0.0;

  @override
  State<AmountAndCost> createState() => _AmountAndCostState();
}

class _AmountAndCostState extends State<AmountAndCost> {
  @override
  Widget build(BuildContext context) => Column(
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
                  TextSpan(text: 'Libra', style: TextStyle(fontWeight: FontWeight.bold)),
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
            child: Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      if (widget.amount < 20) {
                        widget.amount++;
                        widget.cost = widget.price * widget.amount;
                      }
                    }),
                    child: const Icon(
                      Icons.add_circle_outline_rounded,
                      size: 40,
                      color: AppColors.meats,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black87),
                      children: [
                        TextSpan(text: '${widget.amount}', style: const TextStyle(fontSize: 40)),
                        const TextSpan(text: 'kgs', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      if (widget.amount > 0) {
                        widget.amount--;
                        widget.cost = widget.price * widget.amount;
                      }
                    }),
                    child: const Icon(Icons.remove_circle_outline_rounded,
                        size: 40, color: Colors.grey),
                  ),
                ],
              ),
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
                          text: '₹${widget.price}/kg',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
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
