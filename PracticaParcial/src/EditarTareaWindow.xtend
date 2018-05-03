

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox

class EditarTareaWindow extends TransactionalDialog<Tarea>{
	
	new(WindowOwner owner, Tarea model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel panel) {
			title = "Editar Tarea"
		new TextBox(panel) => [
			value <=> "descripcion"
			width = 200
		]
		new CheckBox (panel) =>[
			value <=> "estaHecha"
			width = 200
		]
		new Button(panel) => [
			caption= "ok"
			onClick[this.accept]
			
		]
		
	}
	
}