import 'package:flutter/material.dart';
import 'package:orilla_fresca/models/sub_category.dart';
import 'package:provider/provider.dart';

import '../../cart/cart_service.dart';

class ShoppingListPage extends StatelessWidget {
  const ShoppingListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Your Cart',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Consumer<CartService>(
                builder: (context, cart, child) {
                  List<Widget> cartItems = [];
                  double mainTotal = 0;

                  if (cart.cartItems.isEmpty) {
                    return const Text('Your cart is empty');
                  } else {
                    for (var item in cart.cartItems) {
                      SubCategoryModel subCat = item.category as SubCategoryModel;
                      double subTotal = subCat.price * subCat.amount;
                      mainTotal += subTotal;

                      cartItems.add(
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  'assets/imgs/${subCat.imgName}.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      subCat.name,
                                      style: TextStyle(
                                        color: subCat.color,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'quantity: ${subCat.amount}',
                                      style: const TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      'Rs.${subCat.price * subCat.amount}',
                                      style: TextStyle(
                                          color: subCat.color, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.highlight_off_rounded,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                    return Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: cartItems,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Total: Rs.$mainTotal',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
