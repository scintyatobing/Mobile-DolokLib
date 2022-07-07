import 'package:DolokLib/consts/borrow_status.dart';
import 'package:DolokLib/features/history/get/history_controller.dart';
import 'package:DolokLib/models/history/history.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryItem extends GetWidget<HistoryController> {
  const HistoryItem({Key? key, required this.history}) : super(key: key);

  final History history;

  @override
  Widget build(BuildContext context) {
    final historyDetail = history.detail.isNotEmpty;

    if (!historyDetail) return const SizedBox.shrink();

    return Card(
      elevation: 6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: ListTile(
              title: Text(history.detail.first.judulBuku),
              subtitle: Text("Status : ${history.statusString}\nTanggal Peminjaman : ${DateFormat('dd-MM-yyyy').format(history.createdAt)}\nTanggal Pengembalian : ${DateFormat('dd-MM-yyyy').format(history.createdAt.add(new Duration(days: 7)))}"),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ExtendedImage.network(
                  history.detail.first.gambar,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  loadStateChanged: (state) {
                    if (state.extendedImageLoadState != LoadState.completed) {
                      return Image.asset('assets/images/Book1.jpg');
                    }
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: history.status == BorrowStatus.Dipinjam,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Expanded(
                      child: ElevatedButton(
                        onPressed: () => controller.borrowExtend(history.id),
                        child: Text('Perpanjangan'),
                      ),
                    ),
                  ),
                  replacement: const SizedBox.shrink(),
                ),
                Visibility(
                  visible: (history.status == BorrowStatus.Dipinjam ||
                      history.status == BorrowStatus.MenungguPerpanjangan ||
                      history.status == BorrowStatus.SudahDiperpanjang),
                  child: Expanded(
                    child: ElevatedButton(
                      onPressed: () => controller.borrowReturn(history.id),
                      child: Text('Pengembalian'),
                    ),
                  ),
                  replacement: const SizedBox.shrink(),
                ),
                Visibility(
                  visible: (history.status == BorrowStatus.DikonfirmasiPeminjaman),
                  child: Expanded(
                    child: Text('Silakan ambil buku Anda ke perpustakaan hari ini.',style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  replacement: const SizedBox.shrink(),
                ),
                Visibility(
                  visible: (history.status == BorrowStatus.DikonfirmasiPengembalian),
                  child: Expanded(
                    child: Text('Silakan kembalikan buku Anda ke perpustakaan hari ini.',style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  replacement: const SizedBox.shrink(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
