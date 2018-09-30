function display1()
{
    document.getElementById("otp").style.display="block";
    document.getElementById("totp").style.display="block";
    document.getElementById("totp1").style.display="block";
    document.getElementById("sub1").style.display="block";
}
function verify()
{
    var flag=1;
    var cd=document.getElementById("cid").value;
    if(cd.length==7)
    {
        for(var i=0;i<7;i++)
        {
            if(!(cd.charAt(i)>=0 && cd.charAt(i)<=9))
            {
                flag=0;
                break;
            }
        }
    }
    else
    {
        flag=0;
        alert("INVALID CUSTOMER ID - 7 NUMBER ALLOWED");
    }
    var x = document.getElementById("pass").value;
    re=/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
    var c=re.test(x);
    if(!c)
    {
        flag=0;
        alert("INVALID PASSWORD : PASSWORD SHOULD CONTAIN ATLEAST 1 SPECIAL SYMBOL 1 - CAPITAL ALPHABET 1 - SMALL ALPHABET 1-NUMBER AND LENGTH > 8");
    }

    if(flag==1)
    {
        display1();
    }
}