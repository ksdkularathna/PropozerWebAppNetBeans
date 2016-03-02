/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function statusChangeCallback(response) {
    
    console.log('statusChangeCallback');
    console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
        
        // Logged into your app and Facebook.
        var pro_pic = document.getElementById('profile-pic');
        // Enable Sign Up button        
      //  document.getElementById("fbSubmit").style.background="rgba(255,0,0,0.6)";
        FB.api('/me', function (response) {
            
            pro_pic.innerHTML = '<img src="https://graph.facebook.com/' + response.id + '/picture?width=359&height=359" id=custom_pro_pic style="height: 100%; width: 100%; object-fit: contain">';                                           
            document.getElementById('username').value = response.name;            
            document.getElementById('custom_pro_pic_url').value = 'https://graph.facebook.com/' + response.id + '/picture?width=359&height=359';                      
            document.getElementById('loginButton').style.display = 'none';
            
        });
    } else if (response.status === 'not_authorized') {
        // The person is logged into Facebook, but not your app.
        //alert('User is not authorized');
        // Display the login button
        //document.getElementById('loginButton').style.display = 'block';
        document.getElementById("fbSubmit").disabled = true;
        $('#fbModal2').modal('toggle');        
        element.style.background = "#e2335b" ;
        
    } else {
       
         // Show Facebook login alert by modal
        $('#fbModal1').modal('toggle');
        var element = document.getElementById('fbSubmit');
        element.style.background = "#e2335b" ;
        element.disabled =true;
        
        // The person is not logged into Facebook, so we're not sure if
        // they are logged into this app or not.
       // document.getElementById('status').innerHTML = 'Please log ' + 'into Facebook First!';
    }
}

// This function is called when someone finishes with the Login
// Button.  See the onlogin handler attached to it in the sample
// code below.

function checkLoginState() {

    
    
    FB.getLoginStatus(function (response) {
        statusChangeCallback(response);
    });
   $('#fbModal1').modal('hide');
   $('#fbModal2').modal('hide');
}

function logout() {
    FB.logout(function (response) {
        // user is now logged out
    });

}
window.fbAsyncInit = function () {
    FB.init({
        appId: '1457398941225553',
        cookie: true, // enable cookies to allow the server to access 
        // the session
        xfbml: true, // parse social plugins on this page
        version: 'v2.2' // use version 2.2
    });

    // Now that we've initialized the JavaScript SDK, we call 
    // FB.getLoginStatus().  This function gets the state of the
    // person visiting this page and can return one of three states to
    // the callback you provide.  They can be:
    //
    // 1. Logged into your app ('connected')
    // 2. Logged into Facebook, but not your app ('not_authorized')
    // 3. Not logged into Facebook and can't tell if they are logged into
    //    your app or not.
    //
    // These three cases are handled in the callback function.

    FB.getLoginStatus(function (response) {
        statusChangeCallback(response);
    });

};

// Load the SDK asynchronously
(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id))
        return;
    js = d.createElement(s);
    js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));


// Here we run a very simple test of the Graph API after login is
// successful.  See statusChangeCallback() for when this call is made.
function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function (response) {
        console.log('Successful login for: ' + response.name);
        document.getElementById('status').innerHTML =
                'Thanks for logging in, ' + response.name + '!';
    });
}

