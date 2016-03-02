/*price range*/

$('#sl2').slider();

var RGBChange = function() {
    $('#RGB').css('background', 'rgb(' + r.getValue() + ',' + g.getValue() + ',' + b.getValue() + ')')
};

/*scroll to top*/

$(document).ready(function() {
    $(function() {
        $.scrollUp({
            scrollName: 'scrollUp', // Element ID
            scrollDistance: 300, // Distance from top/bottom before showing element (px)
            scrollFrom: 'top', // 'top' or 'bottom'
            scrollSpeed: 300, // Speed back to top (ms)
            easingType: 'linear', // Scroll to top easing (see http://easings.net/)
            animation: 'fade', // Fade, slide, none
            animationSpeed: 200, // Animation in speed (ms)
            scrollTrigger: false, // Set a custom triggering element. Can be an HTML string or jQuery object
            //scrollTarget: false, // Set a custom target element for scrolling to the top
            scrollText: '<i class="fa fa-angle-up"></i>', // Text for element, can contain HTML
            scrollTitle: false, // Set a custom <a> title if required.
            scrollImg: false, // Set true to use image
            activeOverlay: false, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
            zIndex: 2147483647 // Z-Index for the overlay
        });
        var $submitBtn = $("#change_password button[type='submit']");
        var $passwordBox = $("#new_password");
        var $confirmBox = $("#confirm_password");
        var $errorMsg = $('<span id="error_msg">Passwords do not match.</span>');

        // This is incase the user hits refresh - some browsers will maintain the disabled state of the button.
        $submitBtn.removeAttr("disabled");

        function checkMatchingPasswords() {
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


        $("#confirm_password, #new_password")
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
});
