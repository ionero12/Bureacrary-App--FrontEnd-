class Document {
  final int id;
  final String name;
  final String description;
  final double price;
  final int institutionId;
  final String path;

  Document({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.institutionId,
    required this.path,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json['id'] ?? 0,
      name: json['name'] ?? '0',
      description: json['description'] ?? '0',
      price: json['price'].toDouble() ?? 0,
      institutionId: json['institution_id'] ?? 0,
      path: json['path'] ?? '0',
    );
  }
}