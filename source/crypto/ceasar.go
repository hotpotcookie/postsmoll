package crypto
import ()

func EncryptROT(word string, rot int) string {
	var cipher string; var num_case int = 65;
	for _,asc := range word {
		if (asc >= 97 && asc <= 122) {num_case = 97;}
		if (asc == 32) {cipher += " "; continue;}
		if ((asc > 91 && asc < 97) || asc < 65 || asc > 122) {cipher += string(asc); continue;}
		// ---
		conv_asc := ((int(asc)-num_case)+rot)%26+num_case;
		cipher += string(conv_asc);
	}
	return cipher;}

func DecryptROT(word string, rot int) string {
	var plain string; var num_case int = 65;
	for _,asc := range word {
		if (asc >= 97 && asc <= 122) {num_case = 97;}
		if (asc == 32) {plain += " "; continue;}
		if ((asc > 91 && asc < 97) || asc < 65 || asc > 122) {plain += string(asc); continue;}
		// ---		
		conv_asc := ((int(asc)-num_case)-rot); if (conv_asc < 0) {conv_asc += 26;}
		conv_asc = (conv_asc)%26+num_case;
		plain += string(conv_asc);
	}
	return plain;}
