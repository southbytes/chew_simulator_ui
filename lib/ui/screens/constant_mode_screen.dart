import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/constant_mode_view_model.dart';
import '../../domain/models/models.dart';
import '../theme/app_theme.dart';

class ConstantModeScreen extends StatelessWidget {
  const ConstantModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ConstantModeViewModel>();
    final settings = viewModel.settings;
    final status = viewModel.status;
    final isRunning =
        status.mode == OperationMode.constant &&
        status.state == DeviceState.running;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '37°C Constant Mode',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 32),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Target Settings',
                          style: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Target Temperature',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              '${settings.targetTemp.toStringAsFixed(1)}°C',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Slider(
                          value: settings.targetTemp,
                          min: 20,
                          max: 60,
                          onChanged: isRunning
                              ? null
                              : (v) => viewModel.updateSettings(
                                  settings.copyWith(targetTemp: v),
                                ),
                        ),
                        const SizedBox(height: 24),
                        SwitchListTile(
                          title: const Text('Infinite Hold'),
                          subtitle: const Text(
                            'Maintain temperature until manual stop',
                          ),
                          value: settings.isInfinite,
                          onChanged: isRunning
                              ? null
                              : (v) => viewModel.updateSettings(
                                  settings.copyWith(isInfinite: v),
                                ),
                        ),
                        const SizedBox(height: 40),
                        if (!isRunning)
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primaryColor,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(double.infinity, 60),
                            ),
                            onPressed: viewModel.start,
                            icon: const Icon(Icons.play_arrow),
                            label: const Text('START CONSTANT MODE'),
                          )
                        else
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 60),
                              side: const BorderSide(
                                color: AppTheme.accentError,
                              ),
                              foregroundColor: AppTheme.accentError,
                            ),
                            onPressed: viewModel.stop,
                            icon: const Icon(Icons.stop),
                            label: const Text('STOP'),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  children: [
                    _buildStatusCard(context, status),
                    const SizedBox(height: 24),
                    _buildStabilityIndicator(context, status),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCard(BuildContext context, DeviceStatus status) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const Text(
              'Current Temperature',
              style: TextStyle(color: Colors.white54),
            ),
            const SizedBox(height: 16),
            Text(
              '${status.currentChamberTemp.toStringAsFixed(2)}°C',
              style: Theme.of(
                context,
              ).textTheme.displayLarge?.copyWith(fontSize: 64),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStabilityIndicator(BuildContext context, DeviceStatus status) {
    final isStable = (status.currentChamberTemp - 37.0).abs() < 0.2;
    return Card(
      color: isStable
          ? Colors.green.withValues(alpha: 0.1)
          : Colors.orange.withValues(alpha: 0.1),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Icon(
              isStable ? Icons.verified : Icons.hourglass_empty,
              color: isStable ? Colors.green : Colors.orange,
            ),
            const SizedBox(width: 16),
            Text(
              isStable ? 'Temperature Stable' : 'Stabilizing...',
              style: TextStyle(
                color: isStable ? Colors.green : Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
