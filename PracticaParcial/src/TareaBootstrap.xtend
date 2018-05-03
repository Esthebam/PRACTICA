import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.arena.bootstrap.CollectionBasedBootstrap

class TareaBootstrap extends CollectionBasedBootstrap {

	new() {
		ApplicationContext.instance.configureSingleton(typeof(Tarea), new RepoTareas)
	}

	/**
	 * Inicializaci�n del juego de datos del repositorio
	 * 
	 */
	override run() {

		val RepoTareas repoTarea = ApplicationContext.instance.getSingleton(typeof(Tarea))

	}

}
