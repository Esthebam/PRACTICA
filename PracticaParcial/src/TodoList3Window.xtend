

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.TextBox
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column

class TodoList3Window extends SimpleWindow<PrincipalAppModel> {

	
	new(WindowOwner parent) {
		super(parent, new PrincipalAppModel)
		modelObject.search()
	}
	
	override protected addActions(Panel arg0) {
	//	throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel panel) {
		title = "TODO List"
		new TextBox(panel) => [
			value <=> "descripcion"
			width = 200
		]
		new Button(panel) => [
			caption= "Agregar Tarea"
			onClick[modelObject.crearTarea]
			
		]
			new TextBox(panel) => [
			value <=> "descripcion2"
			width = 200
		]
		new Button(panel) => [
			caption= "Editar Tarea"
			onClick[modelObject.editarTarea]
			
		]
		
	

		var table = new Table<Tarea>(panel, typeof(Tarea)) => [
			items <=> "resultadosTarea"
			value <=> "tareaSeleccionada"
			numberVisibleRows = 5
		]
		this.crearColumnasTarea(table)
		
		new Button(panel) => [
			caption= "Hacer/Deshacer"
			onClick[modelObject.hacerTareaSeleccionada]
			
		]
	}

	def void crearColumnasTarea(Table<Tarea> table) {
	new Column<Tarea>(table) => [
			title = "Tarea"
			bindContentsToProperty("descripcion")
			fixedSize = 200
		]
		
		new Column<Tarea>(table) => [
			title = "Hecho"
			bindContentsToProperty("estaHecha").transformer =  [ Boolean recibe | 
			 	if (recibe) "SI" else "NO"
			 ]
		]
		
		
	}
	
	
	}