<div class="boxcontent">
	<form action="{$URL_login}" method="post" autocomplete="off" class="form-horizontal"> 
  <div class="control-group">
    <label class="control-label" for="inputEmail">{#PLIGG_Visual_Login_Username#}:</label>
    <div class="controls">
      <input type="text" name="username" class="input-medium" value="{if isset($login_username)}{$login_username}{/if}" tabindex="40" />
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="inputPassword">{#PLIGG_Visual_Login_Password#}:</label>
    <div class="controls">
    <input type="password" name="password" class="input-medium" tabindex="41" />
		<input type="hidden" name="processlogin" value="1"/>
		<input type="hidden" name="return" value="{$templatelite.get.return|sanitize:3}"/>	
    </div>
  </div>
  <div class="control-group">
    <div class="controls">
      <label class="checkbox">
        {#PLIGG_Visual_Login_Remember#}:<input type="checkbox" name="persistent" tabindex="42" class="input-medium" /> 
      </label>
      <input type="submit" value="{#PLIGG_Visual_Login_LoginButton#}" class="btn btn-primary" tabindex="43" />
    </div>
  </div>
</form>	
</div>