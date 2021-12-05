package main
import (
	crypto "brutesmoll/source/crypto"
	misc "brutesmoll/source/misc"
//	attack "brutesmoll/source/attack"
	fmt "fmt"
	os "os"
	strcnv "strconv"
	str "strings" 
	time "time" )

func main() {
	if (len(os.Args) < 2) {misc.Usage(); os.Exit(0);}; opt := os.Args[1];
	switch opt {
		case "rot":
			flow := os.Args[2]; word := os.Args[3]; rot,_ := strcnv.Atoi(os.Args[4]);
			start := time.Now();						
			if ((str.Compare("enc",flow)) == 0) {cipher := crypto.EncryptROT(word,rot); fmt.Println("cipher\t: "+cipher);}
			if ((str.Compare("dec",flow)) == 0) {plain  := crypto.DecryptROT(word,rot); fmt.Println("plain\t: "+plain);}
			elapsed := time.Since(start).Seconds(); fmt.Printf("finished: %f\n",elapsed);
		case "sha256":			
			word := os.Args[2];
			pretext := crypto.StringToBin(word);
			// salting goes here
			fmt.Println(pretext);
			fmt.Println(len(pretext));
			fmt.Println(pretext[0:2]);
		case "salt":
			word := os.Args[2];			
			salt := misc.Salting(word);
			fmt.Println(word,">",salt);
		default:
			misc.Usage(); 
	}}