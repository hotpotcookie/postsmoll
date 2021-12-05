package misc
import (
	crypto "brutesmoll/source/crypto"	
)

func Salting(word string) string {
	salt := crypto.EncryptROT(word,len(word));
	return salt;
}

/*
a = irsyad
b = iarbscydaedf == increment pakai ascii > string, mod26
c = EncryptROT(b,len(b))
*/