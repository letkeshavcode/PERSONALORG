import { LightningElement,track,api} from 'lwc';

export default class TicTacToe extends LightningElement {

  
@api startGame =false;
@api endGame = false;
@track user1;
@track user2;
@track winner='';

mainBox = [['','',''],['','',''],['','','']];
counter = 0;
random;

handleStartGame(){
  if(this.user1 !='' && this.user2!=''){
    this.startGame = true;
  } 
}
handleUser1Input(event){
console.log(event.target.value);
this.user1 = event.target.value;
}
handleUser2Input(event){
  console.log(event.target.value);
  this.user2 = event.target.value;
}

handleRestart(){
    setTimeout(() => {
         eval("$A.get('e.force:refreshView').fire();");
    }, 1000); 
 
}

handleClick(event){

  
     console.log('matrix',this.mainBox);
   //console.log('event target ', event.target);
   console.log('event',event.currentTarget.dataset.id);
   let coordinates = event.currentTarget.dataset.id.split("");
   console.log('coordinates',coordinates);
   
   if(this.counter%2==0){
    if(this.mainBox[coordinates[0]][coordinates[1]]!='cross'){
      this.mainBox[coordinates[0]][coordinates[1]]='zero';
      event.target.style.background='crimson';
      this.counter++;
      console.log('counter',this.counter);
    }
  }else{
    if(this.mainBox[coordinates[0]][coordinates[1]]!='zero'){
      this.mainBox[coordinates[0]][coordinates[1]]='cross';
      event.target.style.background='royalblue';
      this.counter++;
      console.log('counter',this.counter);
    }
  }
  

  if(this.mainBox[0][0]=='zero' && this.mainBox[0][1]=='zero'&& this.mainBox[0][2]=='zero'){
    console.log(this.user1+' won');
    this.winner =this.user1;
    this.startGame = false;
    this.endGame = true;
    return;
  }else if(this.mainBox[1][0]=='zero' && this.mainBox[1][1]=='zero'&& this.mainBox[1][2]=='zero'){
    console.log(this.user1+' won');
    this.winner =this.user1;
    this.startGame = false;
    this.endGame = true;
    return;
  }else if(this.mainBox[2][0]=='zero' && this.mainBox[2][1]=='zero'&& this.mainBox[2][2]=='zero'){
    console.log(this.user1+' won');
    this.winner =this.user1;
    this.startGame = false;
    this.endGame = true;
    return;
  }else if(this.mainBox[0][0]=='zero' && this.mainBox[1][1]=='zero'&& this.mainBox[2][2]=='zero'){
    console.log(this.user1+' won');
    this.winner =this.user1;
    this.startGame = false;
    this.endGame = true;
    return;
  }else if(this.mainBox[0][2]=='zero' && this.mainBox[1][1]=='zero'&& this.mainBox[2][0]=='zero'){
    console.log(this.user1+' won');
    this.winner =this.user1;
    this.startGame = false;
    this.endGame = true;
    return;
  }else if(this.mainBox[0][0]=='zero' && this.mainBox[1][0]=='zero'&& this.mainBox[2][0]=='zero'){
    console.log(this.user1+' won');
    this.winner =this.user1;
    this.startGame = false;
    this.endGame = true;
    return;
  }else if(this.mainBox[0][1]=='zero' && this.mainBox[1][1]=='zero'&& this.mainBox[2][1]=='zero'){
    console.log(this.user1+' won');
    this.winner =this.user1;
    this.startGame = false;
    this.endGame = true;
    return;
  }else if(this.mainBox[0][2]=='zero' && this.mainBox[1][2]=='zero'&& this.mainBox[2][2]=='zero'){
    console.log(this.user1+' won');
    this.winner =this.user1;
    this.startGame = false;
    this.endGame = true;
    return;
  }
  else if(this.mainBox[0][0]=='cross' && this.mainBox[0][1]=='cross'&& this.mainBox[0][2]=='cross'){
    console.log(this.user2+' won');
    this.winner =this.user2;
    this.startGame = false;
    this.endGame = true;
    return;
  }else if(this.mainBox[1][0]=='cross' && this.mainBox[1][1]=='cross'&& this.mainBox[1][2]=='cross'){
    console.log(this.user2+' won');
    this.winner =this.user2;
    this.startGame = false;
    this.endGame = true;
    return;
  }else if(this.mainBox[2][0]=='cross' && this.mainBox[2][1]=='cross'&& this.mainBox[2][2]=='cross'){
    console.log(this.user2+' won');
    this.winner =this.user2;
    this.startGame = false;
    this.endGame = true;
    return;
  }else if(this.mainBox[0][0]=='cross' && this.mainBox[1][1]=='cross'&& this.mainBox[2][2]=='cross'){
    console.log(this.user2+' won');
    this.winner =this.user2;
    this.startGame = false;
    this.endGame = true;
    return;
  }else if(this.mainBox[0][2]=='cross' && this.mainBox[1][1]=='cross'&& this.mainBox[2][0]=='cross'){
    console.log(this.user2+' won');
    this.winner =this.user2;
    this.startGame = false;
    this.endGame = true;
    return;
  }else if(this.mainBox[0][0]=='cross' && this.mainBox[1][0]=='cross'&& this.mainBox[2][0]=='cross'){
    console.log(this.user2+' won');
    this.winner =this.user2;
    this.startGame = false;
    this.endGame = true;
    return;
  }else if(this.mainBox[0][1]=='cross' && this.mainBox[1][1]=='cross'&& this.mainBox[2][1]=='cross'){
    console.log(this.user2+' won');
    this.winner =this.user2;
    this.startGame = false;
    this.endGame = true;
    return;
  }else if(this.mainBox[0][2]=='cross' && this.mainBox[1][2]=='cross'&& this.mainBox[2][2]=='cross'){
    console.log(this.user2+' won');
    this.winner =this.user2;
    this.startGame = false;
    this.endGame = true;
    return;
  }else{
    console.log('failed');
    return;
  }

  console.log('update',this.mainBox);


}





}