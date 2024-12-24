public class PracticeApex {
    
    public static void sumOfDigits(Integer num){
        
        Integer n = num;
        Integer sum = 0;
            
        while(num != 0)
        {
           sum = sum + Math.mod(n,10);
            num =num / 10;
        }
        
        //System.debug('sum----'+ sum);
        
    }
    
    public static Integer factorial(Integer num){
        if(num == 0){
            return 1;
        }
        Integer res = factorial(num - 1);
        return num * res;
        
    }
    
    public static  void factorialHelper(){
        
        Integer num = 10 + (Integer)(Math.random() * ((99 - 10) + 1));
        System.debug('num '+ num);
        integer ans = factorial(num);
        System.debug('ans'+ ans);
    }
    
    public static void increasingSub(){
        Integer[] arr = new Integer[10];
        
        for(Integer i =0;i<10;i++){
            arr[i] =  10 + (Integer)(Math.random() * ((99 - 10) + 1));
        }
    }
    
    public static void removeDuplicateCharacter(String s){
       
        Map<String,Integer> freq  = new Map<String,Integer>();
        
        for(Integer i =0 ; i < s.length();i++){
            
        }
        
        
    }
    
    
}