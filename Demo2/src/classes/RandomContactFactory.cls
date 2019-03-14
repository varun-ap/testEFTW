public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer num,String s){
        List<Contact> temp=new List<Contact>();
        for(Integer i=0;i<num;i++){
            Contact c=new Contact(FirstName='MyName'+i,
                                 LastName=s);
            temp.add(c);
        }
        return temp;
    }
}