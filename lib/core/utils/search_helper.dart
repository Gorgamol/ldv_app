bool containsSearchValue({
  required String value,
  required List<String> fields,
}) {
  return fields.any((field) {
    final parsedValue = value.toLowerCase().trim();
    final parsedField = field.toLowerCase().trim();

    return parsedField.contains(parsedValue);
  });
}
