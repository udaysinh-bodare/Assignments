function validate(){
const email=document.getElementById("email").value
const password=document.getElementById("password").value

const er=document.getElementById("Eerror");
const pa=document.getElementById("Perror");
 er.innerHTML="";
 pa.innerHTML="";

if(email===""){

    //alert("all field are required!!");
    er.innerHTML="*enter valid email!"
    return false;

}else if(password===""){
    pa.innerHTML="Enter valid password!"
}
else if(password.length<6){
    //alert("password should greter than 6 digit!");
    pa.innerHTML="*Enter greater than 6 digit password!"
    return false;
}
else{
    alert("Login Successfully");
    return true;
}

}