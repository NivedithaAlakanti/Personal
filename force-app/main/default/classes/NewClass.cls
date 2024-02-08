public class NewClass {
    private string value1='Good Morning';
    private string value2='Good Afternoon';
    private string value3='Good Evening';
    
    public void printvalue1(String msg,String msg2){
        System.debug(msg+msg2);
    }
    public string printNew(Integer val){
        string entNew='';
        switch on val {
            when 0{
                entNew='Monday';
            }
             when 1{
                entNew='Tuesday';
            }
             when 2{
                entNew='Wednesday';
            }
             when 3{
                entNew='Thursday';
            }
             when 4{
                entNew='Friday';
            }
             when 5{
                entNew='Saturday';
            }
             when 6{
                entNew='Sunday';
            }
            when else{
               entNew='Enter crct value'; 
            }
            
        }
        return entNew;
    }
    public string printNew(String val){
        string abb='';
        switch on val{
            when 'Mon'{
                abb='1 st day';
            }
            when 'Tue'{
                abb='2 nd day';
            }
            when 'wed'{
                abb='3 rd day';
            }
        }
        return abb;
    }

}