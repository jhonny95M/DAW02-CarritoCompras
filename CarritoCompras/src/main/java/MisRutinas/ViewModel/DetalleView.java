package MisRutinas.ViewModel;

import MisRutinas.Detalle;

public class DetalleView extends Detalle {
	private String descripcion;
	private String imagen;
	private String categoria;
	public DetalleView() {}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getImagen() {
		return imagen;
	}
	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	
	

}
