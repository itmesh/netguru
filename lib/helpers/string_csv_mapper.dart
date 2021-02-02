class StringCSVMapper {
  static List<String> fromCSV(String csv) {
    return csv.split(',');
  }

  static String toCSV(List<String> list) {
    return list.join(',');
  }
}