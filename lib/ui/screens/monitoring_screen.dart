import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../viewmodels/monitoring_view_model.dart';
import '../theme/app_theme.dart';

class MonitoringScreen extends StatelessWidget {
  const MonitoringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MonitoringViewModel>();
    final history = viewModel.tempHistory;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Real-time Monitoring',
          style: Theme.of(context).textTheme.displayLarge,
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
                    style: TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                    child: LineChart(
                      LineChartData(
                        gridData: const FlGridData(
                          show: true,
                          drawVerticalLine: false,
                        ),
                        titlesData: const FlTitlesData(
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: AxisTitles(
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
                            barWidth: 4,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              color: AppTheme.primaryColor.withValues(
                                alpha: 0.1,
                              ),
                            ),
                          ),
                        ],
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
              style: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: const [
                  _LogEntry(
                    time: '14:32:01',
                    message: 'System initialized',
                    level: 'INFO',
                  ),
                  _LogEntry(
                    time: '14:32:05',
                    message: 'Cold bath stabilization started',
                    level: 'INFO',
                  ),
                  _LogEntry(
                    time: '14:45:12',
                    message: 'Ready for operation',
                    level: 'INFO',
                  ),
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

  const _LogEntry({
    required this.time,
    required this.message,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            time,
            style: const TextStyle(
              color: Colors.white38,
              fontFamily: 'monospace',
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              level,
              style: const TextStyle(fontSize: 10, color: Colors.blue),
            ),
          ),
          const SizedBox(width: 16),
          Text(message, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
