class Buy {
  final String? id;
  final String code;
  final String name;
  final String lote;
  final double precioVenta;
  final double precioCompra;
  final double cantidad;
  final String nameProveedor;

  Buy(this.id, this.code, this.name, this.lote, this.precioVenta,
      this.precioCompra, this.cantidad, this.nameProveedor);
}
