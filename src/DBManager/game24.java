package DBManager;

public class game24 {
    public String [] operation = {"+","-","*","/"},num=null;

    public game24(String [] n){
       num = n;
    }
    public String getSolution (){
        int mn [] = new int[4];
        for(int i=0;i<num.length;i++)
            mn[i]=Integer.parseInt(num[i]);

        return "s";
    }
}
