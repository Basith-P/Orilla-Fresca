import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../cart/cart_item_model.dart';
import '../../helper/utils.dart';
import 'widgets/amount_and_cost_widget.dart';
import 'widgets/parts_list.dart';
import '../../config/theme/colors.dart';
import '../../services/category_selection_service.dart';
import '../../cart/cart_service.dart';
import '../../views/map/map_page.dart';
import '../../views/cat_list/widgets/category_icon.dart';
import '../../widgets/theme_button.dart';
import '../../widgets/main_app_bar.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subCat = context.read<CategorySelectionService>().selectedSubCategory;
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
                          Text(
                            subCat.name,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Chip(
                            label: const Text(
                              'Rs.375/kg',
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
                      children: [
                        Consumer<CartService>(
                          builder: (context, cart, child) {
                            return Text(
                              '${cart.cartItems.length}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 5),
                        const Icon(
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
                subCat.parts.isNotEmpty ? PartsList(subCat) : const SizedBox(height: 20),
                AmountAndCost(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Consumer<CartService>(
                        builder: (context, cart, child) {
                          Widget renderedButton;

                          if (!cart.isSubCatAddedToCart(subCat)) {
                            renderedButton = ThemeButton(
                              label: 'Add to cart',
                              icon: const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                              ),
                              onClick: () => context.read<CartService>().addCartItem(
                                    CartItem(category: subCat),
                                  ),
                            );
                          } else {
                            renderedButton = Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Added to cart',
                                    style: TextStyle(
                                      color: AppColors.darkGreen,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: AppColors.darkGreen,
                                  ),
                                ],
                              ),
                            );
                          }

                          return renderedButton;
                        },
                      ),
                      const SizedBox(height: 10),
                      ThemeButton(
                        label: 'Product Location',
                        icon: const Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                        ),
                        color: AppColors.darkGreen,
                        onClick: () => Utils.mainAppNav.currentState!
                            .push(MaterialPageRoute(builder: (_) => const MapPage())),
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
