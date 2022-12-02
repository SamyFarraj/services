class ServicesCheckBox {
  final String serviceName;
  final int serviceId;
  bool isChecked;

  ServicesCheckBox({
    required this.serviceName,
    required this.serviceId,
    this.isChecked = false,
  });
}
