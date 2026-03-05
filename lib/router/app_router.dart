import 'package:go_router/go_router.dart';
import '../ui/screens/dashboard_screen.dart';
import '../ui/screens/home_screen.dart';
import '../ui/screens/setup_screen.dart';
import '../ui/screens/constant_mode_screen.dart';
import '../ui/screens/monitoring_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => DashboardScreen(child: child),
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: HomeScreen()),
        ),
        GoRoute(
          path: '/setup',
          name: 'setup',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: SetupScreen()),
        ),
        GoRoute(
          path: '/constant',
          name: 'constant',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ConstantModeScreen()),
        ),
        GoRoute(
          path: '/monitoring',
          name: 'monitoring',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: MonitoringScreen()),
        ),
      ],
    ),
  ],
);
