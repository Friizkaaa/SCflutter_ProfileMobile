import 'package:flutter/material.dart';
import 'detail.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('History'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            "Riwayat Pesanan",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // daftar produk
          historyItem(
            context: context,
            nama: 'Iphone 12',
            harga: 6000000,
            gambar:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_Dd7xYfzM3ZPVrCNkRHePwH2MAYNwxMtJ2w&s",
            detail:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            tanggal: "12 Agustus 2025 - 09:15",
            status: "Dikirim",
            idPesanan: "#INV120934",
          ),
          historyItem(
            context: context,
            nama: 'Hoodie',
            harga: 600000,
            gambar:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUdaxapqyqGqUcxI6r4ZCGqTTRKBq1_UY60g&s",
            detail:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            tanggal: "10 Agustus 2025 - 14:42",
            status: "Selesai",
            idPesanan: "#INV998823",
          ),
          historyItem(
            context: context,
            nama: 'Apple Watch',
            harga: 2000000,
            gambar:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF1nXLi4ACUjAaBFKE2HJ-Y9ouO_SWfYmbKg&s",
            detail:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            tanggal: "8 Agustus 2025 - 19:20",
            status: "Diproses",
            idPesanan: "#INV776542",
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.grey[700],
        unselectedItemColor: Colors.grey[500],
        onTap: (index) {
          if (index == 0) Navigator.popAndPushNamed(context, '/');
          if (index == 1) Navigator.popAndPushNamed(context, '/history');
          if (index == 2) Navigator.popAndPushNamed(context, '/profile');
        },
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "History", icon: Icon(Icons.history)),
          BottomNavigationBarItem(label: "Me", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}

Widget historyItem({
  required String nama,
  required int harga,
  required String gambar,
  required String detail,
  required BuildContext context,
  required String tanggal,
  required String status,
  required String idPesanan,
}) {
  return Card(
    margin: const EdgeInsets.only(bottom: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.horizontal(left: Radius.circular(8)),
          child: Image.network(
            gambar,
            fit: BoxFit.cover,
            width: 120,
            height: 100,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nama,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  "Rp ${harga.toString()}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Tanggal: $tanggal",
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "Status: $status",
                  style: TextStyle(
                    fontSize: 12,
                    color: status == "Selesai"
                        ? Colors.green
                        : (status == "Dikirim" ? Colors.blue : Colors.orange),
                  ),
                ),
                Text(
                  "ID Pesanan: $idPesanan",
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 6),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => detailProduk(
                              nama: nama,
                              gambar: gambar,
                              harga: harga,
                              Detail: detail,
                            ),
                          ));
                    },
                    child: const Text("Detail Produk"),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
