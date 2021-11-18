package misc
import ( 
	fmt "fmt" )

func Usage() {
	fmt.Println("Usage: ./main [OPTION]...");
	fmt.Println("A multipurpose yet smoll tools, written in Go.\n");
	fmt.Println("Arguments are dependents to the menu to be used.\n");
	fmt.Println("[1]:");
	fmt.Println(" - : **");
	fmt.Println(" - : rot  | [2]: enc/dec      | [3]: word(string)          | [4]: shift(int)");	
	fmt.Println(" - : sha  | [2]: bitsize(int) | [3]: word/filename(string)");
	fmt.Println("\nExamples:\n");
	fmt.Println(" - $ ./main help");
	fmt.Println(" - $ ./main rot enc \"hello world\" 13");
	fmt.Println(" - $ ./main rot dec \"khoor zruog\" 13");	
}