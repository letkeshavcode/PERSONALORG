public class apexPractice {
    public static void mergeSort(){
        List<Integer> arr = new List<Integer>{25,45,96};
        List<Integer> b = new List<Integer>{44,102,121};
        List<Integer> res = new List<Integer>();
        
        integer i=0;
        integer j=0;
        
        while(i<arr.size() && j<b.size()){
            if(arr[i]<b[j]){
                res.add(arr[i]);
                i++;
            }else{
                res.add(b[j]);
                j++;
            }
        }
        
        while(i<arr.size()){
            res.add(arr[i]);
            i++;
        }
        while(j<b.size()){
            res.add(b[j]);
            j++;
        }        
       
        System.debug('res'+res);
                
    }
    
    
    
}