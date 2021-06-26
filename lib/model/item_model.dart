class Item {
  final String name;
  final String category;
  final DateTime date;
  final double price;

  const Item({
    required this.name,
    required this.category,
    required this.date,
    required this.price,
  });

  factory Item.fromMap(Map<String, dynamic> map) {
    final properties = map['properties'] as Map<String, dynamic>;
    final nameList = (properties['Name']?['title'] ?? []) as List;
    final dateStr = properties['Date']?['date']?['start'];
    return Item(
      name: nameList.isNotEmpty ? nameList[0]['plain_text'] : '?',
      category: properties['Category']?['select']?['name'] ?? 'Any',
      price: (properties['Price']?['number'] ?? 0).toDouble(),
      date: dateStr != null ? DateTime.parse(dateStr) : DateTime.now(),
    );
  }
}
