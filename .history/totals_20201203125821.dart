void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart total.dart <inputFile.csv>');
    exit(1);
  }
  final inputFile = arguments.first;
  print(inputFile);
}
