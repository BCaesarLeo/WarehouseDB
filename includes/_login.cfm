<cfoutput>
<div class="container">
  <form class="form-signin" action="/doLogin/" method="POST">

    <div class="alignCenter padding5px">
        <img src="../images/ECOFLEX.png"  width="175px" height="auto"  />
    </div>

    <h2 class="form-signin-heading">sign in now</h2>

    <div class="login-wrap">
        <cfif structKeyExists(URL,"invalidLogin")>
            <div>
                INVALID LOGIN
            </div>
        </cfif>
        <div class="user-login-info">
            <input name="userID" type="text" class="form-control" placeholder="User ID" autofocus>
            <input name="password" type="password" class="form-control" placeholder="Password">
        </div>

<!--- Remember Me and Forgot Password Button --->      
  <label class="checkbox">
            <input type="checkbox" value="remember-me"> Remember me
            <span class="pull-right">
<!---                 <a data-toggle="modal" href="##forgotPassModal"> Forgot Password?</a>
 --->            </span>
        </label>
        <button class="btn btn-lg btn-login btn-block" type="submit">Sign in</button>

       <!--NICO <div class="registration">
            Don't have an account yet?
            <a class="" href="registration.html">
                Create an account
            </a>
        </div> -->

    </div>

    <!-- Modal -->
    <div aria-hidden="true" aria-labelledby="forgotPassModalLabel" role="dialog" tabindex="-1" id="forgotPassModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Forgot Password ?</h4>
                </div>
                <div class="modal-body">
                    <p>Enter your e-mail address below to reset your password.</p>
                    <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">

                </div>
                <div class="modal-footer">
                    <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                    <button class="btn btn-success" type="button">Submit</button>
                </div>
            </div>
        </div>
    </div>
    <!-- modal -->
  </form>
</div>
</cfoutput>