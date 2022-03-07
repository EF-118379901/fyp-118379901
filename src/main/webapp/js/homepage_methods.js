
   //This function occurs when the button to submit details is clicked
   //If the user has met their target the calculate_target function occurs
   //If the user has not met their target, a listbox and another button appear
   
    function  giveReasons(){
        
        var foodPrice = parseFloat(document.getElementById("txtFoodPrice").value);
        var lastTarget = parseFloat(document.getElementById("txtLastTarget").value);
            
        if(lastTarget < foodPrice) {
            document.getElementById('textInput').className="show";
            document.getElementById('btnReasons').className="show";
            return false;
        }
        else{
                calculate_target();
              
            }
        }

   
        
        

