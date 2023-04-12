package MisRutinas.ViewModel;

import java.util.ArrayList;

import MisRutinas.Ventas;

public class VentasView extends Ventas {

	private ArrayList<DetalleView>detalles=new ArrayList<DetalleView>();
	public VentasView() {
		
	}
	public ArrayList<DetalleView> getDetalles() {
		return detalles;
	}
	public void setDetalles(ArrayList<DetalleView> detalles) {
		this.detalles = detalles;
	}
	
}
