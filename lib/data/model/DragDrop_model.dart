// ignore_for_file: file_names

class DragDropModel {
  final String name;
  final String image;
  final String value;
  bool accepting;
  DragDropModel(
      {required this.name,
      required this.image,
      required this.value,
      this.accepting = false});
}
