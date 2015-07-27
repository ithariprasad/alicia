var pb = new Pandorabot();
var responseDelay = 0;
var custid;
var conversation = $(".conversation");

function doTalk(input) {
    pb.talk(input, function(data) {


        //if (!custid)
        //    custid = data.custid;

        // add a 2 delay to bot response

        setTimeout(function() {
            $("<div class='message-row'><span><div class='bot'>" + data + "</div></span></div>").hide().appendTo($(".conversation")).fadeIn("fast");
            $(".conversation").scrollTop($(".conversation").prop('scrollHeight'));
        }, responseDelay);


    });

}

function Pandorabot(host, botid) {
    this.host = host;
    this.botid = botid;
    this.protocol = "http";
}

Pandorabot.prototype.talk = function(input, fn) {
    var url = "chat?&input=" + encodeURIComponent(input) + "&format=json";

    //if (custid)
    //    url = url + "&custid=" + custid;

    var xhr = new XMLHttpRequest();
    xhr.open("GET", url, true);
    xhr.send();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var p = xhr.responseText;
            fn(p);
        }
    };
};
