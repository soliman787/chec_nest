
import 'package:chec_nest/features/auth/login/presentation/login_view.dart';
import 'package:chec_nest/features/auth/sign_up/presentation/sign_up_view.dart';
import 'package:chec_nest/features/home/data/models/product_model.dart';
import 'package:chec_nest/features/home/presentation/views/category_view/category_view.dart';
import 'package:chec_nest/features/home/presentation/views/home_view/home_view.dart';
import 'package:chec_nest/features/home/presentation/views/home_view/widgets/all_product_horizontal_list_view_item.dart';
import 'package:chec_nest/features/home/presentation/views/home_view/widgets/all_product_view_vertical_list_view.dart';
import 'package:chec_nest/features/home/presentation/views/product_view/product_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kLogin = '/';
  static const kSignUp = '/signUp';
  static const kHome = '/HomeView';
  static const kCategoryView = '/CategoryView/:id';  // Updated path with parameter
  static const kProductView = '/ProductView';
  static const kVerticalAllProductView = '/AllProductHorizontalListViewItem';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginView(),
      ),

      GoRoute(
        path: kSignUp,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: kHome,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kCategoryView,
        builder: (context, state) {
          final id = state.pathParameters['id']!;  // Extract the parameter
          return CategoryView(category: id);  // Pass the parameter to the constructor
        },
      ),
      GoRoute(
        path: kProductView,
        builder: (context, state) {
          final product = state.extra as ProductModel;  // Get the product data from extra
          return ProductView(product: product);
        },
      ),
      GoRoute(
        path: kVerticalAllProductView,
        builder: (context, state) => const AllProductViewVerticalListView(),
      ),
    ],
  );
}
