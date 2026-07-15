import 'package:flutter/material.dart';
import '../../viewmodels/constant_mode_view_model.dart';
import '../../domain/models/models.dart';
import '../../domain/commands/result.dart';
import '../theme/app_theme.dart';

class ConstantModeScreen extends StatelessWidget {
  final ConstantModeViewModel viewModel;

  const ConstantModeScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
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
                              value: settings.targetTemp.clamp(20, 60),
                              min: 20,
                              max: 60,
                              onChanged: isRunning
                                  ? null
                                  : (v) => viewModel.updateSettings(
                                      settings.copyWith(targetTemp: v),
                                    ),
                            ),
                            const SizedBox(height: 24),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Duration ',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                    settings.isInfinite ? '' : '${settings.duration.toString().split('.').first} hrs',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.primaryColor,
                                  ),
                                ),
                              ],
                            ),

                            Slider(
                              value: settings.duration.inHours.toDouble().clamp(0.0, 24.0),
                              min: 0,
                              max: 24,
                              onChanged: (isRunning || settings.isInfinite)
                                  ? null
                                  : (v) => viewModel.updateSettings(
                                        settings.copyWith(
                                          duration: Duration(hours: v.toInt(), minutes: ((v - v.toInt()) * 60).round()),
                                        ),
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
                              ListenableBuilder(
                                listenable: viewModel.startCommand,
                                builder: (context, _) {
                                  return ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppTheme.primaryColor,
                                      foregroundColor: Colors.white,
                                      minimumSize: const Size(
                                        double.infinity,
                                        60,
                                      ),
                                    ),
                                    onPressed: viewModel.startCommand.running
                                        ? null
                                        : () async {
                                            final result = await viewModel
                                                .start();
                                            if (context.mounted) {
                                              switch (result) {
                                                case Ok():
                                                  break;
                                                case Error(error: final e):
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Error: $e',
                                                      ),
                                                    ),
                                                  );
                                                  break;
                                              }
                                            }
                                          },
                                    icon: viewModel.startCommand.running
                                        ? const SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                    Colors.white,
                                                  ),
                                            ),
                                          )
                                        : const Icon(Icons.play_arrow),
                                    label: const Text('START CONSTANT MODE'),
                                  );
                                },
                              )
                            else
                              ListenableBuilder(
                                listenable: viewModel.stopCommand,
                                builder: (context, _) {
                                  return OutlinedButton.icon(
                                    style: OutlinedButton.styleFrom(
                                      minimumSize: const Size(
                                        double.infinity,
                                        60,
                                      ),
                                      side: const BorderSide(
                                        color: AppTheme.accentError,
                                      ),
                                      foregroundColor: AppTheme.accentError,
                                    ),
                                    onPressed: viewModel.stopCommand.running
                                        ? null
                                        : () async {
                                            final result = await viewModel
                                                .stop();
                                            if (context.mounted) {
                                              switch (result) {
                                                case Ok():
                                                  break;
                                                case Error(error: final e):
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Error: $e',
                                                      ),
                                                    ),
                                                  );
                                                  break;
                                              }
                                            }
                                          },
                                    icon: viewModel.stopCommand.running
                                        ? const SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                    AppTheme.accentError,
                                                  ),
                                            ),
                                          )
                                        : const Icon(Icons.stop),
                                    label: const Text('STOP'),
                                  );
                                },
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
                        // const SizedBox(height: 68),
                        _buildStatusCard(context, status),
                        const SizedBox(height: 48),
                        _buildStabilityIndicator(context, status),


                        const SizedBox(height: 48),
                        SwitchListTile(
                          title: const Text('Timer On/Off'),
                          subtitle: const Text(
                            'Track elapsed time in constant mode',
                          ),
                          value: viewModel.timerEnabled,
                          onChanged: (v) => viewModel.setTimerEnabled(v),
                        ),
                        if (viewModel.timerEnabled || viewModel.elapsedTime != Duration.zero) ...[
                          const SizedBox(height: 16),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.primaryColor.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppTheme.primaryColor.withValues(alpha: 0.3),
                                ),
                              ),
                              child: Text(
                                _formatDuration(viewModel.elapsedTime),
                                style: const TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryColor,
                                  fontFamily: 'monospace',
                                ),
                              ),
                            ),
                          ),
                        ],

                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
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

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }
}
