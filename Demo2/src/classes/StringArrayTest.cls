public class StringArrayTest {
	
    public static List<String> generateStringArray(Integer n){
        List<String> temp=new List<String>();
        for(Integer i=0;i<n;i++){
            temp.add('Test '+i);
        }
        return temp;
        
    }
}