class Inventory {
  Inventory({
    required this.inventoryId,
    required this.category,
    required this.brand,
    required this.supplier,
    required this.minimumStock,
    required this.updateDate,
  });
  final String inventoryId;
  final String category;
  final String brand;
  final String supplier;
  final int minimumStock;
  final String updateDate;

  static const itemCount = 6;
}
