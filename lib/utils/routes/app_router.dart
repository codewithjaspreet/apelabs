import 'package:go_router/go_router.dart';
class AppRouter {

  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: "/splash",
        // builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: "/",
        // builder: (context, state) => const Dashboard(),
      ),
      GoRoute(
        path: "/categories",
        // builder: (context, state) => const Categories(),
      ),
      GoRoute(
        path: "/cart",
        // builder: (context, state) => const Cart(),
      ),
      GoRoute(
        path: "/login",
        // builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: "/categoryItems",
        // builder: (context, state) => const ProductListingPage(categoryName: '',),
      ),
      GoRoute(
        path: "/createOrder",
        // builder: (context, state) => const CreateOrder(),
      ),



    ],
  );


}
