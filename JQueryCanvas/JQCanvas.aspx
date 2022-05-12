<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JQCanvas.aspx.cs" Inherits="JQueryCanvas.JQCanvas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>jQuery Canvas</title>
    <link href="https://fonts.googleapis.com/css2?family=Homemade+Apple&display=swap" rel="stylesheet" /> 
    <link href="Styles/Main.css" rel="stylesheet" />
    <style type="text/css">
        p{
            font-size:1.6em; 
        }
        canvas {
            border:1px solid black;
            margin: 20px;
        }
    </style>

    <script src="Scripts/jquery-3.6.0.js"></script>
    <script type="text/javascript">
        $(window).on("load", function () {
            var canvas1 = $(canvas_1)[0];
            var context1 = canvas1.getContext('2d');
            var canvas2 = $(canvas_2)[0];
            var context2 = canvas2.getContext('2d');

            //canvas dimensions
            $("#CanvasHeight, #CanvasWidth").change(function () {
                var canvasY = $(CanvasHeight).val();

                var canvasX = $(CanvasWidth).val();

                $(canvas1).attr({
                    height: canvasY,
                    width: canvasX
                });
            });

            //Signature
            context2.clearRect(0, 0, canvas2.width, canvas2.height);
            context2.font ="20pt 'Homemade Apple'";
            context2.fillText("Alex Safiran", 0, 30);
            $(sig).on("click", function () {
                $(canvas2).slideToggle("slow");
            });


            $(Button).on("click", function () {
                var centerX = canvas1.width / 2;
                var centerY = canvas1.height / 2;
                var shape = $("input[name=shape]:checked").val();
                var color = $("input[name=color]:checked").val();
                context1.fillStyle = color; 

                if (shape == "rectangle") {
                    var rectwidth = $(rect_width).val();
                    var rectheight = $(rect_height).val();

                    var Xcord = centerX - (rectwidth / 2);
                    var Ycord = centerY - (rectheight / 2);
                    context1.clearRect(0, 0, canvas1.width, canvas1.height);
                    context1.fillRect(Xcord, Ycord, rectwidth, rectheight);
                }
                else if (shape == "circle") {
                    var radius = $(circle_radius).val();
                    context1.clearRect(0, 0, canvas1.width, canvas1.height);
                    context1.beginPath();
                    context1.arc(centerX, centerY, radius, 0, 2 * Math.PI, false);
                    context1.fill();
                    context1.stroke();
                    context1.closePath();
                }
                else {
                    var basewidth = $(base_width).val();
                    var triangleheight = $(triangle_height).val();
                    context1.clearRect(0, 0, canvas1.width, canvas1.height);
                    context1.beginPath();
                    context1.moveTo(centerX - (basewidth / 2), centerY + (triangleheight / 2));
                    context1.lineTo(centerX + (basewidth / 2), centerY + (triangleheight / 2));
                    context1.lineTo(centerX, centerY - (triangleheight / 2));
                    context1.fill();
                    context1.closePath();
                }
            });

        }); 
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="form">
            <h1>Canvas jQuery App</h1>
            <p>
                <label for="CanvasWidth">Canvas Width: </label>
                <input type="text" id="CanvasWidth" size="5" value="200" /> 
                <br /> 
                <label for="CanvasHeight">Canvas Height: </label>
                <input type="text" id="CanvasHeight" size="5" value="200" /> 
            </p>
            <br />

            <p>
                <%--Rectangle--%>
                <span style="text-decoration:underline">Shape:</span>
                <br />
                <label for="rectangle">Rectangle: </label>
                <input type="radio" id="rectangle" name="shape" value="rectangle" checked="checked" /> 
                <br /> 
                <label for="rect_width">Width: </label>
                <input type="text" id="rect_width" size="5" value="100" />
                <label for="rect_height">Height: </label>
                <input type="text" id="rect_height" size="5" value="100" /> 
            <br />
            <br /> 
                <%--Circle--%>
                <label for="circle">Circle:</label>
                <input type="radio" id="circle" name="shape" value="circle" /> 
                <br/>
                <label for="circle_radius">Radius: </label>
                <input type="text" id="circle_radius" size="5" value="50" /> 
                <br />
                <br />
                <%--Triangle--%>
                <label for="triangle">Triangle: </label>
                <input type="radio" id="triangle" name="shape" value="triangle" /> 
                <br /> 
                <label for="base_width">Base Width: </label>
                <input type="text" id="base_width" size="5" value="100" /> 
                <label for="triangle_height">Height: </label>
                <input type="text" id="triangle_height" size="5" value="100" /> 
            </p>
            <br /> 
            <p>
               <span style="text-decoration:underline">Color:</span>
                <br /> 
                <label for="black">Black: </label>
                <input type="radio" id="black" name="color" value="black" checked="checked" /> 
                 <label for="blue">Blue: </label>
                <input type="radio" id="blue" name="color" value="blue"/> 
                 <label for="red">Red: </label>
                <input type="radio" id="red" name="color" value="red"/>
                 <label for="green">Green: </label>
                <input type="radio" id="green" name="color" value="green"/>

            </p>
            <br /> 
            <p>
                <input type="button" class="button" id="Button" value="Draw Shape" /> 
            </p>
            <p>
                <input type="checkbox" id="sig" /> 
                <label for="sig">Signature </label>
            </p>
        </div>
    </form>
    <div style="float:left">
        <canvas id="canvas_1" height="200" width="200">

        </canvas>
        <canvas style="display: block; margin-top: -20px; border: none;" id="canvas_2" height="75" width="300">

        </canvas>
    </div>
    <div style="font-family:'Homemade Apple';">.</div>
</body>
</html>
