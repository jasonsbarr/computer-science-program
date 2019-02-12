// This tells Ecipse about Karel
import stanford.karel.*;

// This is a comment. They are for humans to read!

// Define a program called StepUp
public class StepUpSoln extends Karel {
	
	// The program starts executing from the "run" method.
	public void run() {
		move();
		move();
		pickBeeper();
		turnLeft();
		move();
		
		turnRight();
		
		move();
		putBeeper();
		move();
	}

	// This adds a new Karel command
	private void turnRight() {
		// This is executed each time turnRight is called.
		turnLeft();
		turnLeft();
		turnLeft();
	}
	
}

