import 'package:flutter/material.dart';
import 'package:orilla_fresca/widgets/theme_button.dart';

import '../../config/theme/colors.dart';
import '../../models/sub_category.dart';
import '../../views/cat_list/widgets/category_icon.dart';
import '../../widgets/main_app_bar.dart';
import 'widgets/amount_and_cost_widget.dart';
import 'widgets/parts_list.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage(this.subcategory, {Key? key}) : super(key: key);

  final SubCategoryModel subcategory;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final subCat = widget.subcategory;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 244),
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
                PartsList(subCat),
                AmountAndCost(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ThemeButton(
                        label: 'Add to cart',
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ),
                        onClick: () {},
                      ),
                      const SizedBox(height: 10),
                      ThemeButton(
                        label: 'Product Location',
                        icon: const Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                        ),
                        color: AppColors.darkGreen,
                        onClick: () {},
                      ),
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
