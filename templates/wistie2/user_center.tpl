{checkActionsTpl location="tpl_pligg_profile_start"}

{checkActionsTpl location="tpl_user_center_just_below_header"}
{if $user_view eq 'search'}
	<div class="navbar {if $user_logged_in}navbar-logged-in{/if}">
		{if $Allow_Friends neq "0"}	
			<div id="search_users">
				<form action="{$my_pligg_base}/user.php" method="get"
		{php}
		global $URLMethod, $my_base_url, $my_pligg_base;
		if ($URLMethod==2) print "onsubmit='document.location.href=\"{$my_base_url}{$my_pligg_base}/user/search/\"+encodeURIComponent(this.keyword.value); return false;'";
		{/php}
>
				<input type="hidden" name="view" value="search">
					{if $get.keyword neq ""}
						{assign var=searchboxtext value=$get.keyword}
					{else}
						{assign var=searchboxtext value=#PLIGG_Visual_Search_SearchDefaultText#}			
					{/if}
				<input type="text" placeholder="{#PLIGG_Visual_User_Search_Users#}" name="keyword" class="field" value="{$searchboxtext}" onfocus="if(this.value == '{$searchboxtext}') {ldelim}this.value = '';{rdelim}" onblur="if (this.value == '') {ldelim}this.value = '{$searchboxtext}';{rdelim}">
				<input type="submit" value="{#PLIGG_Visual_User_Search_Users#}" class="btn btn-primary">
				</form>
			</div>
			{if $user_login neq $user_logged_in}
				{if $is_friend gt 0}
					<img src="{$my_pligg_base}/templates/{$the_template}/images/user_delete.gif" align="absmiddle" />
					<a href="{$user_url_remove}">{#PLIGG_Visual_User_Profile_Remove_Friend#} {$user_login} {#PLIGG_Visual_User_Profile_Remove_Friend_2#}</a>
					{if $user_authenticated eq true}
						{checkActionsTpl location="tpl_user_center"}
					{/if} 			
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


{if $user_view eq 'viewfriends'}
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
					<input type="submit" value="{#PLIGG_Visual_User_Search_Users#}" class="button">
					</form>
				</div>
			{/if}
			
			<img src="{$my_pligg_base}/templates/{$the_template}/images/friends2.png" align="absmiddle" /> 
			<a href="{$user_url_friends2}">{#PLIGG_Visual_User_Profile_View_Friends_2#}</a> 

		{/if}
	</div>

	<h2>{#PLIGG_Visual_User_Profile_Your_Friends#}</h2>

	{if $friends}
	  	<table>
		<th style="width:250px;text-align:left;">{#PLIGG_Visual_User_Profile_Username#}</th>
		{if c小组内分享heck_for_enabled_module('simple_messaging',0.6) && $is_friend}<th style="width:90px;text-align:left;">{#PLIGG_Visual_User_Profile_Message#}</th>{/if}
		<th style="width:60px;text-align:center;">{#PLIGG_Visual_User_Profile_Remove_Friend#}</th>
		{foreach from=$friends item=myfriend}
			{php}
				$this->_vars['friend_avatar'] = get_avatar('small', $this->_vars['myfriend']['user_avatar_source'], $this->_vars['myfriend']['user_login'], $this->_vars['myfriend']['user_email']);
				$this->_vars['profileURL'] = getmyurl('user2', $this->_vars['myfriend']['user_login'], 'profile');
				$this->_vars['removeURL'] = getmyurl('user_add_remove', $this->_vars['myfriend']['user_login'], 'removefriend');
			{/php}
			<tr>
			<td><img src="{$friend_avatar}" align="absmiddle" /> <a href="{$profileURL}">{$myfriend.user_login}</a></td>
			{if check_for_enabled_module('simple_messaging',0.6) && $is_friend}<td align="center"><a href="{$my_pligg_base}/module.php?module=simple_messaging&view=compose&return={$templatelite.server.REQUEST_URI|urlencode}&to={$myfriend.user_login}"><img src="{$my_pligg_base}/modules/simple_messaging/images/reply.png" border="0" /></a></td>{/if}
			<td align="center"><a href = "{$removeURL}"><img src="{$my_pligg_base}/templates/{$the_template}/images/user_delete.gif" border=0></a></td>
			</tr>
		{/foreach}
		</table>
	{else}
		<br /><br />
		<h2 style="text-align:center;"><span style="text-transform:capitalize;">{$user_username}</span> {#PLIGG_Visual_User_Profile_No_Friends#}</h2>
	{/if}
{/if}

{if $user_view eq 'setting'}
	<div class="navbar" style="margin-bottom:-20px;border-bottom:0;"></div>
	{checkActionsTpl location="tpl_pligg_profile_settings_start"}
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
	{checkActionsTpl location="tpl_pligg_profile_settings_end"}
	<div style="margin-top:5px;border-bottom:2px solid #DEDEDE;"> </div>
{/if}

{if $user_view eq 'viewfriends2'}
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
			<img src="{$my_pligg_base}/templates/{$the_template}/images/friends.png" align="absmiddle" />
			<a href="{$user_url_friends}">{#PLIGG_Visual_User_Profile_View_Friends#}</a>

		{/if}
	</div>

	<h2>{#PLIGG_Visual_User_Profile_Viewing_Friends_2a#}</h2>
	{if $friends}
	  	<table>
			{if check_for_enabled_module('simple_messaging',0.6) && $is_friend}
				<th style="width:250px;text-align:left;">{#PLIGG_Visual_User_Profile_Username#}</th>
				<th style="width:60px;text-align:left;">{#PLIGG_Visual_User_Profile_Message#}</th>
			{/if}
			{foreach from=$friends item=myfriend}
				{php}
					$this->_vars['friend_avatar'] = get_avatar('small', $this->_vars['myfriend']['user_avatar_source'], $this->_vars['myfriend']['user_login'], $this->_vars['myfriend']['user_email']);
					$this->_vars['profileURL'] = getmyurl('user2', $this->_vars['myfriend']['user_login'], 'profile');
					$this->_vars['removeURL'] = getmyurl('user_add_remove', $this->_vars['myfriend']['user_login'], 'removefriend');
				{/php}

				<tr>
				<td><img src="{$friend_avatar}" align="absmiddle" /> <a href="{$profileURL}">{$myfriend.user_login}</a></td>
				{if check_for_enabled_module('simple_messaging',0.6) && $is_friend}<td><a href="{$my_pligg_base}/module.php?module=simple_messaging&view=compose&to={$myfriend.user_login}&return={$templatelite.server.REQUEST_URI|urlencode}"><img src="{$my_pligg_base}/modules/simple_messaging/images/reply.png" border="0" /></a></td>{/if}
				</tr>
			{/foreach}
		</table>
	{else}
		<br /><br />
		<h2 style="text-align:center;"><span style="text-transform:capitalize;">{$user_username}</span> {#PLIGG_Visual_User_Profile_No_Friends_2#}</h2>
	{/if}
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
			
			<img src="{$my_pligg_base}/templates/{$the_template}/images/friends.png" align="absmiddle" />
			<a href="{$user_url_friends}">{#PLIGG_Visual_User_Profile_View_Friends#}</a>
			&nbsp;|&nbsp;
			<img src="{$my_pligg_base}/templates/{$the_template}/images/friends2.png" align="absmiddle" />
			<a href="{$user_url_friends2}">{#PLIGG_Visual_User_Profile_View_Friends_2#}</a>

		{/if}
	</div>

	<br /><br />
	<h2 style="text-align:center;">{#PLIGG_Visual_User_Profile_Friend_Added#}</h2>
{/if}


{if $user_view eq 'profile'}
	<div id="wrapper">
		{checkActionsTpl location="tpl_pligg_profile_info_start"}
		
		<div id="personal_info">
			
			{checkActionsTpl location="tpl_show_extra_profile"}

			</fieldset>
		</div>
		
		{checkActionsTpl location="tpl_pligg_profile_info_middle"}

		
		<div class="clear"> </div>

		{checkActionsTpl location="tpl_pligg_profile_info_end"}

	</div>	
{/if}


{*php}do_history();{/php}
{if isset($user_page)}{$user_page}{/if}
{php}do_published();{/php}
{if isset($user_page)}{$user_page}{/if}
{php}do_shaken();{/php}
{if isset($user_page)}{$user_page}{/if}
{php}do_commented();{/php}
{if isset($user_page)}{$user_page}{/if}
{php}do_voted();{/php}
{if isset($user_page)}{$user_page}{/if}
{php}do_stories();{/php}
{if isset($user_page)}{$user_page}{/if*}
{*if $user_view eq 'profile'}
{#PLIGG_Visual_AdminPanel_Latest_Submission#}
{/if*}
{if isset($user_page)}{$user_page}{/if}	
{if isset($user_pagination)}{checkActionsTpl location="tpl_pligg_pagination_start"}{$user_pagination}{checkActionsTpl location="tpl_pligg_pagination_end"}{/if}
{checkActionsTpl location="tpl_pligg_profile_end"}