// ignore_for_file: file_names

class WordModel {
  final int wordId;
  final String wordName;
  final String wordVoice;
  final String imageStatic;
  final String imageAnimated;

  WordModel({
    required this.wordId,
    required this.wordName,
    required this.wordVoice,
    required this.imageStatic,
    required this.imageAnimated,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      wordId: json['word_id'] ?? 0, // Default to 0 if null
      wordName: json['word_name'] ?? '', // Default to empty string if null
      wordVoice: json['word_voice'] ?? '', // Default to empty string if null
      imageStatic:
          json['image_static'] ?? '', // Default to empty string if null
      imageAnimated:
          json['image_animated'] ?? '', // Default to empty string if null
    );
  }
}
