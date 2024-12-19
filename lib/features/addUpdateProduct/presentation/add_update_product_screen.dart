import 'package:barcode_system_app/common_widgets/custom_text_form_field.dart';
import 'package:barcode_system_app/core/constants/border_radius/border_radius.dart';
import 'package:barcode_system_app/core/constants/media_query_sizes/media_query_size.dart';
import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:flutter/material.dart';

class AddUpdateProductScreen extends StatefulWidget {
  @override
  State<AddUpdateProductScreen> createState() => _AddUpdateProductScreenState();
}

class _AddUpdateProductScreenState extends State<AddUpdateProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _barkodController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ürün Ekle / Güncelle'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.horizontalSimetricDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: AppPaddings.onlyBottomLowPadding,
                      child: CustomTextFormField(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: AppBorderRadius.highBorderRadius,
                        ),
                        labelText: "Ürün barkodu",
                        hintText: "Ürün barkodu",
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        controller: _barkodController,
                      ),
                    ),
                  ),
                  //SizedBox(width: MediaQuerySize(context).percent2Width),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Getir butonu işlevi
                      },
                      icon: Icon(Icons.search),
                      label: Text('Getir'),
                    ),
                  ),
                  //SizedBox(width: 8),
                  Expanded(
                    flex: 3,
                    child: OutlinedButton(
                      onPressed: () {
                        // Yeni barkod işlevi
                      },
                      child: Text('Yeni barkod'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Ürün Bilgisi',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Eklemek / görüntülemek istediğiniz ürünün barkodunu okutun veya elle girerek Getir düğmesine tıklayın.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 16),
                    Icon(Icons.image, size: 100, color: Colors.grey),
                  ],
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Ürün barkodu :',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Ürün adı',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Fiyat',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Alış fiyatı',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Kâr oranı',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'KDV (%)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // Stok azalt
                    },
                    icon: Icon(Icons.remove_circle, color: Colors.red),
                  ),
                  Text('Stok'),
                  IconButton(
                    onPressed: () {
                      // Stok artır
                    },
                    icon: Icon(Icons.add_circle, color: Colors.green),
                  ),
                  Spacer(),
                  DropdownButton<String>(
                    value: 'Grupsuz ürün',
                    items: ['Grupsuz ürün', 'Grup 1', 'Grup 2']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) {
                      // Dropdown işlevi
                    },
                  ),
                ],
              ),
              SizedBox(height: 8),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Ürün detayı',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {
                      // Sil işlevi
                    },
                    icon: Icon(Icons.delete, color: Colors.red),
                    label: Text('Sil'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Kaydet işlevi
                    },
                    icon: Icon(Icons.save),
                    label: Text('Kaydet'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
