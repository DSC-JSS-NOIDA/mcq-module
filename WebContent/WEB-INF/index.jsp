<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
        <head>
            <!--Import Google Icon Font-->
            <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
            <!--Import materialize.css-->
            <link type="text/css" rel="stylesheet" href="static/css/materialize.min.css"  media="screen,projection"/>

            <!--Let browser know website is optimized for mobile-->
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            
            <!-- My Stuff -->
            <title>MCQ - Module</title>
            <link rel="stylesheet" type="text/css" href="static/css/style.css">
            <script type="text/javascript">
			function formValidation()
			{
				var pass1 = document.getElementById("pass1").value;
				var pass2 = document.getElementById("pass2").value;
				if(pass1 != pass2)
				{
					
					alert('password not match');
					return false
				}
				alert('success');
				return true;
			}
		</script>
        </head>

        <body>

            <div class="row">
                <div class="col s4 offset-s6" id="box">
                    <img src="static/images/logo.png">
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
                                              <i class="material-icons prefix">email</i>
                                              <input id="icon_prefix" type="text" class="validate" name="email" required />
                                              <label for="icon_prefix">Email</label>
                                            </div>
                                            <div class="input-field col s12">
                                              <i class="material-icons prefix">lock</i>
                                              <input id="password" type="password" class="validate" name="password" required />
                                              <label for="icon_telephone">Password</label>
                                            </div>
                                        </div>
                                        <input type="submit" value="SUBMIT" class="btn waves-effect waves-light" style="margin-left: 40%;">
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                          <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">CLOSE</a>
                        </div>
                    </div>
                    <div id="modal2" class="modal">
                        <div class="modal-content">
                          <div class="container">
                                <div class="row">
                                    <h4 class="center">SIGN UP</h4>
                                    <form class="col s12" action="/gdgmcq/RegistrationController.html" method="post" onsubmit="return formValidation();">
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <i class="material-icons prefix">perm_identity</i>
                                                <input id="icon_prefix" type="text" class="validate" name="name" required />
                                                <label for="icon_prefix">Name</label>
                                            </div>
                                            <div class="input-field col s12">
                                                <i class="material-icons prefix">email</i>
                                                <input id="email" type="email" class="validate" name="email" required />
                                                <label for="email">Email</label>
                                            </div>
                                       		<div class="input-field col s12">
                                              <i class="material-icons prefix">school</i>
                                              <input id="icon_prefix" type="text" class="validate" name="college" required />
                                              <label for="icon_prefix">College</label>
                                            </div>
                                            <div class="input-field col s12">
                                              <i class="material-icons prefix">assignment</i>
                                              <input id="icon_prefix" type="text" class="validate" name="branch" required />
                                              <label for="icon_prefix">Trade</label>
                                            </div>
                                            <div class="input-field col s12">
                                              <i class="material-icons prefix">person_pin</i>
                                              <input id="icon_prefix" type="text" class="validate" name="rollno" required />
                                              <label for="icon_prefix">Roll No</label>
                                            </div>
                                            <div class="input-field col s12">
                                              <i class="material-icons prefix">airplay</i>
                                              <input id="icon_prefix" type="text" class="validate" name="labno" required />
                                              <label for="icon_prefix">Lab Number</label>
                                            </div>
                                            <div class="input-field col s12">
                                                <i class="material-icons prefix">phone</i>
                                                <input id="icon_telephone" type="tel" class="validate" name="contact" required />
                                                <label for="icon_telephone">Contact</label>
                                            </div>
                                            
                                            <div class="input-field col s12">
                                              <i class="material-icons prefix">lock_outline</i>
                                              <input id="pass1" type="password" class="validate" name="password" required />
                                              <label for="icon_telephone">Password</label>
                                            </div>
                                            <div class="input-field col s12">
                                              <i class="material-icons prefix">lock</i>
                                              <input id="pass2" type="password" class="validate" name="repassword" required />
                                              <label for="icon_telephone">Re Enter Password</label>
                                            </div>
                                        </div>
                                        <input type="submit" value="SUBMIT" class="btn waves-effect waves-light" style="margin-left: 40%;">
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                          <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
                        </div>
                    </div>
                </div>
            </div>
            <!--Import jQuery before materialize.js-->
            <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
            <script type="text/javascript" src="static/js/materialize.min.js"></script>
            <script type="text/javascript">
                $(document).ready(function(){
                    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
                    $('.modal-trigger').leanModal();
                });
            </script>
        </body>
    </html>