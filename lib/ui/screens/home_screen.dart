import 'package:flutter/material.dart';
import '../../viewmodels/home_view_model.dart';
import '../../domain/models/models.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomeScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        final status = viewModel.status;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Operational Dashboard',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: _buildTempCard(
                      context,
                      'Cold Bath',
                      status.currentColdBathTemp,
                      AppTheme.accentRunning,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _buildTempCard(
                      context,
                      'Hot Bath',
                      status.currentHotBathTemp,
                      AppTheme.accentError,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _buildTempCard(
                      context,
                      'Chamber',
                      status.currentChamberTemp,
                      AppTheme.accentWarning,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: _buildProgressCard(context, status)),
                  const SizedBox(width: 24),
                  Expanded(
                    flex: 1,
                    child: _buildControlsCard(context, viewModel, status),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTempCard(
    BuildContext context,
    String title,
    double temp,
    Color color,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '${temp.toStringAsFixed(1)}°C',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 48,
                    color: color,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.thermostat,
                  color: color.withValues(alpha: 0.5),
                  size: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressCard(BuildContext context, DeviceStatus status) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Run Progress',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildProgressStat(
                  context,
                  'Cycle',
                  '${status.currentCycle} / ${status.mode == OperationMode.thermocycle ? "5000" : "-"}',
                ),
                _buildProgressStat(
                  context,
                  'Remaining',
                  status.remainingTime.toString().split('.').first,
                ),
              ],
            ),
            const SizedBox(height: 24),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: status.progress,
                minHeight: 20,
                backgroundColor: Colors.white10,
                color: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${(status.progress * 100).toInt()}% Complete',
                style: const TextStyle(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressStat(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white38, fontSize: 12),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24),
        ),
      ],
    );
  }

  Widget _buildControlsCard(
    BuildContext context,
    HomeViewModel viewModel,
    DeviceStatus status,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Controls',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            if (status.state == DeviceState.ready ||
                status.state == DeviceState.error)
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                ),
                onPressed: viewModel.start,
                icon: const Icon(Icons.play_arrow),
                label: const Text('START RUN'),
              ),
            if (status.state == DeviceState.running ||
                status.state == DeviceState.paused) ...[
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.accentWarning,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                ),
                onPressed: viewModel.pauseResume,
                icon: Icon(
                  status.state == DeviceState.paused
                      ? Icons.play_arrow
                      : Icons.pause,
                ),
                label: Text(
                  status.state == DeviceState.paused ? 'RESUME' : 'PAUSE',
                ),
              ),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  side: const BorderSide(color: AppTheme.accentError),
                  foregroundColor: AppTheme.accentError,
                ),
                onPressed: viewModel.stop,
                icon: const Icon(Icons.stop),
                label: const Text('STOP'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
