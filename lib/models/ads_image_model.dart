class AdsImageModel {
  final String id;
  final String imageUrl;
  // final String prompt;
  // final String title;
  // final PromptImageType type;

  AdsImageModel({
    required this.id,
    required this.imageUrl,
    // required this.prompt,
    // required this.title,
    // required this.type,
  });

  factory AdsImageModel.fromJson(Map<String, dynamic> json) {
    return AdsImageModel(
      id: json['id'],
      imageUrl: json['imageUrl'],
      // prompt: json['prompt'],
      // title: json['title'],
      // type: PromptImageType.values.byName(
      //   json['type'],
      // ), // Converta a string em PromptImageType
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      // 'prompt': prompt,
      // 'title': title,
      // 'type': type.toString().split('.').last,
    };
  }
}

// enum PromptImageType { man, woman }
