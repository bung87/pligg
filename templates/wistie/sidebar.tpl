{if $pagename neq "submit"}
	{checkActionsTpl location="tpl_pligg_sidebar2_start"}
	{if $user_authenticated ne true} {assign var=sidebar_module value="login"}{include file=$the_template_sidebar_modules."/wrapper2.tpl"} {/if}
		{if $pagename eq "user"}
			<div class="headline">
				<div class="sectiontitle"><!--a href="{$user_url_personal_data}">{#PLIGG_Visual_Profile#}</a--></div>
			</div>
			<div id="navcontainer">
				<ul id="navlist">
					{checkActionsTpl location="tpl_pligg_profile_sort_start"}
					<!-- <li><a href="{$user_url_personal_data}" class="navbut{$nav_pd}"><span>{#PLIGG_Visual_User_PersonalData#}</span></a></li>
					{if $user_login eq $user_logged_in}
					<li><a href="{$user_url_setting}" class="navbut{$nav_set}"><span>{#PLIGG_Visual_User_Setting#}</span></a></li>
					{/if} -->
					<li><a href="{$user_url_news_sent}" class="navbut{$nav_ns}"><span>{#PLIGG_Visual_User_NewsSent#}</span>{$user_total_links}</a></li>
					<li><a href="{$user_url_news_published}" class="navbut{$nav_np}"><span>{#PLIGG_Visual_User_NewsPublished#}</span>{$user_published_links}</a></li>
					<li><a href="{$user_url_news_unpublished}" class="navbut{$nav_nu}"><span>{#PLIGG_Visual_User_NewsUnPublished#}</span></a></li>
					<li><a href="{$user_url_commented}" class="navbut{$nav_c}"><span>{#PLIGG_Visual_User_NewsCommented#}</span>{$user_total_comments}</a></li>
					<li><a href="{$user_url_news_voted}" class="navbut{$nav_nv}"><span>{#PLIGG_Visual_User_NewsVoted#}</span>{$user_total_votes}</a></li>
					<li><a href="{$user_url_saved}" class="navbut{$nav_s}"><span>{#PLIGG_Visual_User_NewsSaved#}</span></a></li>
					{checkActionsTpl location="tpl_pligg_profile_sort_end"}
				</ul>
			</div>
		{/if}
                 {checkActionsTpl location="tpl_pligg_sidebar_middle"}
	<!-- START ABOUT -->
		{assign var=sidebar_module value="about_box"}{include file=$the_template_sidebar_modules."/wrapper.tpl"}
	<!-- END ABOUT -->
	<!-- START LINKS -->
	{*
		<div class="links">
	    <div class="sectiontitle"><a href='{$URL_topusers}'> {#PLIGG_Visual_Top_Users#}</a></div>
	     </div>
	*}        	
	            {*if $pagename eq "published" || $pagename eq "index" || $pagename eq "upcoming" && $pagename neq "groups"}
				{if $Enable_Tags}
	            <div class="links">
	            	<div class="sectiontitle"><a href="{$URL_tagcloud}">{#PLIGG_Visual_Tags#}</a></div>
	            </div>
				{/if}
				{/if*}
			<!--	{if $Enable_Live}
	            <div class="links">
	            	<div class="sectiontitle"><a href='{$URL_live}'> {#PLIGG_Visual_Live#}</a></div>
	            </div>
				{/if}
			-->
	<!-- END LINKS -->
	{checkActionsTpl location="tpl_pligg_sidebar2_end"}
	<br />
{/if}