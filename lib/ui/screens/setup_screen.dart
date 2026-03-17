import 'package:flutter/material.dart';
import '../../viewmodels/setup_view_model.dart';
import '../../domain/models/models.dart';
import '../../domain/commands/result.dart';
import '../theme/app_theme.dart';

class SetupScreen extends StatelessWidget {
  final SetupViewModel viewModel;

  const SetupScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        final settings = viewModel.settings;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Configuration',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Row(
                    children: [
                      ListenableBuilder(
                        listenable: viewModel.loadSettingsCommand,
                        builder: (context, _) {
                          return OutlinedButton.icon(
                            onPressed: viewModel.loadSettingsCommand.running
                                ? null
                                : () => viewModel.loadSettingsCommand.execute(),
                            icon: viewModel.loadSettingsCommand.running
                                ? const SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Icon(Icons.file_open),
                            label: const Text('LOAD'),
                          );
                        },
                      ),
                      const SizedBox(width: 12),
                      OutlinedButton.icon(
                        onPressed: viewModel.resetToDefault,
                        icon: const Icon(Icons.refresh),
                        label: const Text('RESET'),
                      ),
                      const SizedBox(width: 12),
                      ListenableBuilder(
                        listenable: viewModel.saveSettingsCommand,
                        builder: (context, _) {
                          return ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primaryColor,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: viewModel.saveSettingsCommand.running
                                ? null
                                : () async {
                                    final result = await viewModel.save();
                                    if (context.mounted) {
                                      switch (result) {
                                        case Ok():
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text('Settings saved'),
                                            ),
                                          );
                                          break;
                                        case Error(error: final e):
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text('Error: $e'),
                                              backgroundColor:
                                                  AppTheme.accentError,
                                            ),
                                          );
                                          break;
                                      }
                                    }
                                  },
                            icon: viewModel.saveSettingsCommand.running
                                ? const SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                  )
                                : const Icon(Icons.save),
                            label: const Text('SAVE'),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildPresets(viewModel),
              const SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildSection(context, 'Temperature Settings', [
                      _buildSlider(
                        context,
                        'Cold Bath Temp',
                        settings.coldBathTemp,
                        0,
                        20,
                        (v) => viewModel.updateSettings(
                          settings.copyWith(coldBathTemp: v),
                        ),
                        '°C',
                      ),
                      _buildSlider(
                        context,
                        'Hot Bath Temp',
                        settings.hotBathTemp,
                        40,
                        95,
                        (v) => viewModel.updateSettings(
                          settings.copyWith(hotBathTemp: v),
                        ),
                        '°C',
                      ),
                      _buildSlider(
                        context,
                        'Tolerance',
                        settings.temperatureTolerance,
                        0.1,
                        5.0,
                        (v) => viewModel.updateSettings(
                          settings.copyWith(temperatureTolerance: v),
                        ),
                        '°C',
                      ),
                    ]),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _buildSection(context, 'Timing Settings', [
                      _buildSlider(
                        context,
                        'Dwell Time',
                        settings.dwellTimeSeconds.toDouble(),
                        1,
                        300,
                        (v) => viewModel.updateSettings(
                          settings.copyWith(dwellTimeSeconds: v.toInt()),
                        ),
                        's',
                      ),
                      _buildSlider(
                        context,
                        'Transfer Time',
                        settings.transferTimeSeconds.toDouble(),
                        1,
                        60,
                        (v) => viewModel.updateSettings(
                          settings.copyWith(transferTimeSeconds: v.toInt()),
                        ),
                        's',
                      ),
                      _buildSlider(
                        context,
                        'Draining Time',
                        settings.drainingTimeSeconds.toDouble(),
                        0,
                        60,
                        (v) => viewModel.updateSettings(
                          settings.copyWith(drainingTimeSeconds: v.toInt()),
                        ),
                        's',
                      ),
                    ]),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildSection(context, 'Cycle Settings', [
                      _buildSlider(
                        context,
                        'Number of Cycles',
                        settings.targetCycles.toDouble(),
                        1,
                        10000,
                        (v) => viewModel.updateSettings(
                          settings.copyWith(targetCycles: v.toInt()),
                        ),
                        '',
                      ),
                    ]),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _buildSummaryCard(context, settings, viewModel),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPresets(SetupViewModel viewModel) {
    return Row(
      children: [
        const Text(
          'PRESETS: ',
          style: TextStyle(
            color: Colors.white38,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        _PresetButton(
          label: 'ISO Standard 5–55°C',
          onTap: () => viewModel.updateSettings(
            const ThermocycleSettings(
              coldBathTemp: 5,
              hotBathTemp: 55,
              targetCycles: 10000,
            ),
          ),
        ),
        const SizedBox(width: 12),
        _PresetButton(
          label: '37°C Storage Pre-set',
          onTap: () => viewModel.updateSettings(
            const ThermocycleSettings(
              coldBathTemp: 37,
              hotBathTemp: 37,
              dwellTimeSeconds: 3600,
              targetCycles: 24,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 24),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildSlider(
    BuildContext context,
    String label,
    double value,
    double min,
    double max,
    ValueChanged<double> onChanged,
    String unit,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: const TextStyle(color: Colors.white70)),
              Text(
                '${value.toStringAsFixed(1)}$unit',
                style: const TextStyle(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Slider(
            value: value,
            min: min,
            max: max,
            activeColor: AppTheme.primaryColor,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(
    BuildContext context,
    ThermocycleSettings settings,
    SetupViewModel viewModel,
  ) {
    final duration = settings.estimatedDuration;
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);

    return Card(
      color: AppTheme.primaryColor.withValues(alpha: 0.1),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Run Summary',
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            _buildSummaryItem('Estimated Duration', '${hours}h ${minutes}m'),
            _buildSummaryItem('Total Cycles', '${settings.targetCycles}'),
            _buildSummaryItem(
              'Temp Range',
              '${settings.coldBathTemp}°C - ${settings.hotBathTemp}°C',
            ),
            const SizedBox(height: 32),
            ListenableBuilder(
              listenable: viewModel.startCommand,
              builder: (context, _) {
                return ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                  ),
                  onPressed: viewModel.startCommand.running
                      ? null
                      : viewModel.start,
                  icon: viewModel.startCommand.running
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
                      : const Icon(Icons.play_arrow),
                  label: const Text('START RUN NOW'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white54)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _PresetButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _PresetButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white70,
        side: const BorderSide(color: Colors.white10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      onPressed: onTap,
      child: Text(label, style: const TextStyle(fontSize: 12)),
    );
  }
}
