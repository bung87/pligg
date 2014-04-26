  {checkActionsTpl location="tpl_pligg_register_start"}
<div class="linetop">&nbsp;</div>
<div class="leftwrapper">
<div class="register-left">
<form action="{$URL_register}" method="post" id="thisform" autocomplete="off">
<div>
<strong>{#PLIGG_Visual_Register_Username#}:</strong>
</div>
	{if isset($form_username_error)}{ foreach value=error from=$form_username_error }<br /><div class="alert alert-block">{$error}</div><br />{ /foreach }<br />{/if}
	{*checkit-reg-username*}
	<input type="text" name="reg_username" onblur="checkfield('username', this.form, this.form.reg_username)" id="reg_username" value="{if isset($reg_username)}{$reg_username}{/if}" size="25" tabindex="10" maxlength="32"/>
	{*<input type="button" name="reg-checkbutton1" id="reg-checkbutton1" value="{#PLIGG_Visual_Register_Verify#}" onclick="checkfield('username', this.form, this.form.reg_username)" class="btn btn-success" tabindex="11" />*}

<p id="reg_usernamecheckitvalue"></p>
	<div>
		<strong>{#PLIGG_Visual_Register_Email#}:</strong>
		{if isset($form_email_error)}{ foreach value=error from=$form_email_error }<br /><div class="alert alert-block">{$error}</div><br />{ /foreach }<br />{/if}
		<span class="help-inline">{#PLIGG_Visual_Register_Lowercase#}</span>
	</div>

	<input type="email" id="reg_email" name="reg_email" value="{if isset($reg_email)}{$reg_email}{/if}" size="25" tabindex="12" maxlength="128"/>
	{*<span id="checkit-reg-pass"></span>
		<input type="button" name="reg-checkbutton2" id="reg-checkbutton2" value="{#PLIGG_Visual_Register_Verify#}" onclick="checkfield('email', this.form, this.form.reg_email)" class="btn btn-success" tabindex="13" />*}

	<p id="reg_emailcheckitvalue"></p>
	<div>
<strong>{#PLIGG_Visual_Register_Password#}:</strong>
{if isset($form_password_error)}{ foreach value=error from=$form_password_error }<br /><div class="alert alert-block">{$error}</div><br />{ /foreach }<br />{/if}
<span class="help-inline">{#PLIGG_Visual_Register_FiveChar#}</span>
	</div>
	<input type="password" id="reg_password" name="reg_password" value="{if isset($reg_password)}{$reg_password}{/if}" size="25" tabindex="14"/>
	<div>
<strong>{#PLIGG_Visual_Register_Verify_Password#}: </strong>
	</div>
	<input type="password" id="reg_verify" name="reg_password2" value="{if isset($reg_password2)}{$reg_password2}{/if}" size="25" tabindex="15"/>

	{if isset($register_step_1_extra)}
		<br /><br />
		{$register_step_1_extra}
	{/if}
	<div><input type="submit" name="submit" value="{#PLIGG_Visual_Register_Create_User#}" class="btn btn-primary input-medium" tabindex="16" /></div>
	<input type="hidden" name="regfrom" value="full"/>
</form>
</div>

<div class="register-right">
	<h2>{#PLIGG_Visual_Register_Description_Title#}</h2>
	<p>{#PLIGG_Visual_Register_Description_Paragraph#}
	<ul>
		{#PLIGG_Visual_Register_Description_Points#}
	</ul>
	</p>
</div>

</div>
{checkActionsTpl location="tpl_pligg_register_end"}