global Class HelloWorld{
String Greeting='Hello World';
    public void printgreeting1(){
        system.debug('hello');
    }
global void printGreeting(){
System.debug(Greeting);
    printgreeting1();
}
}