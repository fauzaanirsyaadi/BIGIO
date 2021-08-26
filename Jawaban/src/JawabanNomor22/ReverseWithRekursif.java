package JawabanNomor22;

public class ReverseWithRekursif {
    public String reverseString(String str){

        if(str.isEmpty()){
            return str;
        } else {
            return reverseString(str.substring(1))+str.charAt(0);
        }
    }
    public static void main(String[] args) {
        ReverseWithRekursif obj = new ReverseWithRekursif();
        String test = "hello";
        System.out.println(test);
        String result = obj.reverseString(test);
        System.out.println(result);
    }
}
