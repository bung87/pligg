{if $user_view eq 'search'}
	<div class="navbar {if $user_logged_in}navbar-logged-in{/if}">
		{if $Allow_Friends neq "0"}	
			{if $user_login neq $user_logged_in}
				{if $is_friend gt 0}
					<img src="{$my_pligg_base}/templates/{$the_template}/images/user_delete.gif" align="absmiddle" />
					<a href="{$user_url_remove}">{#PLIGG_Visual_User_Profile_Remove_Friend#} {$user_login} {#PLIGG_Visual_User_Profile_Remove_Friend_2#}</a>				
				{else}
					{if $user_authenticated eq true}
						<img src="{$my_pligg_base}/templates/{$the_template}/images/user_add.gif" align="absmiddle" />
						<a href="{$user_url_add}">	{#PLIGG_Visual_User_Profile_Add_Friend#} {$user_login} {#PLIGG_Visual_User_Profile_Add_Friend_2#}</a>
					{/if}   
				{/if}      		
			{else}
				<img src="{$my_pligg_base}/templates/{$the_template}/images/friends.png" align="absmiddle" />
				<a href="{$user_url_friends}">{#PLIGG_Visual_User_Profile_View_Friends#}</a> 
				&nbsp;|&nbsp;
				<img src="{$my_pligg_base}/templates/{$the_template}/images/friends2.png" align="absmiddle" />
				<a href="{$user_url_friends2}">{#PLIGG_Visual_User_Profile_View_Friends_2#}</a> 			
			{/if} 
		{/if}
	</div>

	{if $userlist}
		<h2>{#PLIGG_Visual_Search_SearchResults#} '{$search}'</h2>

		<table cellpadding="1" border="0">
			<!--tr><th>{#PLIGG_Visual_Login_Username#}</th><th>{#PLIGG_Visual_User_Profile_Joined#}</th><th>{#PLIGG_Visual_User_Profile_Homepage#}</th><th>Add/Remove</th></tr-->
			{section name=nr loop=$userlist}
				<tr>
				<td width="240px"><img src="{$userlist[nr].Avatar}" align="absmiddle" /> <a href="{$URL_user, $userlist[nr].user_login}">{$userlist[nr].user_login}</a></td>
				<td width="120px">{$userlist[nr].user_date}</td>
				<td width="300px" style="text-align:center;">{$userlist[nr].user_url}</td>
				<td width="80px" style="text-align:center;">{if $userlist[nr].status eq 0}	
						<a href="{$userlist[nr].add_friend}"><img src="{$my_pligg_base}/templates/{$the_template}/images/user_add.gif" align="absmiddle" border="0" /></a>
					{else}
						<a href="{$userlist[nr].remove_friend}"><img src="{$my_pligg_base}/templates/{$the_template}/images/user_delete.gif" align="absmiddle" border="0"/></a>
					{/if}
				</td>	
				</tr>
			{/section}
		</table>
	{else}
		<h2>{#PLIGG_Visual_Search_NoResults#} '{$search}'</h2>
	{/if}
	
{/if}



{if $user_view eq 'setting'}
	<div class="navbar" style="margin-bottom:-20px;border-bottom:0;"></div>
	{*checkActionsTpl location="tpl_pligg_profile_settings_start"*}
	<form action="{$my_pligg_base}/user_settings.php?login={$user_username}" method="post">
		{$hidden_token_user_settings}
		
		<div class="user_settings_template">
			{if $Allow_User_Change_Templates}
			<strong>{#PLIGG_Visual_User_Setting_Template#}</strong>
			<select name='template'>
			{foreach from=$templates item=template}
			<option {if $template==$current_template}selected{/if}>{$template}</option>
			{/foreach}
			</select>
			{/if}
			<br /><br />
			<strong>{#PLIGG_Visual_User_Setting_Categories#}</strong>
			<br /><br />
			{foreach from=$category item=cat name="cate"}
				<!--{if $smarty.foreach.cate.iteration % 5 == 0}<br style="clear:both;">{/if}-->
				<div class="usercategory_outer">
					<div class="usercategory_checkbox">
						<input type="checkbox" name="chack[]" value="{$cat.category__auto_id}" {if !in_array($cat.category__auto_id,$user_category)} checked="checked"{/if}>
					</div>
					<div class="usercategory_name">
						{$cat.category_name}
					</div>
				</div>
				
			{/foreach}
		</div>

		<br style="clear:both;" />
		<div class="user_settings_save">
		<input type="submit" name="submit" value="{#PLIGG_Visual_Profile_Save#}">
		</div>
	</form>
	{*checkActionsTpl location="tpl_pligg_profile_settings_end"*}
	<div style="margin-top:5px;border-bottom:2px solid #DEDEDE;"> </div>
{/if}


{if $user_view eq 'removefriend'}
	<div class="navbar {if $user_logged_in}navbar-logged-in{/if}">
		{if $Allow_Friends neq "0"}		
			{if $user_authenticated eq true} 
				<div id="search_users">
					<form action="{$my_pligg_base}/user.php" method="get"
		{php}
		global $URLMethod, $my_base_url, $my_pligg_base;
		if ($URLMethod==2) print "onsubmit='document.location.href=\"{$my_base_url}{$my_pligg_base}/user/search/\"+encodeURIComponent(this.keyword.value); return false;'";
		{/php}
>
					<input type="hidden" name="view" value="search">
					<input type="text" placeholder="{#PLIGG_Visual_User_Search_Users#}" name="keyword" class="field">
					<input type="submit" value="{#PLIGG_Visual_User_Search_Users#}" class="btn btn-primary">
					</form>
				</div>
			{/if}
			{if $user_login neq $user_logged_in}	  
				<img src="{$my_pligg_base}/templates/{$the_template}/images/friends.png" align="absmiddle" />
				<a href="{$user_url_friends}">{#PLIGG_Visual_User_Profile_View_Friends#}</a>
				&nbsp;|&nbsp;
				<img src="{$my_pligg_base}/templates/{$the_template}/images/friends2.png" align="absmiddle" />
				<a href="{$user_url_friends2}">{#PLIGG_Visual_User_Profile_View_Friends_2#}</a>	  
			{/if}

		{/if}
	</div>

	<br /><br />
	<h2 style="text-align:center;">{#PLIGG_Visual_User_Profile_Friend_Removed#}</h2>
{/if}


{if $user_view eq 'addfriend'}

	<br /><br />
	<h2 style="text-align:center;">{#PLIGG_Visual_User_Profile_Friend_Added#}</h2>
{/if}
{*if $user_view eq 'profile'*}
	<div id="wrapper">
		<div id="personal_info">
				{if $UseAvatars neq "0"}
				<a class="avatar" id="ls_avatar" title="{$user_username}" href="{$user_url_personal_data}"><img src="{$Avatar_ImgSrc}" class="avatar"><p>{$user_username}</p></a>
				{/if}
			<ul style="border:none" class="unstyled">
				{if $user_names ne ""}
				<li>
					{#PLIGG_Visual_User_Profile_User#}:{$user_names}
				</li>
				{/if}
				{if $user_url ne ""}
				<li>
					{#PLIGG_Visual_User_Profile_Homepage#}:<a href="{$user_url}" target="_blank" rel="nofollow">{$user_url}</a>
				</li>
				{/if}
				{if $user_publicemail ne ""}
				<li>
				{#PLIGG_Visual_User_Profile_PublicEmail#}:{$user_publicemail}
				</li>
				{/if}
				{if $user_location ne ""}
				<li>
					{#PLIGG_Visual_Profile_Location#}:{$user_location}
				</li>
				{/if}
				{if $user_occupation ne ""}
				<li>
					{#PLIGG_Visual_Profile_Occupation#}:{$user_occupation}
				</li>
				{/if}
				{if $user_aim ne ""}
				<li>
					{#PLIGG_Visual_User_Profile_AIM#}:{$user_aim}
				</li>
				{/if}
				{if $user_msn ne ""}
				<li>
					{#PLIGG_Visual_User_Profile_MSN#}:{$user_msn}
				</li>
				{/if}
				{if $user_yahoo ne ""}
				<li>
				{#PLIGG_Visual_User_Profile_Yahoo#}:{$user_yahoo}
				</li>
				{/if}
				{if $user_gtalk ne ""}
				<li>
					{#PLIGG_Visual_User_Profile_GTalk#}:{$user_gtalk}
				</li>
				{/if}
				{if $user_skype ne ""}
				<li>
					{#PLIGG_Visual_User_Profile_Skype#}:{$user_skype}
				</li>
				{/if}
			</ul>
		</div>
		
		<ul id="stats" class="unstyled">
				{if $user_karma > "0.00"}
				<li>
					{#PLIGG_Visual_Rank#}:
					{$user_rank}
				</li>
				<li>
					{#PLIGG_Visual_User_Profile_KarmaPoints#}:{$user_karma}
				</li>
				{/if}
				<li>
					{#PLIGG_Visual_User_Profile_Joined#}:{$user_joined}
				</li>
			
			
		</ul>
		<div class="navbar {if $user_logged_in}navbar-logged-in{/if}">	
				<a href="{$user_url_friends}" title="{#PLIGG_Visual_Users_Im_Following#}" {*{$simple_messaging_img_path}friends.png*}><i class="black icon-follow"></i>
					{#PLIGG_Visual_Users_Im_Following#}
				</a>
				&nbsp;|&nbsp;
				<a href="{$user_url_friends2}" title="{#PLIGG_Visual_Users_Following_me#}" {*{$simple_messaging_img_path}*}>
				<i class="black icon-followed"></i>{#PLIGG_Visual_Users_Following_me#}
				</a>
				<div style="clear:left"></div>
		{if $Allow_Friends neq "0"}	
			{if $user_login neq $user_logged_in}
			{if check_for_enabled_module('simple_messaging',0.6) && $is_friend}{if $friends}<img src="{$my_pligg_base}/modules/simple_messaging/images/reply.png" border="0" align="absmiddle" /> <a href="{$my_pligg_base}/module.php?module=simple_messaging&view=compose&return={$templatelite.server.REQUEST_URI|urlencode}&to={$user_login}">{#PLIGG_Visual_User_Profile_Message#} <span style="text-transform:capitalize;">{$user_login}</span></a> &nbsp;|&nbsp;{/if}{/if}

				{if $is_friend gt 0}
					<img src="{$my_pligg_base}/templates/{$the_template}/images/user_delete.gif" align="absmiddle" />
					<a href="{$user_url_remove}">{#PLIGG_Visual_User_Profile_Remove_Friend#} <span style="text-transform:capitalize;">{$user_login}</span> {*#PLIGG_Visual_User_Profile_Remove_Friend_2#*}</a>

			   		{if $user_authenticated eq true}
						{checkActionsTpl location="tpl_user_center"}
					{/if}
		 			
				{else}
		  				
					{if $user_authenticated eq true} 					
						<img src="{$my_pligg_base}/templates/{$the_template}/images/user_add.gif" align="absmiddle" />
						<a href="{$user_url_add}">	{#PLIGG_Visual_User_Profile_Add_Friend#} <span style="text-transform:capitalize;">{$user_login}</span> {#PLIGG_Visual_User_Profile_Add_Friend_2#}</a>
					{/if}   
		   
				{/if}   
		   		
			{else}
			
		  
			{/if} 
		{/if}
	</div>	
		{if $enable_group eq "true"}
		<div id="groups">
			<fieldset><legend>{#PLIGG_Visual_User_Profile_User_Groups#}</legend>
				<ul class="group_membership_list unstyled">{$sidebar_usergroups}</ul>
			</fieldset>
		</div>
		{/if}
		
		{if $Allow_Friends neq "0"}
		<div>
			<fieldset><legend>{#PLIGG_Visual_User_Profile_Friends#}</legend>
			{if $friends}			
				<ul  class="unstyled">
					{foreach from=$friends item=myfriend}
							{php}
								$this->_vars['friend_avatar'] = get_avatar('large', $this->_vars['myfriend']['user_avatar_source'], $this->_vars['myfriend']['user_login'], $this->_vars['myfriend']['user_email']);
								$this->_vars['profileURL'] = getmyurl('user2', $this->_vars['myfriend']['user_login'], 'profile');
								$this->_vars['removeURL'] = getmyurl('user_add_remove', $this->_vars['myfriend']['user_login'], 'removefriend');
							{/php}
						
							<li><a href="{$profileURL}"><img src="{$friend_avatar}" style="text-decoration:none;border:0;"/></a>
								<p><a href="{$profileURL}">{$myfriend.user_login}</a></p>
							</li>
							
							{checkActionsTpl location="tpl_pligg_profile_friend_td"}
		
						
						{/foreach}
				</ul>
				{else}
				<br /><span style="text-transform:capitalize;">{$user_username}</span> {#PLIGG_Visual_User_Profile_No_Friends#}
			{/if}
			
			
			</fieldset>
		</div>
		{/if}
		
		<div class="clear"> </div>

	</div>	

{*/if*}