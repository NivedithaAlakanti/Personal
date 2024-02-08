@istest
public class Fitness_test {
    @istest
    public static void testBMI1(){
        decimal Weight=1;
        decimal height=1;
        Fitness ft=new Fitness();
    decimal result=ft.calculateBMI(Weight, height);
        System.AssertEquals(2,result,'same as expected');
        }
}