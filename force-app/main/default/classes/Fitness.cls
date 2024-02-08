public class Fitness {
    public Decimal calculateBMI(Decimal Weight,Decimal height){
         Decimal BMI=(Weight/((height)*(height)));
        return BMI;
      // System.debug(BMI);
    }
    public Decimal calculatePace(Decimal distance,Integer minutes){
        Decimal Pace=(distance)/(minutes);
        return Pace;
    }
}