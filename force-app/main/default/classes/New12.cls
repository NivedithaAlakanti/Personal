public class New12 {
integer val=0;
    integer val2=0;
    
    {
        system.debug('Hi');
    }
    static{
        System.debug('Hello');
    }
   public New12(){
        System.debug('Constructor created');
    }
   
    public void m2(integer val){
       this.val=val;
        System.debug(val);
    }
}