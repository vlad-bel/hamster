T enumFromString<T extends Enum>(List<T> values, String string) {
  return values.firstWhere((element) => element.toString() == string);
}
