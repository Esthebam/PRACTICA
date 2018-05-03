

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import java.util.List
import org.uqbar.commons.model.utils.ObservableUtils
import org.uqbar.commons.applicationContext.ApplicationContext

@Accessors
@Observable
class PrincipalAppModel {
	Tarea exampleTarea = new Tarea
	List<Tarea> resultadosTarea
	String descripcion
	Tarea tareaSeleccionada
	
	String descripcion2

	
	def void search() {
		resultadosTarea = repoTareas.search(exampleTarea.descripcion)
		ObservableUtils.firePropertyChanged(this, "resultadosTarea")
			}
	
	def RepoTareas getRepoTareas() {
		ApplicationContext.instance.getSingleton(typeof(Tarea))
	}
	
	def void crearTarea(){
		repoTareas.create(descripcion)
		search()
		}
	def void hacerTareaSeleccionada(){
		tareaSeleccionada.estaHecha= !tareaSeleccionada.estaHecha
		repoTareas.update(tareaSeleccionada)
		search()
	
	}
	def void editarTarea(){
		tareaSeleccionada.descripcion= descripcion2
		repoTareas.update(tareaSeleccionada)
		search()
	
	}
	
	def actualizarTareaSeleccionada() {
		repoTareas.update(tareaSeleccionada)
		search()
	}

	}