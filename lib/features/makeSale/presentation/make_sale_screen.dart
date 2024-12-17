import 'package:barcode_system_app/common_widgets/custom_text_form_field.dart';
import 'package:barcode_system_app/core/constants/border_radius/border_radius.dart';
import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:flutter/material.dart';

class MakeSaleScreen extends StatefulWidget {
  const MakeSaleScreen({super.key});

  @override
  State<MakeSaleScreen> createState() => _MakeSaleScreenState();
}

class _MakeSaleScreenState extends State<MakeSaleScreen> {
  final formKey = GlobalKey<FormState>();
  final barcodController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Satış Yap"),
        centerTitle: true,
        actions: const [
          Icon(Icons.percent),
          SizedBox(width: 10),
          Icon(Icons.add),
          SizedBox(width: 10),
          Icon(Icons.print),
          SizedBox(width: 10),
          Icon(Icons.more_vert),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          // Ekrana tıklanırsa klavye kapanacak
          FocusScope.of(context).unfocus();
        },
        child: Form(
          child: Column(
            children: [
              // Üst Bilgi: Miktar, Brüt, İskonto, Tutar
              Container(
                padding: AppPaddings.allLowPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Column(
                      children: [
                        Text("Miktar",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("0.00"),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Brüt",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("0.00"),
                      ],
                    ),
                    Column(
                      children: [
                        Text("İskonto",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("0.00"),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Tutar",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("0.00"),
                      ],
                    ),
                  ],
                ),
              ),
              // Barkod ve Tarama Butonu
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                          prefixIcon: Icon(Icons.search),
                          labelText: '',
                          hintText: "Ürün barkodunu okutunuz",
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          controller: barcodController),
                    ),
                    const SizedBox(width: 4),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 20),
                      ),
                      child: Row(
                        spacing: 8,
                        children: [
                          Icon(
                            Icons.qr_code_scanner,
                            color: colorScheme.onPrimary,
                          ),
                          Text("Tara", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Ürün Listesi
              Expanded(
                child: ListView(
                  children: [
                    buildProductTile("Ülker Metro Bar 36 Gr", "8690504035909",
                        2, 10.00, 20.00),
                    buildProductTile("Ülker Çizi Kraker 70 Gr", "154552451458",
                        3, 7.00, 21.00),
                    buildProductTile("Badempınarı 0,5 Yeni", "5897758441259", 2,
                        5.00, 10.00),
                  ],
                ),
              ),
              // Müşteri ve Satış Notu
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.grey.shade100,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person_outline),
                      title: const Text("Müşterisiz satış"),
                      subtitle: const Text("Borç: 0.00"),
                      trailing: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {},
                      ),
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: "Satış notu",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        const Text("Fiyat detayını gör"),
                        const Spacer(),
                        Checkbox(value: false, onChanged: (value) {}),
                        const Text("İade modu"),
                      ],
                    ),
                  ],
                ),
              ),
              // Ödeme Butonları
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildPaymentButton("Nakit"),
                    buildPaymentButton("Pos"),
                    buildPaymentButton("Açık Hesap"),
                    buildPaymentButton("Parçalı"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Ürün Listesi Satırı
  Widget buildProductTile(String name, String barcode, int quantity,
      double unitPrice, double totalPrice) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: AppBorderRadius.defaultBorderRadius,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$quantity X",
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontSize: 16)),
              Text(barcode,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("${totalPrice.toStringAsFixed(2)} ₺",
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text("${unitPrice.toStringAsFixed(2)} ₺",
                  style: TextStyle(color: Colors.grey.shade600)),
            ],
          ),
        ],
      ),
    );
  }

  // Ödeme Butonları
  Widget buildPaymentButton(String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade300,
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
          child: Text(label, style: const TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
