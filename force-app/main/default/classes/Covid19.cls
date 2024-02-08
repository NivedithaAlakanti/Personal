public class Covid19 {
    
   private Integer recoveredInArea=0;
   public static Integer recoverdIncountry=0;
    
    public Covid19(Integer recoveredInArea){
        this.recoveredInArea=recoveredInArea;
        recoverdIncountry=recoveredInArea+1;
    }
    public void treatPatient(){
       recoveredInArea++;
       recoverdIncountry++; 
    }
    public Integer gettreated(){
        return recoveredInArea;
    }

}