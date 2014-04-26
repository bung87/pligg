 <!-- START NAVBAR -->
<div id="topnav" class="navbar navbar-inverse">
<div class="navbar-inner">
<div class="container">
<div id="login">
	<div id="logo" class="brand"><a href="{$my_base_url}{$my_pligg_base}">{#PLIGG_Visual_Name#}</a></div>
	<div class="nav-collapse collapse navbar-inverse-collapse">
                    <ul class="nav">           
	{checkActionsTpl location="tpl_pligg_navbar_start"}
	<li {if $pagename eq "published" || $pagename eq "index"}class="active"{/if}><a href='{$my_base_url}{$URL_base}'>{#PLIGG_Visual_Published_News#}</a></li>
	<li {if $pagename eq "upcoming"}class="active"{/if}><a href="{$URL_upcoming}">{#PLIGG_Visual_Pligg_Queued#}</a></li>
	<!--li {if $pagename eq "submit"}class="active"{/if}><a href="{$URL_submit}">{#PLIGG_Visual_Submit_A_New_Story#}</a></li-->
	{if $Enable_Live}
	<li {if $pagename eq "live"}class="active"{/if}><a href='{$URL_live}'> {#PLIGG_Visual_Live#}</a></li>
	{/if}
	{if $enable_group eq "true"}	
		<li {if $pagename eq "groups" || $pagename eq "submit_groups" || $pagename eq "group_story"}class="active"{/if}><a href="{$URL_groups}"><span>{#PLIGG_Visual_Groups#}</span></a></li>
	{/if}
	<li {if $pagename eq "cloud"}class="active"{/if}><a href="{$URL_tagcloud}">{#PLIGG_Visual_Tags#}</a></li>
	<!--{if $user_authenticated eq true}<li {if $pagename eq "user"}class="active"{/if}><a href="{$URL_userNoVar}"><span>{#PLIGG_Visual_Profile#}</span></a></li>{/if}-->
	{if isset($isgod) && $isgod eq 1}<li><a href="{$URL_admin}"><span>{#PLIGG_Visual_Header_AdminPanel#}</span></a></li>{/if}
	{checkActionsTpl location="tpl_pligg_navbar_end"}
                    </ul>
                    <script type="text/javascript">
{if !isset($searchboxtext)}
	{assign var=searchboxtext value=#PLIGG_Visual_Search_SearchDefaultText#}			
{/if}
var some_search='{$searchboxtext}';
</script>
<!-- START SEARCH -->

	<form action="{$my_pligg_base}/search.php" method="get" name="thisform-search" id="thisform-search" {if $urlmethod==2}onsubmit='document.location.href="{$my_base_url}{$my_pligg_base}/search/"+this.search.value.replace(/\//g,"|").replace(/\?/g,"%3F"); return false;'{/if} class="form-search navbar-search pull-left">
<div class="input-append">
  <input type="text" size="20" class="span2 search-query" name="search" id="searchsite" value="{$searchboxtext}" onfocus="if(this.value == some_search) {ldelim}this.value = '';{rdelim}" onblur="if (this.value == '') {ldelim}this.value = some_search;{rdelim}"/>

  <input title="{#PLIGG_Visual_Search_Go#}" type="submit" value="" class="btn btn-inverse" style="background-image: url(bootstrap/img/glyphicons-halflings-white.png);background-repeat: no-repeat;background-position: -40px 6px;width: 32px;" />
</div>		
	</form>
<!-- END SEARCH -->
<ul class="nav pull-right">
    <li>{ include file="bookmarklet.tpl" }</li>
</ul>
    </div><!-- END nav-collapse collapse navbar-inverse-collapse-->
	<ul class="nav pull-right">{if $user_authenticated eq true}
			<li><span style="line-height: 40px;">{#PLIGG_Visual_Welcome_Back#}</span></li>
                <li>
                    <a href="{$URL_userNoVar}" style="text-transform:capitalize;color:white" title="{#PLIGG_Visual_User_PersonalData#}">{$user_logged_in}</a></li>
                <li class="divider-vertical"></li>
                <li> <a href="{$my_pligg_base}/submit.php" title="{#PLIGG_Visual_Submit_A_New_Story#}"><i class="icon-edit" style="margin-top: 2px;"></i></a></li>
                 <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-envelope"></i> <b class="caret"></b></a>
         <ul class="dropdown-menu" style="min-width: 90px;">
			<li class="tab1" >
			<a href="{$my_pligg_base}/module.php?module=simple_messaging&view=inbox" {if $modulepage eq "simple_messaging_inbox" || $modulepage eq "viewmsg"}style="background:#fff;border-bottom:1px solid #fff;"{/if}><img src="{$simple_messaging_img_path}email.png" alt="" align="absmiddle"/>
				{#PLIGG_MESSAGING_Inbox#}
			</a>
		</li>
		<li class="tab2">
			<a href="{$my_pligg_base}/module.php?module=simple_messaging&view=sent" {if $modulepage eq "simple_messaging_sent" ||  $modulepage eq "viewsentmsg"}style="background:#fff;border-bottom:1px solid #fff;"{/if}><img src="{$simple_messaging_img_path}reply.png" alt="" align="absmiddle"/>		
				{#PLIGG_MESSAGING_Sent_Messages#}
			</a>
		</li>
		{if $Allow_Friends neq "0"}	 
			<li class="tab3">
				<a href="{$user_url_friends}"><img src="{$simple_messaging_img_path}friends.png" alt="" align="absmiddle"/>
					{#PLIGG_MESSAGING_Users_Im_Following#}
				</a>
			</li>
			<li class="tab4">
				<a href="{$user_url_friends2}"><img src="{$simple_messaging_img_path}friends2.png" alt="" align="absmiddle"/>
					{#PLIGG_MESSAGING_Users_Following_me#}
				</a>
			</li>
		{/if}	
    </ul>
    </li>
    <li>{if $user_authenticated eq true}<a href="{$URL_userNoVar}" title="{#PLIGG_Visual_User_Setting#}"><i class="icon-cog" style="margin-top: 2px;"></i></a>{/if}</li>
    <li class="divider-vertical"></li>
    <li> <a href="{$URL_logout}"> {#PLIGG_Visual_Logout#}</a></li>
    </ul>
{/if}
	{if $user_authenticated neq true}
	<ul class="nav pull-right">
		<li><a href='{$URL_register}'>{#PLIGG_Visual_Register#}</a></li>
		<li class="divider-vertical"></li>
		<li><a href='{$URL_login}'>{#PLIGG_Visual_Login_Title#}</a></li>
	</ul>
    {/if}
	{checkActionsTpl location="tpl_pligg_login_link"}
</div>
</div><!-- END CONTAINER -->
</div><!-- END NAV INNER -->
</div><!-- END navbar-inverse -->
<!-- END NAVBAR -->