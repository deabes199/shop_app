import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hero_store_app/core/helpers/assets_manager.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';
import 'package:hero_store_app/core/theming/text_style.dart';
import 'package:hero_store_app/features/cart/data/model/cart_model.dart';
import 'package:hero_store_app/features/cart/logic/add_carts_cubit.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    required this.product,
  });
  final CartModel product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCartsCubit, AddCartsState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              margin: EdgeInsets.only(bottom: 15.h),
              width: double.infinity,
              height: 100.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.primaryColor,
                  )),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageBuilder: (context, imageProvider) => Image(
                          image: imageProvider,
                        ),
                        imageUrl: product.image ?? AssetsManager.notFound,
                        fit: BoxFit.cover,
                        width: 115.w,
                        height: 115.h,
                      )),
                  horzintalSpace(10),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: SizedBox(
                                  width: 150.w,
                                  child: Text(product.title ?? '',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyles.font18BlackBold),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<AddCartsCubit>()
                                      .removeProductFromCart(product);
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          product.category ?? '',
                          style: TextStyles.font16GrayNormal,
                        ),
                        horzintalSpace(25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '\$ ${(product.price! * product.quantity).toStringAsFixed(2)}',
                                style: TextStyles.font18primaryBold),
                            horzintalSpace(30),
                            InkWell(
                                onTap: () {
                                  context
                                      .read<AddCartsCubit>()
                                      .minusQuantity(product);
                                },
                                child: SvgPicture.asset(
                                  'assets/svg/dec.svg',
                                )),
                            horzintalSpace(12),
                            Text(product.quantity.toString(),
                                style: TextStyles.font18BlackBold),
                            horzintalSpace(12),
                            InkWell(
                                onTap: () {
                                  context
                                      .read<AddCartsCubit>()
                                      .addQuantity(product);
                                },
                                child: SvgPicture.asset('assets/svg/add.svg')),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
