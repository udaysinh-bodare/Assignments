const name=document.getElementById("name")
const email=document.getElementById("email")
const password=document.getElementById("password")
const mobile=document.getElementById("mobile")

const form=document.getElementById("nform")

const na=document.getElementById("nerror")
const em=document.getElementById("Eerror")
const pa=document.getElementById("perror")
const mo=document.getElementById("merror")



 form.addEventListener("submit",(e) => {
    e.preventDefault();

let isValid=true;

     na.innerHTML="";
     em.innerHTML="";
     pa.innerHTML="";
     mo.innerHTML="";

    if(name.value===""){
        na.innerHTML=("Please! Enter Name!");
         isValid=false;
       

    } if(email.value===""){
        em.innerHTML=("Please! Enter email!");
         isValid=false;

    }
    if(password.value===""){
        pa.innerHTML=("Please! Enter password!");
         isValid=false;

    }
    else if(password.value.length<6){
        pa.innerHTML=("Password should greater than 6 digit!");
         isValid=false;
       
    }
    if(mobile.value===""){
        mo.innerHTML=("Please! Enter password!");
         isValid=false;

    }else if(mobile.value.length !==10){
        mo.innerHTML=("Enter 10 digit number!")
        isValid=false;

    }else if(isNaN(mobile.value)){
        mo.innerHTML=("Only number allowed!")
        isValid=false;
    }
    
    if(isValid){
        alert("Register successfully!");
        form.reset();
    }
})