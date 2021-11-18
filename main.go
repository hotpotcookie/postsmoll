package main
import (
	crypto "brutesmoll/crypto"
	misc "brutesmoll/misc"
	fmt "fmt"
	os "os"
	strcnv "strconv"
	str "strings" )

func main() {
	if (len(os.Args) < 2) {misc.Usage(); os.Exit(0);}; opt := os.Args[1];
	switch opt {
		case "rot":
			flow := os.Args[2]; word := os.Args[3]; rot,_ := strcnv.Atoi(os.Args[4]);			
			if ((str.Compare("enc",flow)) == 0) {cipher := crypto.EncryptROT(word,rot); fmt.Println("cipher\t: "+cipher);}
			if ((str.Compare("dec",flow)) == 0) {plain  := crypto.DecryptROT(word,rot); fmt.Println("plain\t: "+plain);}
		case "sha256":			
			word := os.Args[2];
			pretext := crypto.StringToBin(word);
			fmt.Println(pretext);
			fmt.Println(len(pretext));
			fmt.Println(pretext[0:2])
		default:
			misc.Usage(); 
	}}