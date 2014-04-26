<!-- START HEADER.TPL -->
<!-- START NAVBAR -->
{*
<ul id="nav">
	{checkActionsTpl location="tpl_pligg_navbar_start"}
	<li {if $pagename eq "published" || $pagename eq "index"}class="current"{/if}><a href='{$my_base_url}{$URL_base}'>{#PLIGG_Visual_Published_News#}</a></li>
	<li {if $pagename eq "upcoming"}class="current"{/if}><a href="{$URL_upcoming}">{#PLIGG_Visual_Pligg_Queued#}</a></li>
	<!--li {if $pagename eq "submit"}class="current"{/if}><a href="{$URL_submit}">{#PLIGG_Visual_Submit_A_New_Story#}</a></li-->
	{if $Enable_Live}
	<li><a href='{$URL_live}'> {#PLIGG_Visual_Live#}</a></li>
	{/if}
	{if $enable_group eq "true"}	
		<li {if $pagename eq "groups" || $pagename eq "submit_groups" || $pagename eq "group_story"}class="current"{/if}><a href="{$URL_groups}"><span>{#PLIGG_Visual_Groups#}</span></a></li>
	{/if}	
	<!--{if $user_authenticated eq true}<li {if $pagename eq "user"}class="current"{/if}><a href="{$URL_userNoVar}"><span>{#PLIGG_Visual_Profile#}</span></a></li>{/if}-->
	{if isset($isgod) && $isgod eq 1}<li><a href="{$URL_admin}"><span>{#PLIGG_Visual_Header_AdminPanel#}</span></a></li>{/if}
	{checkActionsTpl location="tpl_pligg_navbar_end"}
</ul>
*}

{*removed by bung, unused ;assign var=sidebar_module value="categories"}
{include file=$the_template_sidebar_modules."/wrapper.tpl"*}
<!-- END NAVBAR -->
<!-- END HEADER.TPL