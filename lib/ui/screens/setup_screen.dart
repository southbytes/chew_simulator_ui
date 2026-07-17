import 'package:flutter/material.dart';
import '../../viewmodels/setup_view_model.dart';
import '../../domain/models/models.dart';
import '../../domain/commands/result.dart';
import '../theme/app_theme.dart';

class SetupScreen extends StatefulWidget {
  final SetupViewModel viewModel;

  const SetupScreen({super.key, required this.viewModel});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  int? _selectedPreset; // 0 = ISO Standard, 1 = 37°C Storage

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        final settings = widget.viewModel.settings;

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
                        listenable: widget.viewModel.loadSettingsCommand,
                        builder: (context, _) {
                          return OutlinedButton.icon(
                            onPressed: widget.viewModel.loadSettingsCommand.running
                                ? null
                                : () => widget.viewModel.loadSettingsCommand.execute(),
                            icon: widget.viewModel.loadSettingsCommand.running
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
                        onPressed: () {
                          widget.viewModel.resetToDefault();
                          setState(() => _selectedPreset = null);
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text('RESET'),
                      ),
                      const SizedBox(width: 12),
                      ListenableBuilder(
                        listenable: widget.viewModel.saveSettingsCommand,
                        builder: (context, _) {
                          return ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primaryColor,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: widget.viewModel.saveSettingsCommand.running
                                ? null
                                : () async {
                                    final result = await widget.viewModel.save();
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
                            icon: widget.viewModel.saveSettingsCommand.running
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
              _buildPresets(widget.viewModel, settings),
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
                        (v) => widget.viewModel.updateSettings(
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
                        (v) => widget.viewModel.updateSettings(
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
                        (v) => widget.viewModel.updateSettings(
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
                        (v) => widget.viewModel.updateSettings(
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
                        (v) => widget.viewModel.updateSettings(
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
                        (v) => widget.viewModel.updateSettings(
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
                        (v) => widget.viewModel.updateSettings(
                          settings.copyWith(targetCycles: v.toInt()),
                        ),
                        '',
                      ),
                    ]),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _buildSummaryCard(context, settings, widget.viewModel),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPresets(SetupViewModel viewModel, ThermocycleSettings settings) {
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
          isSelected: _selectedPreset == 0,
          onTap: () {
            viewModel.updateSettings(
              const ThermocycleSettings(
                coldBathTemp: 5,
                hotBathTemp: 55,
                targetCycles: 10000,
              ),
            );
            setState(() => _selectedPreset = 0);
          },
        ),
        const SizedBox(width: 12),
        _PresetButton(
          label: '37°C Storage Pre-set',
          isSelected: _selectedPreset == 1,
          onTap: () {
            viewModel.updateSettings(
              const ThermocycleSettings(
                coldBathTemp: 37,
                hotBathTemp: 37,
                dwellTimeSeconds: 0,
                transferTimeSeconds: 0,
                targetCycles: 0,
              ),
            );
            setState(() => _selectedPreset = 1);
          },
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
              _EditableValue(
                value: value,
                min: min,
                max: max,
                unit: unit,
                onChanged: onChanged,
              ),
            ],
          ),
          Slider(
            value: value.clamp(min, max),
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
              '${settings.coldBathTemp.toStringAsFixed(1)}°C - ${settings.hotBathTemp.toStringAsFixed(1)}°C',
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
  final bool isSelected;

  const _PresetButton({
    required this.label,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: isSelected
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryColor.withValues(alpha: 0.4),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            )
          : null,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.white70,
          backgroundColor: isSelected
              ? AppTheme.primaryColor.withValues(alpha: 0.2)
              : Colors.transparent,
          side: BorderSide(
            color: isSelected ? AppTheme.primaryColor : Colors.white10,
            width: isSelected ? 1.5 : 1.0,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected) ...[
              Icon(Icons.check_circle, size: 14, color: AppTheme.primaryColor),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EditableValue extends StatefulWidget {
  final double value;
  final double min;
  final double max;
  final String unit;
  final ValueChanged<double> onChanged;

  const _EditableValue({
    required this.value,
    required this.min,
    required this.max,
    required this.unit,
    required this.onChanged,
  });

  @override
  State<_EditableValue> createState() => _EditableValueState();
}

class _EditableValueState extends State<_EditableValue> {
  late TextEditingController _controller;
  bool _isEditing = false;
  final _focusNode = FocusNode();

  String get _formattedValue => widget.unit == '°C'
      ? widget.value.toStringAsFixed(1)
      : (widget.value % 1 == 0
          ? widget.value.toInt().toString()
          : widget.value.toStringAsFixed(1));

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _formattedValue);
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _submitValue();
      }
    });
  }

  @override
  void didUpdateWidget(covariant _EditableValue oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_isEditing && oldWidget.value != widget.value) {
      _controller.text = _formattedValue;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _submitValue() {
    final parsed = double.tryParse(_controller.text);
    if (parsed != null) {
      final clamped = parsed.clamp(widget.min, widget.max);
      widget.onChanged(clamped);
      setState(() {
        _isEditing = false;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _controller.text = _formattedValue;
        }
      });
    } else {
      _controller.text = _formattedValue;
      setState(() {
        _isEditing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isEditing) {
      return SizedBox(
        width: 80,
        height: 24,
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: AppTheme.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            isDense: true,
            suffixText: widget.unit,
            suffixStyle: const TextStyle(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppTheme.primaryColor),
            ),
          ),
          onSubmitted: (_) => _submitValue(),
        ),
      );
    }

    return InkWell(
      onTap: () {
        setState(() {
          _isEditing = true;
        });
        _focusNode.requestFocus();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$_formattedValue${widget.unit}',
            style: const TextStyle(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.edit, size: 14, color: AppTheme.primaryColor),
        ],
      ),
    );
  }
}
