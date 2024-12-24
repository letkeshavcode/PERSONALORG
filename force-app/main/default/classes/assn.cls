public with sharing class assn {
    
    /*public static void test(){
        System.debug('This test is working');
    }
    */
    
    // public static Integer random(Integer nod){
    //     Integer n=(Integer)(Math.random()* Math.pow(10,nod))+1;
    // 	System.debug(n);
    //     return n;
    // }
    

    public static void no_to_str(Integer n){

         List<String> nums=new List<String>{'','one','two','three','four','five','six','seven','eight','nine','ten','eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen','twenty'};
         List<String> tens=new List<String>{'','ten','twenty','thirty','forty','fifty','sixty','seventy','eighty','ninety'};
         List<String> poweroftens=new List<String>{'hundred','thousand'};        
			
         List<Integer> num = new List<Integer>();
         Integer div=1000;
        
        while(n>0){
            
            Integer q= n /div;
            Integer rem=Math.mod(n, div);
            num.add(q);
            n=rem;
            div=div/10;
            
        }
        
        
        String ans='';
        
        ans = nums.get(num.get(0))+' thousand '+ nums.get(num.get(1)) +' hundred ' + tens.get(num.get(2))+' '+ nums.get(num.get(3));
        
        System.debug(ans);
     	System.debug('working fine');

    }
    
	
	
	 
     
}