package JawabanNomor21;

import java.util.*;

public class Chiper {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);

        System.out.println("masukan jumlah kata");
        int n = s.nextInt();
        System.out.println("masukan kata yang ingin dirubah");
        String word = s.next();
        System.out.println("pindah berapa langkah ?");
        int k = s.nextInt();

        StringBuilder sb = new StringBuilder();

        for(int i = 0; i < n; ++i) {
            sb.append(encryptChar(word.charAt(i), k));
        }

        System.out.println(sb.toString());
    }

    private static char encryptChar(char c, int k) {
        if(!Character.isAlphabetic(c)) return c;
        int base = Character.isLowerCase(c) ? 'a' : 'A';
        return (char)((c + k - base) % 26 + base);
    }
}
