/**
 * Created by Anushka Getamanna on 9/22/2015.
 */



function openImotion(){
    // document.getElementById('dpop').style.visibility = "visible";

    var div = document.getElementById('dpop');
    if (div.style.visibility !== 'hidden') {
        div.style.visibility = 'hidden';
    }
    else {
        div.style.visibility = 'visible';
    }


}

function appendText(elementId,val){
    // var chatboxM = document.f.chatbox;
    var chatboxM = document.getElementById("chatbox").value;

    //chatbox.value += val;
    // <img  src="images/emoticons/grin.png" title="angry" />
    // document.getElementById("chatbox").value = val;
    document.getElementById("chatbox").value = chatboxM + val;
    // document.getElementById('dpop').style.visibility = "hidden";
}

function convertEmmotions() {
    var chatboxM = document.getElementById("chatbox").value;

    var Angel = '<img class="facemoodeOnAir" src="images/emoticons/Angel.png" title="Angel"/>';
    var Angry = '<img class="facemoodeOnAir" src="images/emoticons/Angry.png" title="Angry"/>';
    var Crying = '<img class="facemoodeOnAir" src="images/emoticons/Crying.png" title="Crying"/>';
    var Heart = '<img class="facemoodeOnAir" src="images/emoticons/Heart.png" title="Heart"/>';
    var Hot = '<img class="facemoodeOnAir" src="images/emoticons/Hot.png" title="Hot"/>';
    var Kiss = '<img class="facemoodeOnAir" src="images/emoticons/Kiss.png" title="Kiss"/>';
    var Like = '<img class="facemoodeOnAir" src="images/emoticons/Like.png" title="Like"/>';
    var Loved = '<img class="facemoodeOnAir" src="images/emoticons/Loved.png" title="Loved"/>';
    var Nothing = '<img class="facemoodeOnAir" src="images/emoticons/Nothing.png" title="Nothing"/>';
    var OpenMouthed = '<img class="facemoodeOnAir" src="images/emoticons/Open-mouthed.png" title="Open Mouthed"/>';
    var Propozer = '<img class="facemoodeOnAir" src="images/emoticons/Propozer.png" title="Propozer"/>';
    var Sad = '<img class="facemoodeOnAir" src="images/emoticons/Sad.png" title="Sad"/>';
    var Sleepy = '<img class="facemoodeOnAir" src="images/emoticons/Sleepy.png" title="Sleepy"/>';
    var Smile = '<img class="facemoodeOnAir" src="images/emoticons/Smile.png" title="Smile"/>';
    var Surprise = '<img class="facemoodeOnAir" src="images/emoticons/Surprise.png" title="Surprise"/>';
    var Tongue = '<img class="facemoodeOnAir" src="images/emoticons/Tongue.png" title="Tongue"/>';
    var Winking = '<img class="facemoodeOnAir" src="images/emoticons/Winking.png" title="Winking"/>';
    var Worried = '<img class="facemoodeOnAir" src="images/emoticons/Worried.png" title="Worried"/>';



   // var newMsg = chatboxM.replace(":-D", angel);


    var newMsg = chatboxM.replace(/:-\)/gi, Smile)
                            .replace(/:>/gi, Angel)
                            .replace(/:-D/gi, OpenMouthed)
                            .replace(/;-\)/gi, Winking)
                            .replace(/:X/gi,Loved)
                            .replace(/:-P/gi,Tongue)
                            .replace(":^)",Nothing)
                            .replace(/:-B/gi,Hot)
                            .replace(/:-\(/gi,Sad)
                            .replace(/:-S/gi,Worried)
                            .replace(":-C",Crying)
                            .replace(/:-O/gi,Surprise)
                            .replace(/:-@/gi,Angry)
                            .replace(/:-Z/gi,Sleepy)
                            .replace("(y)",Like)
                            .replace(/<3/gi,Heart)
                            .replace("[logo]",Propozer) 
                            .replace("{}",Kiss);

    document.getElementById("xxx").innerHTML = newMsg;
    document.getElementById('chatbox').value = "";
}
