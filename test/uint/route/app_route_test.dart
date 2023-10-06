import 'package:clean_architecture_flutter/app.dart';
import 'package:clean_architecture_flutter/constant/url/app_api_url.dart';
import 'package:clean_architecture_flutter/di.dart';
import 'package:clean_architecture_flutter/features/Login/presentation/page/LoginPage.dart';
import 'package:clean_architecture_flutter/features/courses_list/presentation/pages/home_screen.dart';
import 'package:clean_architecture_flutter/features/signup/presentation/page/sign_up_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_route_test.mocks.dart';

@GenerateMocks([SharedPreferences])
@GenerateMocks([AppDependencies])
void main() {
  setUp(() => MockAppDependencies().initialize());

  testWidgets('Test navigation to different routes',
      (WidgetTester tester) async {
    await AppDependencies().initialize();
    final mockSharedPreferences = MockSharedPreferences();
    final moclAppDependencies = MockAppDependencies();
    await moclAppDependencies.initialize();
    // Mock that the user is authenticated
    when(mockSharedPreferences.containsKey(AppApiUrl.TOKEN))
        .thenReturn(await true);

    // Build the main app widget with AppRoutes.router as the router
    await tester.pumpWidget(App());

    // Wait for the app to load
    await tester.pumpAndSettle();

    // Verify that the initial route is the HomeScreen
    expect(find.byType(HomeScreen), findsOneWidget);

    // Simulate navigation to the LoginPage
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Verify that the LoginPage is displayed
    expect(find.byType(LoginPage), findsOneWidget);

    // Simulate navigation to the SignUpPage
    await tester.tap(find.text('Sign Up'));
    await tester.pumpAndSettle();

    // Verify that the SignUpPage is displayed
    expect(find.byType(SignUpPage), findsOneWidget);
  });

  testWidgets('Test redirect when not authenticated',
      (WidgetTester tester) async {
    await AppDependencies().initialize();
    final mockSharedPreferences = MockSharedPreferences();
    // Mock that the user is not authenticated
    when(mockSharedPreferences.containsKey(AppApiUrl.TOKEN)).thenReturn(false);

    // Build the main app widget with AppRoutes.router as the router
    await tester.pumpWidget(App());

    // Wait for the app to load
    await tester.pumpAndSettle();

    // Verify that the app has redirected to the LoginPage
    expect(find.byType(LoginPage), findsOneWidget);
  });
}
