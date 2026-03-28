import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const InterestCalculatorApp());
}

class InterestCalculatorApp extends StatelessWidget {
  const InterestCalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Máy tính lãi suất',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  
  String _result = "";

  void _calculate() {
    // Ẩn bàn phím khi bấm tính toán
    FocusScope.of(context).unfocus();

    double? amount = double.tryParse(_amountController.text);
    double? rate = double.tryParse(_rateController.text);

    if (amount == null || amount <= 0) {
      setState(() {
        _result = "Vui lòng nhập số tiền hợp lệ.";
      });
      return;
    }

    if (rate == null || rate <= 0) {
      setState(() {
        _result = "Vui lòng nhập lãi suất hợp lệ.";
      });
      return;
    }

    // Tính thời gian để tiền gấp đôi: t = log(2) / log(1 + r)
    // r là lãi suất dạng thập phân (ví dụ: 8% = 0.08)
    double decimalRate = rate / 100;
    double yearsToDouble = log(2) / log(1 + decimalRate);

    setState(() {
      _result = "${yearsToDouble.toStringAsFixed(2)} năm";
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    _rateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: Row(
          children: const [
            Text(
              'Máy tính lãi suất',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.black),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dòng: Số tiền
            Row(
              children: [
                const SizedBox(
                  width: 120,
                  child: Text('Số tiền', style: TextStyle(fontSize: 16)),
                ),
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Dòng: Lãi hàng năm
            Row(
              children: [
                const SizedBox(
                  width: 120,
                  child: Text('Lãi hàng năm (%)', style: TextStyle(fontSize: 16)),
                ),
                Expanded(
                  child: TextField(
                    controller: _rateController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            
            // Dòng: Kết quả
            Row(
              children: [
                const Text(
                  'Số năm để tiền tăng gấp đôi: ',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  _result,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Nút Tính toán
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.black),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                onPressed: _calculate,
                child: const Text('Tính toán', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}