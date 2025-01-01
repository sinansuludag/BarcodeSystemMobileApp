import 'dart:async';
import 'package:barcode_system_app/features/addUpdateProduct/presentation/state_management/provider/all_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerScreen extends ConsumerStatefulWidget {
  @override
  _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends ConsumerState<BarcodeScannerScreen> {
  Timer? _timer;
  bool _isScanning = true;

  @override
  void initState() {
    super.initState();

    // 5 saniye sonra taramayı durdur.
    _timer = Timer(Duration(seconds: 5), () {
      if (_isScanning) {
        _isScanning = false; // Taramayı durdur
        _showTimeoutMessage(); // Süre dolduğunda mesaj göster
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Timer'ı temizle
    super.dispose();
  }

  void _showTimeoutMessage() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Süre Doldu"),
        content: Text("Barkod taraması süresi doldu. Tekrar deneyin."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Uyarı penceresini kapat
              Navigator.pop(context); // Barkod tarayıcıdan çık
            },
            child: Text("Tamam"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final barcodeProvider = ref.read(productBarcodeProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Barkod Tarayıcı'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: MobileScanner(
        onDetect: (barcode) {
          if (!_isScanning) return; // Tarama süresi dolduysa işlem yapma

          if (barcode.barcodes.isNotEmpty) {
            final rawValue = barcode.barcodes.first.rawValue;
            if (rawValue != null) {
              _isScanning = false; // Taramayı durdur
              _timer?.cancel(); // Timer'ı temizle
              barcodeProvider.state = rawValue; // Barkodu provider'a yaz
              Navigator.pop(context); // Tarayıcıdan çık
            }
          }
        },
      ),
    );
  }
}
