$("#btn").click(function(){
        var myName = $("#pswd").val();
        if (myName=="<%out.print(password);%>")
        alert("Right password");
        else
        	alert("wrong password");
    });