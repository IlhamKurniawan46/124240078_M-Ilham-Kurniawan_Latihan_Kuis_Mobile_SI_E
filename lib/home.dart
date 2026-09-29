import 'package:flutter/material.dart';

import 'detail.dart';
import 'models/food_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu Resto',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),

      body: ListView.builder(
        itemCount: FoodItem.sampleData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailPage()),
              );
            },
            child: ListTile(
              title: Text(FoodItem.sampleData[index].name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Deskripsi makanan
                  Text(FoodItem.sampleData[index].description),
                  const SizedBox(height: 6),

                  // 2. Baris sejajar untuk Porsi (kiri) dan Harga Total (kanan)
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Mendorong kiri dan kanan
                    children: [
                      Text(
                        '${FoodItem.sampleData[index].quantity} porsi',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                              Colors.orange, // Warna oranye seperti pada gambar
                        ),
                      ),
                      Text(
                        'Rp ${FoodItem.sampleData[index].quantity * FoodItem.sampleData[index].price}', // Perhitungan total harga
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                              Colors.green, // Warna hijau seperti pada gambar
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),

                  // 3. Harga satuan/per porsi
                  Text(
                    'Rp ${FoodItem.sampleData[index].price} / porsi',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
              // leading: Image.network(
              //   FoodItem.sampleData[index].image,
              //   width: 50,
              //   height: 50,
              // ),
            ),
          );
        },
      ),
    );
  }
}
