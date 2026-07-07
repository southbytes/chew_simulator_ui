import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../viewmodels/dashboard_view_model.dart';
import '../../domain/models/models.dart';
import '../../domain/commands/result.dart';
import '../theme/app_theme.dart';

class DashboardScreen extends StatelessWidget {
  final Widget child;
  final DashboardViewModel viewModel;

  const DashboardScreen({
    super.key,
    required this.child,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        final status = viewModel.status;

        return Scaffold(
          body: Row(
            children: [
              _buildSidebar(context),
              Expanded(
                child: Column(
                  children: [
                    _buildTopBar(context, status, viewModel),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        child: child,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSidebar(BuildContext context) {
    final state = GoRouterState.of(context);
    final location = state.uri.path;

    return Container(
      width: 260,
      decoration: const BoxDecoration(
        color: AppTheme.surface,
        border: Border(right: BorderSide(color: Colors.white10, width: 1)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                const Icon(Icons.waves, color: AppTheme.primaryColor, size: 32),
                const SizedBox(width: 12),
                Text(
                  'CHEWING\nSIMULATOR',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    height: 1.0,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),
          _NavItem(
            icon: Icons.dashboard_outlined,
            label: 'Home',
            isSelected: location == '/',
            onTap: () => context.go('/'),
          ),
          _NavItem(
            icon: Icons.settings_input_component_outlined,
            label: 'Thermocycling Setup',
            isSelected: location == '/setup',
            onTap: () => context.go('/setup'),
          ),
          _NavItem(
            icon: Icons.thermostat_outlined,
            label: '37°C Constant Mode',
            isSelected: location == '/constant',
            onTap: () => context.go('/constant'),
          ),
          _NavItem(
            icon: Icons.analytics_outlined,
            label: 'Monitoring',
            isSelected: location == '/monitoring',
            onTap: () => context.go('/monitoring'),
          ),
          const Spacer(),
          _NavItem(
            icon: Icons.admin_panel_settings_outlined,
            label: 'Settings (Admin)',
            isSelected: false,
            onTap: () {},
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildTopBar(
    BuildContext context,
    DeviceStatus status,
    DashboardViewModel viewModel,
  ) {
    Color statusColor;
    String statusText;
    IconData statusIcon;

    switch (status.state) {
      case DeviceState.ready:
        statusColor = AppTheme.accentReady;
        statusText = 'READY';
        statusIcon = Icons.check_circle;
        break;
      case DeviceState.running:
        statusColor = AppTheme.accentRunning;
        statusText = 'RUNNING';
        statusIcon = Icons.sync;
        break;
      case DeviceState.paused:
        statusColor = AppTheme.accentWarning;
        statusText = 'PAUSED';
        statusIcon = Icons.pause_circle;
        break;
      case DeviceState.error:
        statusColor = AppTheme.accentError;
        statusText = 'ERROR';
        statusIcon = Icons.error;
        break;
    }

    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: const BoxDecoration(
        color: AppTheme.darkBg,
        border: Border(bottom: BorderSide(color: Colors.white10, width: 1)),
      ),
      child: Row(
        children: [
          Icon(statusIcon, color: statusColor),
          const SizedBox(width: 12),
          Text(
            statusText,
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(width: 40),
          _buildInfoItem(
            context,
            'MODE',
            status.mode == OperationMode.thermocycle
                ? 'Thermocycle'
                : status.mode == OperationMode.constant
                ? '37°C Hold'
                : 'Idle',
          ),
          const SizedBox(width: 40),
          _buildInfoItem(
            context,
            'COLD',
            '${status.currentColdBathTemp.toStringAsFixed(1)}°C',
          ),
          const SizedBox(width: 40),
          _buildInfoItem(
            context,
            'HOT',
            '${status.currentHotBathTemp.toStringAsFixed(1)}°C',
          ),
          const SizedBox(width: 40),
          if (status.mode == OperationMode.thermocycle)
            _buildInfoItem(context, 'CYCLE', '${status.currentCycle}'),
          const Spacer(),
          IconButton(
            icon: const Icon(
              Icons.report_problem,
              color: AppTheme.accentError,
              size: 32,
            ),
            onPressed: () => _showEmergencyDialog(context, viewModel),
            tooltip: 'Emergency Stop',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(BuildContext context, String label, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),
        ),
      ],
    );
  }

  void _showEmergencyDialog(
    BuildContext context,
    DashboardViewModel viewModel,
  ) {
    showDialog(
      context: context,
      builder: (context) => ListenableBuilder(
        listenable: viewModel.emergencyStopCommand,
        builder: (context, _) {
          return AlertDialog(
            title: const Text('EMERGENCY STOP'),
            content: const Text(
              'Are you sure you want to trigger an immediate emergency stop?',
            ),
            actions: [
              TextButton(
                onPressed: viewModel.emergencyStopCommand.running
                    ? null
                    : () => Navigator.pop(context),
                child: const Text('CANCEL'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.accentError,
                ),
                onPressed: viewModel.emergencyStopCommand.running
                    ? null
                    : () async {
                        final result = await viewModel.emergencyStop();
                        if (context.mounted) {
                          switch (result) {
                            case Ok():
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Emergency Stop Engaged'),
                                  backgroundColor: AppTheme.accentError,
                                ),
                              );
                              break;
                            case Error(error: final e):
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Failed to stop: $e')),
                              );
                              break;
                          }
                        }
                      },
                child: viewModel.emergencyStopCommand.running
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      )
                    : const Text(
                        'EMERGENCY STOP',
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.primaryColor.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppTheme.primaryColor : Colors.white54,
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white54,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            if (isSelected) ...[
              const Spacer(),
              Container(
                width: 4,
                height: 20,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
