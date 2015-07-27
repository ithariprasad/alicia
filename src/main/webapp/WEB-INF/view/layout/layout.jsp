<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>BT - <tiles:insertAttribute name="title" ignore="true" /></title>
        <link rel='SHORTCUT ICON' href='resources/favicon.ico' type='image/x-icon' />
        <!-- global css files -->
        <tilesx:useAttribute name="stylesheet" id="stylesheet" />
        <c:forTokens var="item" items="${stylesheet}" delims=",">
        <link rel="stylesheet" href="<c:url value='/resources/css/${item}'/>">
        </c:forTokens>
        <!-- page level css files -->
        <tilesx:useAttribute name="page-stylesheet" id="stylesheet" />
        <c:forTokens var="item" items="${stylesheet}" delims=",">
        <link rel="stylesheet" href="<c:url value='/resources/css/${item}'/>">
        </c:forTokens>
        <!-- global javascript files -->
        <tilesx:useAttribute name="javascript" id="javascript" />
        <c:forTokens var="item" items="${javascript}" delims=",">
        <script type="text/javascript" src="<c:url value='/resources/js/${item}'/>"></script>
        </c:forTokens>
        <!-- page level javascript files -->
        <tilesx:useAttribute name="page-javascript" id="javascript" />
        <c:forTokens var="item" items="${javascript}" delims=",">
        <script type="text/javascript" src="<c:url value='/resources/js/${item}'/>"></script>
        </c:forTokens>
    </head>
    <body onload="<tiles:insertAttribute name="bodyonload" />" style="background: #000;">
        <tiles:insertAttribute name="header" />
        <tiles:insertAttribute name="body" />
        <tiles:insertAttribute name="footer" />
        <script>
            $(document).ready(function() {
                var url = window.location;
                var element = $('ul.nav a').filter(function() {
                    return this.href == url || url.href.indexOf(this.href) == 0;
                }).addClass('active').addClass('in').parent();
                if (element.is('li')) {
                    element.addClass('active');
                }

                var $chat = $("#chat");


                $(".chatButton").click(function() {
                    var bottomPosition = $chat.css("bottom");
                    if (bottomPosition === "-420px") {
                        $chat.animate({ bottom: "0px"}, 250, function() {
                            $("#yousay").focus();
                        });
                    } else {
                        $chat.animate({ bottom: "-420px"}, 250);
                    }
                });



                $('#yousay').keypress(function (e) {
                    var key = e.which;
                    if(key == 13) {
                        var input = $("#yousay").val();
                        $("#yousay").val("");

                        var conversation = $(".conversation");
                        $("<div class='message-row text-right'><span class=''><div class='human text-left'>" + input + "</div></span></div>").hide().appendTo($(".conversation")).fadeIn("fast");
                        $(".conversation").scrollTop($(".conversation").prop('scrollHeight'));
                        doTalk(input);
                    }
                });

            });
        </script>
    </body>
</html>