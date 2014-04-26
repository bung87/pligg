<!DOCTYPE html>
<html dir="{#PLIGG_Visual_Language_Direction#}">
<head>
	{checkActionsTpl location="tpl_pligg_head_start"}
	{include file="meta.tpl"}
	<link rel="stylesheet" type="text/css" href="{$my_pligg_base}/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="{$my_pligg_base}/bootstrap/css/bootstrap-responsive.min.css" />

	<link rel="stylesheet" type="text/css" href="{$my_pligg_base}/templates/{$the_template}/css/style.css" media="screen" />
	{*if $pagename eq "submit"}<link rel="stylesheet" type="text/css" href="{$my_pligg_base}/templates/{$the_template}/css/wick.css" />{/if*}
	{* dropdown-menu for categories use,but unused now---bung
	<link rel="stylesheet" type="text/css" href="{$my_pligg_base}/templates/{$the_template}/css/dropdown.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="{$my_pligg_base}/templates/{$the_template}/css/dropdown-default.css" media="screen" />
	*}
	
	<script type="text/javascript" src="{$my_pligg_base}/jslibs/jquery-2.0.0.min.js"></script>
	<script type="text/javascript" src="{$my_pligg_base}/bootstrap/js/bootstrap.min.js"></script>

	<!--[if lt IE 7]>
	<script type="text/javascript" src="{$my_pligg_base}/templates/{$the_template}/js/jquery/jquery.dropdown.js"></script>
	<![endif]-->
	{if $Voting_Method eq 2}
	<link rel="stylesheet" type="text/css" href="{$my_pligg_base}/templates/{$the_template}/css/star_rating/star.css" media="screen" />
	{/if}
	{checkForCss}
	{checkForJs}		
	{if $pagename neq "published" && $pagename neq "upcoming"}
		{if $Spell_Checker eq 1}			
			<script src="{$my_pligg_base}/3rdparty/speller/spellChecker.js" type="text/javascript"></script>
		{/if}
	{/if}
	{if preg_match('/index.php$/',$templatelite.server.SCRIPT_NAME)}	
		{if $get.category}
			{if $get.page>1}
				<title>{$navbar_where.text2} | {#PLIGG_Page_Title#} {$get.page} | {#PLIGG_Visual_Breadcrumb_Published_Tab#} | {#PLIGG_Visual_Name#}</title>
			{else}
				<title>{$navbar_where.text2} | {#PLIGG_Visual_Breadcrumb_Published_Tab#} | {#PLIGG_Visual_Name#}</title>
			{/if}
		{elseif $get.page>1}
			<title>{#PLIGG_Visual_Breadcrumb_Published_Tab#} | {#PLIGG_Page_Title#} {$get.page} | {#PLIGG_Visual_Name#}</title>
		{else}
			<title>{#PLIGG_Visual_Name#} - {#PLIGG_Visual_RSS_Description#}</title>
		{/if}
	{elseif preg_match('/upcoming.php$/',$templatelite.server.SCRIPT_NAME)}	
		{if $get.category}
			{if $get.page>1}
				<title>{$navbar_where.text2} | {#PLIGG_Page_Title#} {$get.page} | {#PLIGG_Visual_Breadcrumb_Unpublished_Tab#} | {#PLIGG_Visual_Name#}</title>
			{else}
				<title>{$navbar_where.text2} | {#PLIGG_Visual_Breadcrumb_Unpublished_Tab#} | {#PLIGG_Visual_Name#}</title>
			{/if}
		{elseif $get.page>1}
			<title>{#PLIGG_Visual_Breadcrumb_Unpublished_Tab#} | {#PLIGG_Page_Title#} {$get.page} | {#PLIGG_Visual_Name#}</title>
		{else}
			<title>{#PLIGG_Visual_Breadcrumb_Unpublished_Tab#} | {#PLIGG_Visual_Name#}</title>
		{/if}
	{elseif preg_match('/submit.php$/',$templatelite.server.SCRIPT_NAME)}	
		<title>{#PLIGG_Visual_Submit#} | {#PLIGG_Visual_Name#}</title>
	{elseif preg_match('/editlink.php$/',$templatelite.server.SCRIPT_NAME)}	
		<title>{#PLIGG_Visual_EditStory_Header#}: {$submit_url_title} | {#PLIGG_Visual_Name#}</title>
	{elseif preg_match('/advancedsearch.php$/',$templatelite.server.SCRIPT_NAME)}	
		<title>{#PLIGG_Visual_Search_Advanced#} | {#PLIGG_Visual_Name#}</title>
	{elseif preg_match('/search.php$/',$templatelite.server.SCRIPT_NAME)}	
		<title>{#PLIGG_Visual_Search_SearchResults#} '{if $get.search}{$get.search}{else}{$get.date}{/if}' | {#PLIGG_Visual_Name#}</title>
	{elseif preg_match('/groups.php$/',$templatelite.server.SCRIPT_NAME)}	
		{if $get.page>1}
			<title>{#PLIGG_Visual_Groups#} | {#PLIGG_Page_Title#} {$get.page} | {#PLIGG_Visual_Name#}</title>
		{else}
			<title>{#PLIGG_Visual_Groups#} | {#PLIGG_Visual_Name#}</title>
		{/if}
	{elseif preg_match('/editgroup.php$/',$templatelite.server.SCRIPT_NAME)}	
		<title>{$group_name} | {#PLIGG_Visual_Name#}</title>
	{elseif preg_match('/group_story.php$/',$templatelite.server.SCRIPT_NAME)}	
		{if $groupview!='published'}
			{if $groupview eq "upcoming"}
				{assign var='tview' value=#PLIGG_Visual_Group_Upcoming#}
			{elseif $groupview eq "shared"}
				{assign var='tview' value=#PLIGG_Visual_Group_Shared#}
			{elseif $groupview eq "members"}
				{assign var='tview' value=#PLIGG_Visual_Group_Member#}
			{/if}

			{if $get.page>1}
				<title>{$group_name} | {if $get.category}{$navbar_where.text2} | {/if}{$tview} | {#PLIGG_Page_Title#} {$get.page} | {#PLIGG_Visual_Name#}</title>
			{else}
				<title>{$group_name} | {if $get.category}{$navbar_where.text2} | {/if}{$tview} | {#PLIGG_Visual_Name#}</title>
			{/if}
		{elseif $get.page>1}
			<title>{$group_name} | {#PLIGG_Page_Title#} {$get.page} | {#PLIGG_Visual_Name#}</title>
		{else}
			<title>{$group_name} - {$group_description} | {#PLIGG_Visual_Name#}</title>
		{/if}
	{elseif $pagename eq "register_complete"}
		<title>{#PLIGG_Validate_user_email_Title#} | {#PLIGG_Visual_Name#}</title>
	{elseif $pagename eq "404"}
		<title>{#PLIGG_Visual_404_Error#} | {#PLIGG_Visual_Name#}</title>
	{else}	
		<title>{$posttitle} | {$pretitle} {#PLIGG_Visual_Name#}</title>
	{/if}
	<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="{$my_base_url}{$my_pligg_base}/rss.php"/>
	<link rel="icon" href="{$my_pligg_base}/favicon.ico" type="image/x-icon"/>
	{if $pagename eq 'published'}<link rel="canonical" href="{$my_base_url}{$my_pligg_base}/{$navbar_where.text2}/" />{/if}
	{if $pagename eq 'index'}<link rel="canonical" href="{$my_base_url}{$my_pligg_base}/" />{/if}
	{if $pagename eq 'story'}<link rel="canonical" href="{$my_base_url}{$my_pligg_base}{$navbar_where.link2}" />{/if}
	
	{checkActionsTpl location="tpl_pligg_head_end"}
</head>
<body dir="{#PLIGG_Visual_Language_Direction#}" {$body_args}>
	{include file=$the_template.'/top.tpl'}
	{checkActionsTpl location="tpl_pligg_body_start"}
<!-- START CONTENT -->
	<div id="content" class="clearfix container container-fluid">
		 <div class="row-fluid">
		{literal}
			<script type="text/javascript" language="JavaScript">
			function checkForm() {
			answer = true;
			if (siw && siw.selectingSomething)
				answer = false;
			return answer;
			}//
			</script>
		{/literal}
		{checkActionsTpl location="tpl_pligg_banner_top"}
		{include file=$tpl_header.".tpl"}	
<!-- START LEFT COLUMN -->
	{if $pagename eq "submit"}
		<div id="leftcol-superwide">
	{else}
		<div id="leftcol" class="span8">
	{/if}
		<!-- START BREADCRUMBS -->
{if $pagename eq "submit_groups"}<h1>{#PLIGG_Visual_Submit_A_New_Group#}</h1>{/if}
{if $pagename eq "groups"}
<div class="clearfix well well-small" style="padding:0;margin-top:10px">
<h1 class="pull-left" style="margin:0">{#PLIGG_Visual_Groups#}</h1>
<div class=" pull-right" style="margin: 10px;">
<div class="btn-group">
                <button class="btn btn-mini">{#PLIGG_Visual_Pligg_Queued_Sort#}</button>
                <button class="btn btn-mini dropdown-toggle" data-toggle="dropdown" ><span class="caret" style="margin-bottom:8px"></span></button>
                <ul class="dropdown-menu">
					<li {if $groupview eq "published"}class="active"{/if}><a href="{$groupview_published}">{#PLIGG_Visual_Group_Published#}</a></li>
					<li {if $groupview eq "upcoming"}class="active"{/if}><a href="{$groupview_upcoming}">{#PLIGG_Visual_Group_Upcoming#}</a></li>
					<li {if $groupview eq "shared"}class="active"{/if}><a href="{$groupview_sharing}">{#PLIGG_Visual_Group_Shared#}</a></li>
					<li {if $groupview eq "members"}class="active"{/if}><a href="{$groupview_members}">{#PLIGG_Visual_Group_Member#}</a></li>       
                </ul>
              </div>
</div>	
	<div id="search_groups" class="form-search pull-right">
			<form action="{$my_pligg_base}/groups.php" method="get" class="input-append"
				{if $urlmethod eq 2}
					onsubmit="document.location.href = '{$my_base_url}{$my_pligg_base}/groups/search/' + encodeURIComponent(this.keyword.value); return false;"
			{/if}>
				<input type="hidden" name="view" value="search">
					{if $get.keyword neq ""}
						{assign var=searchboxtext value=$get.keyword}
					{else}
						{assign var=searchboxtext value=#PLIGG_Visual_Search_SearchDefaultText#}			
					{/if}
				<input type="text" name="keyword" class="search-query" value="{$searchboxtext}" onfocus="if(this.value == '{$searchboxtext}') {ldelim}this.value = '';{rdelim}" onblur="if (this.value == '') {ldelim}this.value = '{$searchboxtext}';{rdelim}">
				<input type="submit" title="{#PLIGG_Visual_Group_Search_Groups#}" value="" class="btn" style="background-image: url(bootstrap/img/glyphicons-halflings.png);background-repeat: no-repeat;background-position: -40px 6px;width: 32px;">
				</form>
			</div>
</div>
{/if}
{if $pagename eq "group_story" }
<div class="clearfix well well-small" style="padding:0;margin-top:10px">
<h1 class="pull-left" style="margin:0">{$group_name}</h1>
<div class=" pull-right" style="margin: 10px;">
	<div class="btn-group">
                <button class="btn btn-mini">{#PLIGG_Visual_Pligg_Queued_Sort#}</button>
                <button class="btn btn-mini dropdown-toggle" data-toggle="dropdown" ><span class="caret" style="margin-bottom:8px"></span></button>
                <ul class="dropdown-menu">
					<li {if $groupview eq "published"}class="active"{/if}><a href="{$groupview_published}">{#PLIGG_Visual_Group_Published#}</a></li>
					<li {if $groupview eq "upcoming"}class="active"{/if}><a href="{$groupview_upcoming}">{#PLIGG_Visual_Group_Upcoming#}</a></li>
					<li {if $groupview eq "shared"}class="active"{/if}><a href="{$groupview_sharing}">{#PLIGG_Visual_Group_Shared#}</a></li>
					<li {if $groupview eq "members"}class="active"{/if}><a href="{$groupview_members}">{#PLIGG_Visual_Group_Member#}</a></li>     
                </ul>
              </div>

</div>
</div>
{/if}
{if $user_authenticated neq true && $pagename eq "index"}
<div class="hero-unit {$pagename}" >
  <h1>Hello, world!</h1>
  <p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.

Learn more</p>
  <p>
    <a class="btn btn-primary btn-large">
      Learn more
    </a>
  </p>
</div>
{/if}
{if $pagename eq "login"}<h1>{#PLIGG_Visual_Login#}</h1>{/if}
{if $pagename eq "register"}<h1>{#PLIGG_Visual_Register#}</h1>{/if}
{if $pagename eq "editlink"}<h1>{#PLIGG_Visual_EditStory_Header#}: {$submit_url_title}</h1>{/if}
{if $pagename eq "rssfeeds"}<h1>{#PLIGG_Visual_RSS_Feeds#}</h1>{/if}
{if $pagename eq "topusers"}<h1>{#PLIGG_Visual_TopUsers_Statistics#}</h1>{/if}
{if $pagename eq "cloud"}<h1>{#PLIGG_Visual_Tags_Tags#}</h1>{/if}
{if $pagename eq "live" || $pagename eq "live_unpublished" || $pagename eq "live_published" || $pagename eq "live_comments"}
<div class="clearfix well well-small" style="width:100%;padding:0;margin-top:10px">
<h1 class="pull-left" style="margin:0">{#PLIGG_Visual_Live#}</h1>
<div class=" pull-right" style="margin: 10px;">
<div class="btn-group">
                <button class="btn btn-mini">{#PLIGG_Visual_Pligg_Queued_Sort#}</button>
                <button class="btn btn-mini dropdown-toggle" data-toggle="dropdown" ><span class="caret" style="margin-bottom:8px"></span></button>
                <ul class="dropdown-menu">
                 	<li {if $pagename eq "live"}id="active"{/if}><a href="{$URL_live}"><span {if $pagename eq "live"}class="active"{/if}>{#PLIGG_Visual_Breadcrumb_All#}</span></a></li>
                 	 <li class="divider"></li>
				<li {if $pagename eq "live_published"}id="active"{/if}><a href="{$URL_published}"><span {if $pagename eq "live_published"}class="active"{/if}>{#PLIGG_Visual_Breadcrumb_Published_Tab#}</span></a></li>
				<li {if $pagename eq "live_unpublished"}id="active"{/if}><a href="{$URL_unpublished}"><span {if $pagename eq "live_unpublished"}class="active"{/if}>{#PLIGG_Visual_Breadcrumb_Unpublished_Tab#}</span></a></li>
				<li {if $pagename eq "live_comments"}id="active"{/if}><a href="{$URL_comments}"><span {if $pagename eq "live_comments"}class="active"{/if}>{#PLIGG_Visual_Breadcrumb_Comments#}</span></a></li>           
                </ul>
              </div>
</div>	
</div>
{/if}
{if $pagename eq "advancedsearch"}<h1>{#PLIGG_Visual_Search_Advanced#}</h1>{/if}
{if $pagename eq "profile"}<h1>{#PLIGG_Visual_Profile_ModifyProfile#}</h1>{/if}
{if $pagename eq "user"}<h1><a href="{$user_url_personal_data}"><span style="text-transform:capitalize">{$user}</span></a>{$page_header} <a href="{$user_rss, $view_href}" target="_blank"><img src="{$my_pligg_base}/templates/{$the_template}/images/rss.gif" style="margin-left:6px;border:0;"></a></h1>

{if $user_view|in_array:$user_tabs}
<ul class="nav nav-pills">
		{checkActionsTpl location="tpl_pligg_profile_sort_start"}
		<li{if $user_view eq "history"} class="active"{/if}><a href="{$user_url_news_sent}" class="navbut{$nav_ns}">
		{#PLIGG_Visual_User_NewsSent#}
		<span class="badge">{$user_total_links}</span>
		</a></li>
		<li{if $user_view eq "published"} class="active"{/if}><a href="{$user_url_news_published}" class="navbut{$nav_np}">
		{#PLIGG_Visual_User_NewsPublished#}
		<span class="badge">{$user_published_links}</span>
		</a></li>
		<li{if $user_view eq "shaken" || $user_view eq "profile"} class="active"{/if}><a href="{$user_url_news_unpublished}" class="navbut{$nav_nu}">
		{#PLIGG_Visual_User_NewsUnPublished#}
		</a></li>
		<li{if $user_view eq "commented"} class="active"{/if}><a href="{$user_url_commented}" class="navbut{$nav_c}">
		{#PLIGG_Visual_User_NewsCommented#}
		<span class="badge">{$user_total_comments}</span>
		</a></li>
		<li{if $user_view eq "voted"} class="active"{/if}><a href="{$user_url_news_voted}" class="navbut{$nav_nv}">
		{#PLIGG_Visual_User_NewsVoted#}
		<span class="badge">{$user_total_votes}</span>
		</a></li>
		<li{if $user_view eq "saved"} class="active"{/if}><a href="{$user_url_saved}" class="navbut{$nav_s}">
		{#PLIGG_Visual_User_NewsSaved#}
		<span class="badge">{$user_total_saved}</span>
	</a></li>
		{checkActionsTpl location="tpl_pligg_profile_sort_end"}
</ul>
{/if}
{/if}

{if $pagename eq "published" || $pagename eq "index"}<h1>{#PLIGG_Visual_Published_News#}{/if}
{if $pagename eq "upcoming"}<h1>{#PLIGG_Visual_Pligg_Queued#}{/if}
{if $pagename eq "noresults"}<h1>{$posttitle}
{elseif isset($get.search)}<h1>{#PLIGG_Visual_Search_SearchResults#} {if $get.search}{$get.search}{else}{$get.date}{/if}{/if}
{if isset($get.q)}<h1>{#PLIGG_Visual_Search_SearchResults#} {$get.q}{/if} 
{if $pagename eq "index" || $pagename eq "published" || $pagename eq "upcoming" || isset($get.search) || isset($get.q)}
	{if isset($navbar_where.link2) && $navbar_where.link2 neq ""} &#187; <a href="{$navbar_where.link2}">{$navbar_where.text2}</a>{elseif isset($navbar_where.text2) && $navbar_where.text2 neq ""} &#187; {$navbar_where.text2}{/if}
	{if isset($navbar_where.link3) && $navbar_where.link3 neq ""} &#187; <a href="{$navbar_where.link3}">{$navbar_where.text3}</a>{elseif isset($navbar_where.text3) && $navbar_where.text3 neq ""} &#187; {$navbar_where.text3}{/if}
	{if isset($navbar_where.link4) && $navbar_where.link4 neq ""} &#187; <a href="{$navbar_where.link4}">{$navbar_where.text4}</a>{elseif isset($navbar_where.text4) && $navbar_where.text4 neq ""} &#187; {$navbar_where.text4}{/if}
	</h1>
{/if}
{if $posttitle neq "" && $pagename eq "page"}<h1>{$posttitle}</h1>{/if}
<!-- END BREADCRUMBS -->

{checkActionsTpl location="tpl_pligg_breadcrumb_end"}
		{*if $pagename eq "group_story"}
			<div id="group_navbar"></div>
		{/if*}
		
		{checkActionsTpl location="tpl_pligg_content_start"}
			{checkActionsTpl location="tpl_pligg_above_center"}
			{include file=$tpl_center.".tpl"}
			{checkActionsTpl location="tpl_pligg_below_center"}
		{checkActionsTpl location="tpl_pligg_content_end"}
		
		</div>
<!-- END LEFT COLUMN -->
{checkActionsTpl location="tpl_pligg_columns_start"}	

	{if $pagename eq "user"} {*neq 'submit' changed to eq 'user'*}
<!-- START RIGHT COLUMN -->
		{if $pagename eq "story"}<br />{/if}
		<div id="rightcol" class="span3 well">
			{include file=$tpl_right_sidebar.".tpl"}
		</div>
<!-- END RIGHT COLUMN -->
	{/if}

	{if $pagename neq "submit" && $pagename neq "user" && $pagename neq "profile" && $pagename neq "login" && $pagename neq "register" && $pagename neq "edit"}
	{*actually it's the second rightcol*}
<!-- START MIDDLE COLUMN -->
		<div id="midcol" class="span3 well">
			{include file=$tpl_second_sidebar.".tpl"}
		</div>
<!-- END MIDDLE COLUMN -->
	{/if}	

	{checkActionsTpl location="tpl_pligg_banner_bottom"}
	
	
	</div>
	</div>
</div>
<!-- END CONTENT --> 
{include file=$tpl_footer.".tpl"}
	<script src="{$my_pligg_base}/templates/xmlhttp.php" type="text/javascript"></script> {* this line HAS to be towards the END of pligg.tpl *}
	{checkActionsTpl location="tpl_pligg_body_end"}
	<script id="group_share_tpl" type="text/javascript-tpl" title="{#PLIGG_Visual_Group_Share#}">
		<ul class="unstyled">
		{if $get_group_membered}
		{$get_group_membered}	
		{else}
		<li><a href="#">{#PLIGG_Visual_No_Groups#}</a></li>
 		{/if}
 		</ul>
	</script>
	{literal}		
	<script type="text/javascript">
		/* Comment Administration Hover Effect */
		$(document).ready(function(){
			$('#leftcol').delegate('.linksummarySaveLink,.stories_status,.linksummaryRemoveLink','click',function(){
				var cb=$(this).attr('date-action');
				var href=$(this).get(0).href;
				$.get(href,function(){
					eval(cb);
				});
				return false;
			});
			$('#leftcol').delegate('.group_member_share','click',function(){
			var $link=$(this).parent().parent().parent().parent().prev();
			var linkid=$link.attr('data-linkid');
			var href=$(this).get(0).href;
			$(this).get(0).href=href.replace('linkid',linkid);
			return true;
			});
			$('#leftcol').delegate('.stories,.stories-wide','mouseenter',function(){
				var $inner=$(this).find('.storyfooterinner');
				$inner.width($(this).width()-40);
				$inner.animate({bottom: 10}, 200).show();

			});
			$('#leftcol').delegate('.stories,.stories-wide','mouseleave',function(){
				var $inner=$(this).find('.storyfooterinner');
				$inner.animate({bottom:40},200,function(){
					$inner.hide();
				})
			});
				var group_sharing_options={html:true,content:$('#group_share_tpl').html(),title:$('#group_share_tpl').attr('title')};
				$('.group_sharing').popover(group_sharing_options);
			$('#weixin').popover({trigger:'hover'});
		
		  $('div.comment-hover').css('visibility','hidden');
		  $('div.comment-wrap').each(function() {
			var controls = $(this).children('div.comment-hover');
			$(this).hover(
			  function() { $(controls).css('visibility','visible') },
			  function() { $(controls).css('visibility','hidden') }
			);
		  });
		});
	</script>
	{/literal}
</body>
</html>
