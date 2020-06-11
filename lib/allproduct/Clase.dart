class Datos {
  final String id;
  final String nombre, precio, descripcion, imgen,categoria;

  Datos(
      {this.id,
      this.nombre,
      this.precio,
      this.descripcion,
      this.imgen,
      this.categoria
      });
  factory Datos.fromJson(Map<String, dynamic> jsonData) {
    return Datos(
      id: jsonData['id'],
      nombre: jsonData['nombre'],
      precio: jsonData['precio'],
      descripcion: jsonData['descripcion'],
      categoria: jsonData['id_catg_producto'],
      imgen: "http://192.168.0.106/tienda/imgsave/" + jsonData['img'],
    );
  }
}