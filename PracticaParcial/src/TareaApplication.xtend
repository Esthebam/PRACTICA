import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window

class TareaApplication extends Application {
	
	new(TareaBootstrap bootstrap) {
		super(bootstrap)
	}

	static def void main(String[] args) {
		new TareaApplication(new TareaBootstrap).start
	}

	override protected Window <?> createMainWindow() {
		new TodoList4Window(this)
	}

}
