

import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.CollectionBasedRepo

@Observable
class RepoTareas extends CollectionBasedRepo<Tarea> {

	// ********************************************************
	// ** Altas y bajas
	// ********************************************************
	def void create(String vDescripcion) {
		this.create(new Tarea => [
			descripcion = vDescripcion
			estaHecha = false
			
		
		])
	}

	// ********************************************************
	// ** Búsquedas
	// ********************************************************
	def search(String descripcion) {
		allInstances.filter [ tarea |
			this.match(descripcion, tarea.descripcion) 
		].toList
	}

	def match(Object expectedValue, Object realValue) {
		if (expectedValue === null) {
			return true
		}
		if (realValue === null) {
			return false
		}
		realValue.toString().toLowerCase().contains(expectedValue.toString().toLowerCase())
	}

	override def getEntityType() {
		typeof(Tarea)
	}

	override def createExample() {
		new Tarea
	}

	override protected getCriterio(Tarea example) {
		null
	}
	
	def getTareas() {
		allInstances
	}
}
