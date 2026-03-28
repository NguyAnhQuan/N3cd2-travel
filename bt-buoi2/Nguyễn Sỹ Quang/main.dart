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
        primarySwatch: Colors.deepOrange,
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
        backgroundColor: Colors.orange[50], // Nền cam nhạt
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.deepOrange[800]),
          onPressed: () {},
        ),
        title: Row(
          children: [
            Text(
              'Máy tính lãi suất',
              style: TextStyle(
                color: Colors.deepOrange[800], 
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.deepOrange[800]),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.deepOrange[800]),
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
                  width: 130,
                  child: Text(
                    'Số tiền', 
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.deepOrange, width: 2.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
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
                  width: 130,
                  child: Text(
                    'Lãi hàng năm (%)', 
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _rateController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.deepOrange, width: 2.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),
            
            // Dòng: Kết quả
            Row(
              children: [
                const Text(
                  'Số năm để tiền tăng gấp đôi: ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  _result,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange[700], // Kết quả nổi bật với màu cam đậm
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            
            // Nút Tính toán
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange, 
                  foregroundColor: Colors.white, 
                  shape: const StadiumBorder(), // Nút bo tròn hoàn toàn dạng viên thuốc
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  elevation: 3,
                ),
                onPressed: _calculate,
                child: const Text(
                  'Tính toán', 
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}