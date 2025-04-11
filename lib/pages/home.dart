// home.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatelessWidget {
  final String? token;

  const HomePage({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      appBar: AppBar(
        title: const Text('Dashboard Financeiro'),
        backgroundColor: const Color(0xFF18428F),
        actions: token == null
            ? [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ]
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (token == null) ...[
              const Text(
                'Você está visualizando como visitante.',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Fazer login'),
              ),
              const SizedBox(height: 24),
            ],
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPieChart(title: 'Receitas', data: receitaData, color: Colors.green),
                _buildPieChart(title: 'Despesas', data: despesaData, color: Colors.red),
              ],
            ),
            const SizedBox(height: 24),
            if (token != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton(context, label: '+ Receita', color: Colors.green, onPressed: () {}),
                  _buildButton(context, label: '+ Despesa', color: Colors.red, onPressed: () {}),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPieChart({
    required String title,
    required List<PieChartSectionData> data,
    required Color color,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 120,
          height: 120,
          child: PieChart(
            PieChartData(sections: data, centerSpaceRadius: 24, sectionsSpace: 2),
          ),
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context,
      {required String label, required Color color, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(label),
    );
  }

  List<PieChartSectionData> get receitaData => [
    PieChartSectionData(color: Colors.green[300], value: 40, title: 'Salário', radius: 30, titleStyle: const TextStyle(fontSize: 12, color: Colors.white)),
    PieChartSectionData(color: Colors.green[600], value: 30, title: 'Freela', radius: 30, titleStyle: const TextStyle(fontSize: 12, color: Colors.white)),
    PieChartSectionData(color: Colors.green[800], value: 30, title: 'Outros', radius: 30, titleStyle: const TextStyle(fontSize: 12, color: Colors.white)),
  ];

  List<PieChartSectionData> get despesaData => [
    PieChartSectionData(color: Colors.red[300], value: 50, title: 'Comida', radius: 30, titleStyle: const TextStyle(fontSize: 12, color: Colors.white)),
    PieChartSectionData(color: Colors.red[600], value: 25, title: 'Transporte', radius: 30, titleStyle: const TextStyle(fontSize: 12, color: Colors.white)),
    PieChartSectionData(color: Colors.red[800], value: 25, title: 'Outros', radius: 30, titleStyle: const TextStyle(fontSize: 12, color: Colors.white)),
  ];
}
