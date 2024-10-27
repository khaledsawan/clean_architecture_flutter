import 'di.dart';
import 'features/message/presentation/cubit/pushnotification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'route/app_routes.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> getIt<PushNotificationBloc>()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
