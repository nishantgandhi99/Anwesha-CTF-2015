<%-- 
    Document   : dashboard
    Created on : Jan 22, 2015, 4:36:11 PM
    Author     : Amar Sharma
--%>
<%@page import="CTFCode.Utils"%>
<%@page import="java.sql.Array"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="Images/favicon.ico">

        <title>CTF Dashboard</title>

        <!-- Bootstrap core CSS --> 
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/ctf.css" rel="stylesheet">
        <link href="css/dashboard.css" rel="stylesheet">
        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->


        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <%
        HttpSession sesh = request.getSession(true);
        if (sesh.getAttribute("tname") == null || sesh.getAttribute("score") == null) {
            response.sendRedirect("index.html");
            return;
        }
        String tname = sesh.getAttribute("tname").toString();

        String score = sesh.getAttribute("score").toString();
        int qno = 1; // Can make an Ester Egg here!!! if someone injects something here may give him msg of being a smartass!
        try {
            qno = Integer.parseInt(request.getParameter("q"));
            if (qno < 0 || qno > 10) {
                qno = 1;
            }
        } catch (Exception ex) {
        }
        Class.forName("com.mysql.jdbc.Driver");
        ResultSet res;
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/anwesha_ctf15", "ctf", "");
        if (request.getParameter("answer") != null && request.getParameter("q") != null) {
            String ans = request.getParameter("answer").toString();
            String eans = Utils.SHA1(ans).toString();

            PreparedStatement ansq = con.prepareCall("select * from problem_info where pid=?");
            ansq.setInt(1, qno);
            res = ansq.executeQuery();
            res.first();
            if (res.getString("answer").equals(eans)) {
                System.out.println(res.getString("answer"));
                sesh.setAttribute("score", score);
                PreparedStatement update = con.prepareCall("UPDATE user_track SET p" + qno + " = ?  WHERE tname = ?");
                update.setInt(1, res.getInt("score"));
                update.setString(2, tname);
                update.executeUpdate();
                PreparedStatement total;
                ResultSet rstotal;
                total = con.prepareCall("select * from user_track where tname=?"); // Getting crrently solved questions
                total.setString(1, tname);
                rstotal = total.executeQuery();
                rstotal.first();
                int scoren = 0;
                for (int i = 2; i <= 11; i++) {
                    scoren += rstotal.getInt(i);
                }
                score = "" + scoren;
                sesh.setAttribute("score", String.valueOf(scoren));

            }
        }
    %>
    <body>

        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="glow" href="#">C4ptur3 Th3 F1ag 2015</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">Dashboard</a></li>
                        <li><a href="#"><% out.print(tname); %></a></li>
                        <li><a class="blink_me score" href="#">Score <% out.print(score);%> </a> </li>
                        <li><a href="leaderboard.jsp">Leader board</a></li>
                        <li><a href="#">Sign out</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                        <%
                            int scores[] = new int[10];
                            String pages[] = new String[10];
                            PreparedStatement queslink = con.prepareCall("select * from problem_info where 1");
                            res = queslink.executeQuery();
                            res.first();
                            int in = 0;
                            while (!res.isAfterLast()) {
                                scores[in] = res.getInt("score");
                                pages[in] = res.getString("page");
                                in++;
                                res.next();
                            }
                            PreparedStatement solvedques = con.prepareCall("select * from user_track where tname=?");
                            solvedques.setString(1, tname);
                            res = solvedques.executeQuery();
                            res.first();
                            for (int i = 1;
                                    i <= 10; i++) {

                                if (i == qno) {
                                    out.print("<li class=\"active\"><a href=\"#\">Problem " + i + "  <span class=\"badge\"> " + scores[i - 1] + " pts </span>" + " <span class=\"sr-only\">(current)</span></a></li>");
                                } else if (res.getInt(i + 1) != 0) {
                                    out.print("<li class=\"active solved\"><a class=\"solved\" href=\"dashboard.jsp?q=" + i + "\">Problem " + i + "  <span class=\"badge\"> " + scores[i - 1] + " pts </span>" + " <span class=\"sr-only solved\">(current)</span></a></li>");
                                } else {
                                    out.print("<li><a href=\"dashboard.jsp?q=" + i + "\">Problem " + i + "  <span class=\"badge\"> " + scores[i - 1] + " pts </span>" + "</a></li>");
                                }
                            }
                        %>
                    </ul>
                </div>
                <div class="col-sm-9 col-md-10 problempage">
                    <%
                        if (res.getInt(qno
                                + 1) == 0) {
                            out.print(" <div> Welcome to Problem " + qno + " </div>");
                            out.print(" <div> Click <a href=\"problems/" + pages[qno - 1] + "?q=" + qno + "\">Here</a> to find the Flag!</div>");

                        } else {
                            out.print(" <div class=\"glow solvedpage\"> You pWned this problem! </div> <div> <img class=\"img-responsive solvedimage\" alt=\"Responsive image\" src=\"Images/notbad.jpg\"  onmouseover=\"hover(this);\" onmouseout=\"unhover(this);\"> </div>");
                        }

                    %>
                    <div class="answerform <% if (res.getInt(qno
                                + 1) != 0) {
                            out.print("gayab");
                        }%> ">
                        <div id="window">
                            <div id="toolbar">
                                <div class="top">
                                    <div id="lights">
                                        <div class="light red">
                                            <div class="glyph">×</div>
                                            <div class="shine"></div>
                                            <div class="glow"></div>
                                        </div>				
                                        <div class="light yellow">
                                            <div class="glyph">-</div>
                                            <div class="shine"></div>
                                            <div class="glow"></div>
                                        </div>
                                        <div class="light green">
                                            <div class="glyph">+</div>
                                            <div class="shine"></div>
                                            <div class="glow"></div>
                                        </div>
                                    </div>
                                    <div id="title">
                                        <div class="folder">
                                            <div class="tab"></div>
                                            <div class="body"></div>
                                        </div>
                                        Capture The Flag!
                                    </div>
                                    <div id="bubble">
                                        <div class="shine"></div>
                                        <div class="glow"></div>
                                    </div>
                                </div>
                            </div>
                            <div id="body">
                                <form method="post" action="#" class="form-inline">
                                    <label class="answerlabel" for="Answer">root@CTF-Anwesha15:~#</label>
                                    <input autofocus type="text" class="answer" id="answer" name="answer">
                                    <input type="hidden" name="q" value="<% out.print(qno);%>">
                                    <button type="submit" style="visibility: hidden" class="btn btn-default">Submit</button>
                                </form>	
                            </div>	
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery.min.js"></script>
        <script src="js/dashboard.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
