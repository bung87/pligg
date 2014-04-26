<div class="linetop">&nbsp;</div>
	{if $errorMsg ne ""}	
			<div class="alert">
              <button type="button" class="close" data-dismiss="alert">×</button>
              <strong></strong> {$errorMsg}
            </div>		
	{/if} 
<div class="leftwrapper">
{checkActionsTpl location="tpl_login_top"}

<div class="login-left">
<form id="thisform" method="post">
	<h2>{#PLIGG_Visual_Login_Login#}</h2>
	<p>{#PLIGG_Visual_Login_Have_Account#}</p>
	<form action="{$URL_login}" method="post">	
		<strong>{#PLIGG_Visual_Login_Username#}:</strong><br />
			<input type="text" name="username" class="span2" value="{if isset($login_username)}{$login_username}{/if}" tabindex="10" /><br />
		<br /><strong>{#PLIGG_Visual_Login_Password#}:</strong><br />
			<input type="password" name="password" class="span2" tabindex="11" /><br />
		<input type="hidden" name="processlogin" value="1"/>
		<input type="hidden" name="return" value="{$get.return}"/>
		<input type="checkbox" name="persistent" tabindex="12" /> {#PLIGG_Visual_Login_Remember#}
		<br /><br />
		<input type="submit" value="{#PLIGG_Visual_Login_LoginButton#}" class="btn btn-primary" tabindex="13" />
	</form>
</form>
</div>

<div class="login-middle">
<form action="{$URL_login}" id="thisform2" method="post">
	<h2>{#PLIGG_Visual_Login_ForgottenPassword#}</h2>
	<p>{#PLIGG_Visual_Login_EmailChangePass#}</p>
		<strong>{#PLIGG_Visual_Register_Email#}:</strong><br />
		<input type="text" name="email" class="span2" size="25" tabindex="14" id="forgot-email" value="" />
		<br /><br />
		<input type="submit" value="{#PLIGG_Visual_Register_Continue#}" class="btn" tabindex="15" />
		<input type="hidden" name="processlogin" value="3"/>
		<input type="hidden" name="return" value="{$get.return}"/>
</form>

</div>

<div class="login-right">
<h2>{#PLIGG_Visual_Login_NewUsers#}</h2>
	<p>{#PLIGG_Visual_Login_NewUsersA#}<a href="{$register_url}">{#PLIGG_Visual_Login_NewUsersB#}</a>{#PLIGG_Visual_Login_NewUsersC#}</p>
</div>

<br style="clear:both;"/>

{checkActionsTpl location="tpl_login_bottom"}
</div>