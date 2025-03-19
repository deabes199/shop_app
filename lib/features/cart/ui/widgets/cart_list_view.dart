import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/features/cart/logic/add_carts_cubit.dart';
import 'package:hero_store_app/features/cart/ui/widgets/cart_item.dart';
import 'package:hero_store_app/features/cart/ui/widgets/checkout.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCartsCubit, AddCartsState>(
      builder: (context, state) {
        final cartCubit = context.watch<AddCartsCubit>();
        return cartCubit.cartList.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  Center(
                      child: Text(
                    'Your cart is empty !',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(fontSize: 20),
                  ))
                ],
              )
            : Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: cartCubit.cartList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return CartItems(
                              product: cartCubit.cartList[index],
                            );
                          }),
                    ),
                    const CartCheckout(),
                  ],
                ),
              );
      },
    );
  }
}
