import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart'; // Added import for provider
import '../ui/screens/dashboard_screen.dart';
import '../ui/screens/home_screen.dart';
import '../ui/screens/setup_screen.dart';
import '../ui/screens/constant_mode_screen.dart';
import '../ui/screens/monitoring_screen.dart';
// Added imports for ViewModels
import '../viewmodels/dashboard_view_model.dart';
import '../viewmodels/home_view_model.dart';
import '../viewmodels/setup_view_model.dart';
import '../viewmodels/constant_mode_view_model.dart';
import '../viewmodels/monitoring_view_model.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return DashboardScreen(
          viewModel: context.read<DashboardViewModel>(),
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => NoTransitionPage(
            child: HomeScreen(viewModel: context.read<HomeViewModel>()),
          ),
        ),
        GoRoute(
          path: '/setup',
          pageBuilder: (context, state) => NoTransitionPage(
            child: SetupScreen(viewModel: context.read<SetupViewModel>()),
          ),
        ),
        GoRoute(
          path: '/constant',
          pageBuilder: (context, state) => NoTransitionPage(
            child: ConstantModeScreen(
              viewModel: context.read<ConstantModeViewModel>(),
            ),
          ),
        ),
        GoRoute(
          path: '/monitoring',
          pageBuilder: (context, state) => NoTransitionPage(
            child: MonitoringScreen(
              viewModel: context.read<MonitoringViewModel>(),
            ),
          ),
        ),
      ],
    ),
  ],
);
