import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/helper_function/error_snack_bar.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/features/home/presentation/cubit/cart/cart_cubit.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/main_view_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = 'home';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        body: BlocListener<CartCubit, CartState>(
          listener: (context, state) {
            if(state is CartItemAdded){
              buildErrorBar(context, 'تم الاضافة الي السلة', backgroundColor: AppColors.primaryColor, durationInSec: 1);
            }
            if(state is CartItemRemoved){
              buildErrorBar(context, 'تم الازالة من السلة', backgroundColor: Colors.red, durationInSec: 1);
            }
          },
         child:  MainViewBody(selectedIndex: selectedIndex),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          onItemTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
        ),
      ),
    );
  }
}
