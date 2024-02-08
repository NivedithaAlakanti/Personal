@istest
public class Covid19_test {
@istest
    public static void testtreatPatient(){
        Covid19 c=new Covid19(-12);
        System.assertEquals(-12,c.gettreated(),'comapring');
        c.treatPatient();
    }
}