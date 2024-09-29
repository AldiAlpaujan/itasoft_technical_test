String? emptyValidator(String field, String value) {
  if (value.isNotEmpty) {
    return null;
  } else {
    return "$field harus diisi!";
  }
}
