<!-- NON VERIFIED CODE -->




<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
        <head>
            <!--Import Google Icon Font-->
            <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
            <!--Import materialize.css-->
            <link type="text/css" rel="stylesheet" href="assest/css/materialize.min.css"  media="screen,projection"/>

            <!--Let browser know website is optimized for mobile-->
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            
            <!-- My Stuff -->
            <title>MCQ - Module</title>
            <link rel="stylesheet" type="text/css" href="assest/css/style.css">
        </head>

        <body>

            <div class="row">
                <div class="col s4 offset-s6" id="box">
                    <img src="assest/images/logo.png">
                    <br><br>
                    <a class="waves-effect waves-light modal-trigger" id="btn" href="#modal1"><p id="btn-txt">Login</p></a>
                    <br><p style="margin-left: 33%;">--or--</p>
                    <a class="waves-effect waves-light modal-trigger" id="btn" href="#modal2"><p id="btn-txt">Sign Up</p></a>
                    <!-- Modal Structure -->
                    <div id="modal1" class="modal">
                        <div class="modal-content">
                            <div class="container">
                                <div class="row">
                                    <h4 class="center">LOGIN</h4>
                                    <form class="col s12" action="/gdgmcq/LoginController.html" method="post">
                                        <div class="row">
                                            <div class="input-field col s12">
                                              <i class="material-icons prefix">account_circle</i>
                                              <input id="icon_prefix" type="text" class="validate">
                                              <label for="icon_prefix">Username</label>
                                            </div>
                                            <div class="input-field col s12">
                                              <i class="material-icons prefix">lock</i>
                                              <input id="password" type="password" class="validate">
                                              <label for="icon_telephone">Password</label>
                                            </div>
                                        </div>
                                        <input type="submit" value="SUBMIT" class="btn waves-effect waves-light" style="margin-left: 40%;">
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                          <a href="register.jsp" class=" modal-action modal-close waves-effect waves-green btn-flat">CLOSE</a>
                        </div>
                    </div>
                    <div id="modal2" class="modal">
                        <div class="modal-content">
                          <div class="container">
                                <div class="row">
                                    <h4 class="center">SIGN UP</h4>
                                    <form class="col s12" action="/gdgmcq/LoginController.html" method="post">
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <i class="material-icons prefix">perm_identity</i>
                                                <input id="icon_prefix" type="text" class="validate">
                                                <label for="icon_prefix">Name</label>
                                            </div>
                                            <div class="input-field col s12">
                                                <i class="material-icons prefix">email</i>
                                                <input id="email" type="email" class="validate">
                                                <label for="email">Email</label>
                                            </div>
                                            <div class="input-field col s12">
                                                <i class="material-icons prefix">phone</i>
                                                <input id="icon_telephone" type="tel" class="validate">
                                                <label for="icon_telephone">Telephone</label>
                                            </div>
                                            <div class="input-field col s12">
                                              <i class="material-icons prefix">account_circle</i>
                                              <input id="icon_prefix" type="text" class="validate">
                                              <label for="icon_prefix">Username</label>
                                            </div>
                                            <div class="input-field col s12">
                                              <i class="material-icons prefix">lock</i>
                                              <input id="password" type="password" class="validate">
                                              <label for="icon_telephone">Password</label>
                                            </div>
                                            <div class="input-field col s12">
                                              <i class="material-icons prefix">lock</i>
                                              <input id="password" type="password" class="validate">
                                              <label for="icon_telephone">Re enter Password</label>
                                            </div>
                                        </div>
                                        <input type="submit" value="SUBMIT" class="btn waves-effect waves-light" style="margin-left: 40%;">
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                          <a href="login.jsp" class=" modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
                        </div>
                    </div>
                </div>
            </div>
            <!--Import jQuery before materialize.js-->
            <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
            <script type="text/javascript" src="assest/js/materialize.min.js"></script>
            <script type="text/javascript">
                $(document).ready(function(){
                    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
                    $('.modal-trigger').leanModal();
                });
            </script>
        </body>
    </html>