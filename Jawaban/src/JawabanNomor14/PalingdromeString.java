package JawabanNomor14;

import jdk.jfr.Timestamp;

import org.junit.jupiter.api.Test;

public class PalingdromeString{
  static void palingdromeString(String st)
  {
  int l = st.length();
  String rev ="";
  for(int i=0;i<l-1;i++)
  {
  char ch = st.charAt(i);
  rev=ch+rev;
  }
  String f = st+rev;
  System.out.println(f);
  }

   @Test
   public void TestPalingdrome(){
     palingdromeString("PHOBIA");
   }
  
}