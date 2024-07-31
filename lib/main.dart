import 'package:chec_nest/core/utils/app_router.dart';
import 'package:chec_nest/core/utils/service_locator.dart';
import 'package:chec_nest/features/home/data/repos/home_repo_impl.dart';
import 'package:chec_nest/features/home/presentation/manager/category_product_cubit/category_product_cubit.dart';
import 'package:chec_nest/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:chec_nest/features/home/presentation/manager/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator(); // Ensure service locator is set up

  runApp(const ShopEase());
}

class ShopEase extends StatelessWidget {
  const ShopEase({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => HomeCubit(
                  getIt.get<HomeRepoImpl>(),
                )..fetchAllProducts()),
        BlocProvider(
          create: (context) => CategoryProductCubit(
            getIt.get<HomeRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => ProductCubit(
            getIt.get<HomeRepoImpl>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
