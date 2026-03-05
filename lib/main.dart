import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'data/repositories/mock_device_repository.dart';
import 'data/repositories/device_repository.dart';
import 'viewmodels/dashboard_view_model.dart';
import 'viewmodels/home_view_model.dart';
import 'viewmodels/setup_view_model.dart';
import 'viewmodels/constant_mode_view_model.dart';
import 'viewmodels/monitoring_view_model.dart';
import 'router/app_router.dart';
import 'ui/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(1280, 800),
    center: true,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
    title: 'Chewing Simulator',
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    await windowManager.maximize();
  });

  runApp(const ChewingSimulatorApp());
}

class ChewingSimulatorApp extends StatelessWidget {
  const ChewingSimulatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DeviceRepository>(create: (_) => MockDeviceRepository()),
        ChangeNotifierProvider(
          create: (context) =>
              DashboardViewModel(context.read<DeviceRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(context.read<DeviceRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) => SetupViewModel(context.read<DeviceRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              ConstantModeViewModel(context.read<DeviceRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              MonitoringViewModel(context.read<DeviceRepository>()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Chewing Simulator',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        routerConfig: appRouter,
      ),
    );
  }
}
