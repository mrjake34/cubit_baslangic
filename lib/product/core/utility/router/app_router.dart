import 'package:cubit_baslangic/feature/home/domain/model/post_model.dart';
import 'package:cubit_baslangic/feature/home/presentation/view/home_view.dart';
import 'package:cubit_baslangic/feature/home/presentation/view/post_detail_view.dart';
import 'package:cubit_baslangic/feature/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Import your screen/view files here
// Example: import 'package:cubit_baslangic/feature/home/presentation/view/home_view.dart';
// Example: import 'package:cubit_baslangic/feature/splash/presentation/view/splash_view.dart';

/// Defines the application's routes using GoRouter.
final class AppRouter {
  AppRouter._(); // Private constructor

  // Define route paths as constants
  static const String splashPath = '/';
  static const String homePath =
      '/home'; // Make sure homePath starts with '/' for top-level
  static const String postDetailPath = '/post/:id';
  // Add other route paths here

  /// Helper method to create the path for post detail
  static String createPostDetailPath(String id) => '/post/$id';

  /// The GoRouter instance for the application.
  static final GoRouter router = GoRouter(
    initialLocation: splashPath, // Set the initial route
    debugLogDiagnostics: true, // Log routing diagnostics in debug mode
    routes: <RouteBase>[
      GoRoute(
        path: splashPath,
        name: 'splash',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: homePath,
        name: 'home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      // Add Post Detail Route
      GoRoute(
        path: postDetailPath,
        name: 'postDetail',
        builder: (BuildContext context, GoRouterState state) {
          // Extract PostModel from extra
          final post = state.extra as PostModel?;

          // Extract the id from path parameters for potential use or fallback
          final String postIdFromPath = state.pathParameters['id'] ?? 'invalid';

          if (post != null) {
            // Pass the PostModel object if available
            return PostDetailView(post: post);
          } else {
            // Handle error: extra is null or not a PostModel
            // Option 1: Show an error screen
            return Scaffold(
              appBar: AppBar(title: const Text('Hata')),
              body: Center(
                child: Text('Gönderi detayı yüklenemedi. ID: $postIdFromPath'),
              ),
            );
            // Option 2: Try to fetch using postIdFromPath (requires PostDetailView modification or a different view)
            // return PostDetailFetcherScreen(postId: postIdFromPath);
          }
        },
      ),
      // Add other top-level routes here
    ],
    // Optional: Add error handling for unknown routes
    errorBuilder:
        (context, state) => Scaffold(
          appBar: AppBar(title: const Text('Error')),
          body: Center(child: Text('Route not found: ${state.error}')),
        ),
    // Optional: Add redirection logic (e.g., for authentication)
    // redirect: (context, state) {
    //   // Implement redirection logic if needed
    //   return null; // Return null to continue route processing
    // },
  );
}
