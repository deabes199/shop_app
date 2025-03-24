import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';
import 'package:hero_store_app/core/widgets/app_custom_button.dart';
import 'package:hero_store_app/features/cart/logic/add_carts_cubit.dart';
import 'package:hero_store_app/features/cart/ui/widgets/custom_check_widget.dart';

class CartCheckout extends StatelessWidget {
  const CartCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCartsCubit, AddCartsState>(
      builder: (context, state) {
        final cartCubit = context.read<AddCartsCubit>();
        double totalPrice = cartCubit.totalPriceInCart();
        int totalItems = cartCubit.totalItemsInCart();
        return Container(
          padding: const EdgeInsets.all(15),
          margin: EdgeInsets.only(top: 8.h),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCheckWidget(
                textkey: "Total Items :",
                textValue: '$totalItems Items',
              ),
              CustomCheckWidget(
                textkey: "Total Price  :",
                textValue: "${totalPrice.toStringAsFixed(2)} \$",
              ),
              vertcalSpace(10),
              AppCustomButton(
                label: 'Checkout',
                ontap: () {},
                color: AppColors.primaryColor,
              )
            ],
          ),
        );
      },
    );
  }
}
