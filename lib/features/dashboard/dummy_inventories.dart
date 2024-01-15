import './inventory.dart';

List<Inventory> dummyInventories = _json.map((json) {
  if (json
      case {
        'inventoryId': final String inventoryId,
        'category': final String category,
        'brand': final String brand,
        'supplier': final String supplier,
        'minimumStock': final int minimumStock,
        'updateDate': final String updateDate,
      }) {
    return Inventory(
      inventoryId: inventoryId,
      category: category,
      brand: brand,
      supplier: supplier,
      minimumStock: minimumStock,
      updateDate: updateDate,
    );
  } else {
    throw const FormatException('Unexpected JSON');
  }
}).toList();

const _json = [
  {
    'inventoryId': 'BH0001',
    'category': 'Ardhi',
    'brand': 'Bandung',
    'supplier': 'Bla Bla Bla',
    'minimumStock': 1,
    'updateDate': '2023-08-15',
  },
  {
    'inventoryId': 'BH0002',
    'category': 'Fikry',
    'brand': 'Bandung',
    'supplier': 'Bla Bla Bla',
    'minimumStock': 2,
    'updateDate': '2023-08-15',
  },
  {
    'inventoryId': 'BH0003',
    'category': 'Ihsan',
    'brand': 'Bandung',
    'supplier': 'Bla Bla Bla',
    'minimumStock': 3,
    'updateDate': '2023-08-15',
  },
  {
    'inventoryId': 'dummy',
    'category': 'dummy',
    'brand': 'dummy',
    'supplier': 'Bla Bla Bla',
    'minimumStock': 3,
    'updateDate': '2023-08-15',
  },
];
