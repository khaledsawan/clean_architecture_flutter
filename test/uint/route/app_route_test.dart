import 'package:clean_architecture_flutter/app.dart';
import 'package:clean_architecture_flutter/constant/url/app_api_url.dart';
import 'package:clean_architecture_flutter/features/Login/presentation/page/LoginPage.dart';
import 'package:clean_architecture_flutter/features/courses_list/presentation/pages/home_screen.dart';
import 'package:clean_architecture_flutter/features/signup/presentation/page/sign_up_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late FakeSharedPreferencesStore store;
  late SharedPreferences preferences;
  late GetIt getIt;
  const String testString = 'hello world';
  const bool testBool = true;
  const int testInt = 42;
  const double testDouble = 3.14159;
  const List<String> testList = <String>['foo', 'bar'];
  const Map<String, Object> testValues = <String, Object>{
    'flutter.String': testString,
    'flutter.bool': testBool,
    'flutter.int': testInt,
    'flutter.double': testDouble,
    'flutter.List': testList,
  };

  setUp(() async {
    getIt = GetIt.instance;
    store = FakeSharedPreferencesStore(testValues);
    SharedPreferencesStorePlatform.instance = store;
    preferences = await SharedPreferences.getInstance();
    await preferences.setString(AppApiUrl.TOKEN, 'value');
    store.log.clear();
  });
  tearDown(() async {
    await preferences.clear();
    await getIt.reset();
  });

  testWidgets('Test navigation to different routes',
      (WidgetTester tester) async {
    // Mock that the user is authenticated
    //when(preferences.containsKey(AppApiUrl.TOKEN)).thenReturn(true);

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
    // Mock that the user is not authenticated
    when(preferences.containsKey(AppApiUrl.TOKEN)).thenReturn(false);

    // Build the main app widget with AppRoutes.router as the router
    await tester.pumpWidget(App());

    // Wait for the app to load
    await tester.pumpAndSettle();

    // Verify that the app has redirected to the LoginPage
    expect(find.byType(LoginPage), findsOneWidget);
  });
}
