public class TowerTriggerHelper {
    public static void createFloorHelper(Id id, Decimal floorNum){
        
        List<Floor__c> tobeinserted = new List<Floor__c>();
        
        for(Integer i = 1 ;i<=floorNum && floorNum<150;i++){
            Floor__c  f = new Floor__c();
           // Integer numoff = i+1;
            f.Name = 'Floor '+ i ;
            f.Tower__c = id;
            tobeinserted.add(f);
        }
        
        if(tobeinserted.size()>0){
            insert tobeinserted;
        }

    }
	
    public static void createFloors(List<Tower__c> list_of_towers){
        
        List<Floor__c> fl = new List<Floor__c>();
       	Map<Id,Decimal> floor_on_tower = new Map<Id,Decimal>();
        for(Tower__c eachTower : list_of_towers){
            floor_on_tower.put(eachTower.Id, eachTower.No_Of_Floors__c);
        }
        
         for (Id id: floor_on_tower.keySet()){
			createFloorHelper(id,floor_on_tower.get(id));
            
        }
      	  
    }
}