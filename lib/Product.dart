class ListProductType {
  int? value;
  String? name;

  ListProductType(this.value, this.name);

  static List<ListProductType> getListProductType() {
    return [
      ListProductType(3, 'ตู้เย็น'),
      ListProductType(3, 'พัดลม'),
      ListProductType(2, 'ทีวี'),
      ListProductType(1, 'โทรศัพท์'),
      ListProductType(3, 'แท็บเล็ต'),
    ];
  }
}
