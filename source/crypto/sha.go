package crypto
import (fmt "fmt")

func StringToBin(s string) []string {
    pretext := make([]string, 0); var getbin string;
    for _, c := range s {
        getbin  = fmt.Sprintf("%s%.8b",getbin,c);  
        pretext = append(pretext,getbin); getbin = "";
    }
    fmt.Println(fmt.Sprintf("%s%.8b","a","0"));    
    return pretext;
}

