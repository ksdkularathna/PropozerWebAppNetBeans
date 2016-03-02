
function showUser() {
    // if user log in
    //        if(Your Condition)
    //        {
    //         document.getElementById("attid").style.display = 'inline';
    //        }
    //        else
    //        {
    //        document.getElementById("attid").style.display = 'none';
    //        }


    // temporary coding

    document.getElementById("fb_signup").style.display = 'none';
    document.getElementById("login").style.display = 'none';
    document.getElementById("logout").style.display = 'inline';
}

function replaceContentInContainer(target, source) {
    document.getElementById(target).innerHTML = document.getElementById(source).innerHTML;
}




$(document).ready(function() {
    var $submitBtn = $("#form button[type='submit']");
    var $passwordBox = $("#password");
    var $confirmBox = $("#confirm_password");
    var $errorMsg = $('<span id="error_msg">Passwords do not match!</span>');
    var $errorMsg2 = $('<span id="error_msg">Password must contain at least 8 characters!</span>');

    // This is incase the user hits refresh - some browsers will maintain the disabled state of the button.
    $submitBtn.removeAttr("disabled");

 
    function checkMatchingPasswords() {
        if ($passwordBox.val().length < 8) {
            $submitBtn.attr("disabled", "disabled");
            $errorMsg2.insertAfter($confirmBox);

        }
        if ($confirmBox.val() != "" && $passwordBox.val != "") {
            if ($confirmBox.val() != $passwordBox.val()) {
                $submitBtn.attr("disabled", "disabled");
                $errorMsg.insertAfter($confirmBox);
            }
        }

    }

    function resetPasswordError() {
        $submitBtn.removeAttr("disabled");
        var $errorCont = $("#error_msg");
        if ($errorCont.length > 0) {
            $errorCont.remove();
        }
    }


    $("#confirm_password, #password")
            .on("keydown", function(e) {
                /* only check when the tab or enter keys are pressed
                 * to prevent the method from being called needlessly  */
                if (e.keyCode == 13 || e.keyCode == 9) {
                    checkMatchingPasswords();
                }
            })
            .on("blur", function() {
                // also check when the element looses focus (clicks somewhere else)
                checkMatchingPasswords();
            })
            .on("focus", function() {
                // reset the error message when they go to make a change
                resetPasswordError();
            })

});


function login_active() {

    $('#login-trigger').next('#login-content').slideToggle();
    $(this).toggleClass('active');

    if ($(this).hasClass('active'))
        $(this).find('span').html('&#x25B2;');
    else
        $(this).find('span').html('&#x25BC;');

}

//Redirect to the home page and Active login Dropdown
function login_box() {
    $(window).attr("location", "index.jsp#active_login");

}  