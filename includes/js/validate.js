

var result;
var firstBlankField = true;
var filled = [true, true, true, true, true, true, true, true, true, true, true, true,true,true,true];

/*validate */
function validate() {
    console.log("validate"); 
   
    this.firstBlankField = true;
    var firstName = document.getElementById("firstName").value;
    var middleName = document.getElementById("middleName").value;
    var lastName = document.getElementById("lastName").value;
    var userName= document.getElementById("userName").value;
    var dob=document.getElementById("dob").value;
    var gender = document.getElementById("gender").value;
    var phoneNo = document.getElementById('phoneNo').value;
    var city = document.getElementById('city').value;
    var state = document.getElementById('state').value;
    var country = document.getElementById('country').value;
    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;
    var confrmPassword = document.getElementById('confrmPassword').value;
   

    var date= new Date(dob);
    var today=new Date();
    today.setHours(0,0,0,0);
    flag = true;


    /*Regular expressions */
    var regexName = /^[A-Za-z]*$/;
    var regexPhoneNo = /^\d{10}$/g;
    var regexEmail = /[\w.]+@+[a-z]+\.+[com|net|in]/;
    var regexPasskey = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;


    /*Validations */
    if (firstName == "") {
        displayErrors("showErrorfName", "firstName", 0, this.firstBlankField);
        filled[0] = false;
    } else if (firstName.length < 3) {
        displayErrors("showErrorfName", "firstName", 2, this.firstBlankField);
        filled[0] = false;
    } else if (!regexName.test(firstName)) {
        displayErrors("showErrorfName", "firstName", 1, this.firstBlankField);
        filled[0] = false;
    } else {
        clearErrorDisplayed('showErrorfName');
        filled[0] = true;
    }

   
    if (!regexName.test(middleName)) {
        displayErrors("showErrorMidName", "middleName", 0, this.firstBlankField);
        filled[1] = false;
    } 
    if(middleName != "" && regexName.test(middleName)) {
        clearErrorDisplayed('showErrorMidName');
        filled[1] = true;
    }

    if (lastName == "") {
        displayErrors("showErrorlName", "lastName", 0, this.firstBlankField);
        filled[2] = false;

    } else if (lastName.length < 3) {
        displayErrors("showErrorlName", "lastName", 2, this.firstBlankField);
        filled[2] = false;
    } else if (!regexName.test(lastName)) {
        displayErrors("showErrorlName", "lastName", 1, this.firstBlankField);
        filled[2] = false;
    } else {
        clearErrorDisplayed('showErrorlName');
        filled[2] = true;
    }

    if (userName == "") {
        displayErrors("showErrorUserName", "userName", 0, this.firstBlankField);
        filled[3] = false;

    } else if (userName.length < 3 || userName.length >=20 ) {
        displayErrors("showErrorUserName", "userName", 1, this.firstBlankField);
        filled[3] = false;
    } else {
        clearErrorDisplayed('showErrorUserName');
        filled[3] = true;
    }

    if(dob == ""){
        displayErrors("showErrorDob", "dob", 0, this.firstBlankField);
        filled[4]=false;
    }else if(date >= today){
        displayErrors("showErrorDob", "dob", 1, this.firstBlankField);
        filled[4]=false;
    }
    else{
        clearErrorDisplayed('showErrorDob');
        filled[4] = true;
    }

    if (gender === 'Select Gender') {
        displayErrors("showErrorGender", "gender", 0, this.firstBlankField);
        filled[5] = false;
    }
    if (gender != 'Select Gender') {
        clearErrorDisplayed('showErrorGender');
        filled[5] = true;
    }
    if (country == "Select Country") {
        displayErrors("showErrorCountry", "country", 0, this.firstBlankField);
        filled[6] = false;
    }
    if (country != "Select Country") {
        clearErrorDisplayed('showErrorCountry');
        filled[6] = true;
    }

    if (state == "Select State") {
        displayErrors("showErrorState", "state", 0, this.firstBlankField);
        filled[7] = false;
    }
    if ($("#state").attr("selectedIndex") == 0) {
        filled[7] = false;
    }

    if (state != "Select State" && $("#state option:selected").val() !== undefined) {
        clearErrorDisplayed('showErrorState');
        filled[7] = true;
    }

    if (city == "Select City") {
        displayErrors("showErrorCity", "city", 0, this.firstBlankField);
        filled[8] = false;
    }
    if ($("#city").attr("selectedIndex") == 0) {
        filled[8] = false;
    }
    if (city != "Select City" && $("#city option:selected").val() !== undefined) {
        clearErrorDisplayed('showErrorCity');
        filled[8] = true;
    }
    if (phoneNo == "") {
        displayErrors("showErrorPhoneNo", "phoneNo", 0, this.firstBlankField);
        filled[9] = false;
    }
    else if (!regexPhoneNo.test(phoneNo)) {
        displayErrors("showErrorPhoneNo", "phoneNo", 1, this.firstBlankField);
        filled[9] = false;
    }
    else {
        clearErrorDisplayed('showErrorPhoneNo');
        filled[9] = true;
    } 

    if (email == "") {
        displayErrors("showErrorEmail", "email", 0, this.firstBlankField);
        filled[10] = false;
    } else if (!regexEmail.test(email)) {
        displayErrors("showErrorEmail", "email", 1, this.firstBlankField);
        filled[10] = false;
    } else {
        clearErrorDisplayed('showErrorEmail');
        filled[10] = true;
    }
    if (password == "") {
        displayErrors("showErrorPassword", "password", 0, this.firstBlankField);
        filled[11] = false;
    } else if (!regexPasskey.test(password)) {
        displayErrors("showErrorPassword", "password", 1, this.firstBlankField);
        filled[11] = false;
    }
    else {
        clearErrorDisplayed('showErrorPassword');
        filled[11] = true;
        if (confrmPassword == "") {

            displayErrors("showErrorCnfPassword", "confrmPassword", 0, this.firstBlankField);
            filled[12] = false;
        } else if (password != confrmPassword) {
            displayErrors("showErrorCnfPassword", "confrmPassword", 1, this.firstBlankField);
            filled[12] = false;
        }
        else {

            clearErrorDisplayed('showErrorCnfPassword');
            filled[12] = true;
        }
    }

    /*check all fields are filled properly only then the flag will be true */
    for (let i = 0; i < 13; i++) {
        if (filled[i] == false) {
            this.flag = false;
        }
    }
    if (this.flag == true) {
        alert("Registration complete");
        // this.flag=false;
    }

    return this.flag;
}

/*displayErrors will display the errors according to the 
typeOfError(a number) passed, fieldId is the id of the field whose 
error is detected and errorId is the id of the span where 
error is to be displayed */
function displayErrors(errorId, fieldId, typeOfError, firstBlankField) {
    errors = [{
        id: "firstName",
        error: ["* Enter First Name", "* Enter only letters", "* Enter first name more than 3 letters"]
    },{
        id:"middleName",
        error: ["* Enter only letters"]
    },
    {
        id: "lastName",
        error: ["* Enter Last Name", "* Enter only letters", "* Enter last name more than 3 letters"]
    },
    {
        id: "userName",
        error: ["* Enter User Name", "* Enter last name more than 3 characters and less than 20 characters"]
    },
    {
        id:"dob",
        error:["*Enter date of birth","*Birth date must be before current date"]
    },
    {
        id: "gender",
        error: ["* Select Gender"]
    },
    {
        id: "phoneNo",
        error: ["*Please enter Phone Number", "*Please enter 10 digits valid phone no."]
    },
    {
        id: "city",
        error: ["*Please enter city name", "*Please enter a valid city"]
    },
    {
        id: "state",
        error: ["*Please enter state name"]
    },
    {
        id: "country",
        error: ["*Please enter country name"]
    },
    {
        id: "email",
        error: ["*Please enter email", "*Invalid email"]
    },
    {
        id: "password",
        error: ["*Please enter the password", "*Password must be minimum 8 characters with atleast one letter,one number and one special character"]
    },
    {
        id: "confrmPassword",
        error: ["*Please confirm the password", "*Passwords do not match"]
    },
    {
    	id:"loginName",
    	error:["* Enter UserName/Email","*Invalid login name"]
    }
    
    ]

    let blankField = undefined;
    console.log(errorId);
    errors.forEach(item => {
        if (item.id == fieldId) {  
            document.getElementById(errorId).innerHTML = item.error[typeOfError];
            console.log(firstBlankField, this.firstBlankField);
            if (firstBlankField) {
                blankField = document.getElementById(fieldId);
            }


        }
    });
    if (firstBlankField) {
        this.firstBlankField = false;
        blankField.focus();
    }
}
/*Function to clear  */
function clearErrorDisplayed(errorId) {
    document.getElementById(errorId).innerHTML = "";
    this.firstBlankField = true;
}
