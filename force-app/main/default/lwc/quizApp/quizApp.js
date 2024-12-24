import { LightningElement } from 'lwc';

export default class QuizApp extends LightningElement {

    questions = [
        {
            id:"question1",
            question:"What is the capital of India ?",
            options : {
                a: "UP",
                b:"DELHI",
                c:"KERALA"
            },
            answer : "b"
        },
        {
            id:"question2",
            question:"What is the capital of Australia ?",
            options : {
                a: "SYDNEY",
                b:"CANBERRA",
                c:"MELBOURNE"
            },
            answer : "b"
        },
        {
            id:"question3",
            question:"What is the capital of Nepal?",
            options : {
                a: "OMAN",
                b:"KHATMANDU",
                c:"NOIDA"
            },
            answer : "b"
        }
        
    ]

    selected={}
    correctAnswers = 0;
    changeHandler(event){
        // console.log("name" + event.target.name);
        // console.log("value" + event.target.value);
        const {name,value} = event.target;
        this.selected = {...this.selected,[name]:value}
    }
    get allNotSelected(){
        return !(Object.keys(this.selected).length === this.questions.length);
    } 
    submitHandler(event){
        event.preventDefault()
    let correct = this.questions.filter(item => this.selected[item.id]===item.answer);
    this.correctAnswers = correct.length;
    console.log("this.correctAnswers", this.correctAnswers)
    }

    resetHandler(){
        this.selected = {};
        this.correctAnswers=0;
    }

}