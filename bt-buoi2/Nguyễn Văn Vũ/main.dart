import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MayTinhLaiSuatApp());
}

class MayTinhLaiSuatApp extends StatelessWidget {
  const MayTinhLaiSuatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Máy tính lãi suất',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const InterestCalculatorPage(),
    );
  }
}

class InterestCalculatorPage extends StatefulWidget {
  const InterestCalculatorPage({super.key});

  @override
  State<InterestCalculatorPage> createState() => _InterestCalculatorPageState();
}

class _InterestCalculatorPageState extends State<InterestCalculatorPage> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();

  String _yearsToDoubleText = '';

  static const int _kAppBarGrey = 0xFFE8E8E8;

  @override
  void dispose() {
    _amountController.dispose();
    _rateController.dispose();
    super.dispose();
  }

  /// Số năm để vốn gấp đôi với lãi kép: n = ln(2) / ln(1 + r), r là lãi dạng thập phân.
  double? _computeYearsToDouble(double annualPercent) {
    if (annualPercent <= 0) return null;
    final r = annualPercent / 100.0;
    return math.log(2) / math.log(1 + r);
  }

  void _onCalculate() {
    final rateStr = _rateController.text.trim().replaceAll(',', '.');
    final rate = double.tryParse(rateStr);

    if (rate == null || rate <= 0) {
      setState(() => _yearsToDoubleText = '');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nhập lãi hàng năm hợp lệ (số dương).')),
      );
      return;
    }

    final years = _computeYearsToDouble(rate);
    setState(() {
      if (years == null) {
        _yearsToDoubleText = '';
      } else {
        _yearsToDoubleText = years.toStringAsFixed(2);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(_kAppBarGrey),
        foregroundColor: Colors.black87,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
          tooltip: 'Menu',
        ),
        centerTitle: true,
        title: InkWell(
          onTap: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Máy tính lãi suất'),
              const Icon(Icons.arrow_drop_down, size: 28),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
            tooltip: 'Thêm',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _LabeledFieldRow(
              label: 'Số tiền',
              child: TextField(
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d.,]')),
                ],
                decoration: const InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                ),
              ),
            ),
            const SizedBox(height: 12),
            _LabeledFieldRow(
              label: 'Lãi hàng năm',
              child: TextField(
                controller: _rateController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d.,]')),
                ],
                decoration: const InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  hintText: '%',
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Số năm để tiền tăng gấp đôi',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      _yearsToDoubleText.isEmpty ? '—' : _yearsToDoubleText,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton(
                onPressed: _onCalculate,
                child: const Text('Tính toán'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LabeledFieldRow extends StatelessWidget {
  const _LabeledFieldRow({
    required this.label,
    required this.child,
  });

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 3,
          child: child,
        ),
      ],
    );
  }
}
