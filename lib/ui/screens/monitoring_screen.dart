import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/rendering.dart';
import '../../domain/models/models.dart';
import '../../viewmodels/monitoring_view_model.dart';
import '../theme/app_theme.dart';

class MonitoringScreen extends StatelessWidget {
  final MonitoringViewModel viewModel;

  const MonitoringScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        final history = viewModel.tempHistory;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Real-time Monitoring', style: Theme.of(context).textTheme.displayLarge),
                Row(
                  children: [
                                    _buildSensorIndicator(viewModel.status.temp1Sensor),
                    const SizedBox(width: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppTheme.primaryColor.withValues(alpha: 0.5)),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => _resetCount(context),
                            icon: const Icon(
                              Icons.touch_app,
                              color: AppTheme.primaryColor,
                              size: 20,
                            ),
                            tooltip: 'Reset Hit Count',
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Hits: ${viewModel.status.hitCount}',
                            style: const TextStyle(
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Temperature Variation History',
                        style: TextStyle(color: Colors.white54, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 40),
                      Expanded(
                        child: history.length < 2
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.analytics_outlined, size: 48, color: Colors.white24),
                                    const SizedBox(height: 16),
                                    const Text(
                                      'Waiting for monitoring data...\nStart a process to begin tracking.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white24),
                                    ),
                                  ],
                                ),
                              )
                            : LineChart(
                                LineChartData(
                                  minY: 0,
                                  maxY: 70,
                                  minX: 0,
                                  maxX: 100,
                                  gridData: const FlGridData(
                                    show: true,
                                    drawVerticalLine: false,
                                    horizontalInterval: 10,
                                  ),
                                  titlesData: FlTitlesData(
                                    show: true,
                                    bottomTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        reservedSize: 40,
                                        interval: 20,
                                        getTitlesWidget: (value, meta) {
                                          return Text(
                                            '${value.toStringAsFixed(1)}°',
                                            style: const TextStyle(
                                              color: Colors.white24,
                                              fontSize: 12,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    rightTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    topTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                  ),
                                  borderData: FlBorderData(show: false),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: history
                                          .asMap()
                                          .entries
                                          .map((e) => FlSpot(e.key.toDouble(), e.value))
                                          .toList(),
                                      isCurved: true,
                                      color: AppTheme.primaryColor,
                                       barWidth: 3,
                                      isStrokeCapRound: true,
                                      dotData: const FlDotData(show: false),
                                      belowBarData: BarAreaData(
                                        show: true,
                                        color: AppTheme.primaryColor.withValues(alpha: 0.1),
                                      ),
                                    ),
                                  ],
                                  lineTouchData: LineTouchData(
                                    enabled: true,
                                    touchTooltipData: LineTouchTooltipData(
                                      getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                                        return lineBarsSpot.map((lineBarSpot) {
                                          return LineTooltipItem(
                                            '${lineBarSpot.y.toStringAsFixed(1)}°C',
                                            const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          );
                                        }).toList();
                                      },
                                      fitInsideHorizontally: true,
                                      fitInsideVertically: true,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildLogPanel(context),
          ],
        );
      },
    );
  }

  void _resetCount(BuildContext context) {
    // viewModel.resetHitCount();
    _showResetDoneSnackbar(context);
  }

  void _showResetDoneSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Reset Done'),
        backgroundColor: AppTheme.accentReady,
        duration: Duration(seconds: 2),
      ),
    );
  }

  Widget _buildSensorIndicator(Sensor sensor) {
    // double temp = 0.0;
    // if (sensor.value is DoubleValue) {
    //   temp = (sensor.value as DoubleValue).value;
    // }
    Color color = AppTheme.primaryColor;
    String tooltipMsg = 'Normal';

    // if (temp < 0 || temp > 100) {
    if (sensor.status == SensorStatus.faulty) {
      color = Colors.yellow;
      tooltipMsg = 'Sensor failure';
    } else if (sensor.status == SensorStatus.overlimit) {
      color = Colors.red;
      tooltipMsg = 'Over limit';
    }

    return Tooltip(
      message: tooltipMsg,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.5)),
        ),
        child:
            // Row(
            //   children: [
            //     Icon(Icons.thermostat, color: color, size: 20),
            //     const SizedBox(width: 8),
            //     Text(
            //       '${sensor.name}: ${(sensor.value as DoubleValue).value.toStringAsFixed(1)}°C',
            //       style: TextStyle(
            //         color: color,
            //         fontWeight: FontWeight.bold,
            //         fontSize: 16,
            //       ),
            //     ),
            //   ],
            // ),
            _buildInfoItem(color, sensor.name, sensor.type, sensor.value ?? DoubleValue(0.0)),
      ),
    );
  }

  Widget _buildInfoItem(Color color, String label, SensorType type, SensorValue value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white54, fontSize: 10, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Icon(_iconForSensorType(type), color: color, size: 20),
            const SizedBox(width: 8),
            Text(
              _formatSensorValue(type, value),
              style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }

  String _formatSensorValue(SensorType type, SensorValue value) {
    // Safely extract numeric value when possible
    double? numeric;
    if (value is DoubleValue) numeric = value.value;

    switch (type) {
      case SensorType.temperature:
        return numeric != null ? '${numeric.toStringAsFixed(1)}°C' : value.toString();
      case SensorType.level:
        return numeric != null ? '${numeric.toStringAsFixed(1)} cm' : value.toString();
      case SensorType.flow:
        return numeric != null ? '${numeric.toStringAsFixed(1)} L/min' : value.toString();
      default:
        return numeric != null ? numeric.toStringAsFixed(1) : value.toString();
    }
  }

  IconData _iconForSensorType(SensorType type) {
    switch (type) {
      case SensorType.temperature:
        return Icons.thermostat;
      case SensorType.level:
        return Icons.opacity; // water/level
      case SensorType.flow:
        return Icons.speed; // flow indicator
      default:
        return Icons.device_unknown;
    }
  }

  Widget _buildLogPanel(BuildContext context) {
    return Card(
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'System Log',
              style: TextStyle(color: Colors.white54, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: const [
                  _LogEntry(time: '14:32:01', message: 'System initialized', level: 'INFO'),
                  _LogEntry(
                    time: '14:32:05',
                    message: 'Cold bath stabilization started',
                    level: 'INFO',
                  ),
                  _LogEntry(time: '14:45:12', message: 'Ready for operation', level: 'INFO'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LogEntry extends StatelessWidget {
  final String time;
  final String message;
  final String level;

  const _LogEntry({required this.time, required this.message, required this.level});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            time,
            style: const TextStyle(color: Colors.white38, fontFamily: 'monospace'),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(level, style: const TextStyle(fontSize: 10, color: Colors.blue)),
          ),
          const SizedBox(width: 16),
          Text(message, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
