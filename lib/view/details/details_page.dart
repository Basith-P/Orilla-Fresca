import 'package:flutter/material.dart';

import '../../config/theme/colors.dart';
import '../../models/sub_category.dart';
import '../../view/cat_list/widgets/category_icon.dart';
import '../../widgets/main_app_bar.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage(this.subcategory, {Key? key}) : super(key: key);

  final SubCategoryModel subcategory;

  int amount = 0;
  double price = 15.0;
  double cost = 0.0;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final subCat = widget.subcategory;
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(45)),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                SizedBox(
                  height: 300,
                  child: Image.asset(
                    'assets/imgs/${subCat.imgName}_desc.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(color: Colors.black38),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryIcon(color: subCat.color, iconName: subCat.icon),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Pork Meat',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Chip(
                            label: const Text(
                              '\$200/kg',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            elevation: 0,
                            backgroundColor: subCat.color,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 100,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: const [
                        Text(
                          '3',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: MainAppBar(
                    themeColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    itemCount: subCat.parts.length,
                    itemBuilder: (context, i) => GestureDetector(
                      onTap: () => setState(() {
                        for (var part in subCat.parts) {
                          part.isSelected = subCat.parts[i] == part;
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
                              border: subCat.parts[i].isSelected
                                  ? Border.all(color: subCat.color, width: 2)
                                  : null,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  offset: Offset.zero,
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage('assets/imgs/${subCat.parts[i].imgName}.png'),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            subCat.parts[i].name,
                            style: TextStyle(color: subCat.color),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset.zero,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => setState(() {
                          widget.amount++;
                          widget.cost = widget.price * widget.amount;
                        }),
                        icon: const Icon(
                          Icons.add_circle_outline_rounded,
                          size: 40,
                          color: AppColors.meats,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black87),
                          children: [
                            TextSpan(
                                text: '${widget.amount}', style: const TextStyle(fontSize: 40)),
                            const TextSpan(text: 'kgs', style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => setState(() {
                          if (widget.amount > 0) {
                            widget.amount--;
                            widget.cost = widget.price * widget.amount;
                          }
                        }),
                        icon: const Icon(Icons.remove_circle_outline_rounded,
                            size: 40, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
