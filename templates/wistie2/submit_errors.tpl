{*Step 2 Errors*}


<script type="text/javascript">
submit_url='{$submit_url}';

{literal}
function goBack(){
gPageIsOkToExit=true;
if (window.history.length>1) window.history.go(-1);
else
window.location.href=submit_url;	
}
$(function(){
	$('.goback').on('click',goBack);
});
{/literal}
</script>

<fieldset>

{if $submit_error eq 'invalidurl'}
	<p class="alert alert-block">{#PLIGG_Visual_Submit2Errors_InvalidURL#}{if $submit_url eq "http://"}. {#PLIGG_Visual_Submit2Errors_InvalidURL_Specify#}{else}: {$submit_url}{/if}</p>
	<br/>
		<button type="button"  class="btn goback">{#PLIGG_Visual_Submit2Errors_Back#}</button>
	
{/if}

{if $submit_error eq 'dupeurl'}
	<p class="alert alert-block">{#PLIGG_Visual_Submit2Errors_DupeArticleURL#}: {$submit_url}</p>
	<p>{#PLIGG_Visual_Submit2Errors_DupeArticleURL_Instruct#}</p>
	<p><a href="{$submit_search}"><strong>{#PLIGG_Visual_Submit2Errors_DupeArticleURL_Instruct2#}</strong></a></p>
	<br style="clear: both;" /><br style="clear: both;" />

		<button type="button"  class="btn goback">{#PLIGG_Visual_Submit2Errors_Back#}</button>
	
{/if}

{checkActionsTpl location="tpl_pligg_submit_error_2"}

{*Step 3 Errors*}

{if $submit_error eq 'badkey'}
	<p class="alert alert-block">{#PLIGG_Visual_Submit3Errors_BadKey#}</p>
	<br/>
	<button type="button"  onclick="gPageIsOkToExit=true; document.location.href='{$my_base_url}{$my_pligg_base}/{$pagename}.php?id={$link_id}';" value="{#PLIGG_Visual_Submit3Errors_Back#}" class="btn">{#PLIGG_Visual_Submit3Errors_Back#}</button>
{/if}

{if $submit_error eq 'hashistory'}
	<p class="alert alert-block">{#PLIGG_Visual_Submit3Errors_HasHistory#}: {$submit_error_history}</p>
	<br/>
<button type="button"  onclick="gPageIsOkToExit=true; document.location.href='{$my_base_url}{$my_pligg_base}/{$pagename}.php?id={$link_id}';" value="{#PLIGG_Visual_Submit3Errors_Back#}" class="btn">{#PLIGG_Visual_Submit3Errors_Back#}</button>
{/if}

{if $submit_error eq 'urlintitle'}
	<p class="alert alert-block">{#PLIGG_Visual_Submit3Errors_URLInTitle#}</p>
	<br/>
<button type="button"  onclick="gPageIsOkToExit=true; document.location.href='{$my_base_url}{$my_pligg_base}/{$pagename}.php?id={$link_id}';" value="{#PLIGG_Visual_Submit3Errors_Back#}" class="btn">{#PLIGG_Visual_Submit3Errors_Back#}</button>
{/if}

{if $submit_error eq 'incomplete'}
	<p class="alert alert-block">{#PLIGG_Visual_Submit3Errors_Incomplete#}</p>
	<br/>
<button type="button"  onclick="gPageIsOkToExit=true; document.location.href='{$my_base_url}{$my_pligg_base}/{$pagename}.php?id={$link_id}';" value="{#PLIGG_Visual_Submit3Errors_Back#}" class="btn">{#PLIGG_Visual_Submit3Errors_Back#}</button>
{/if}

{if $submit_error eq 'long_title'}
	<p class="alert alert-block">{#PLIGG_Visual_Submit3Errors_Long_Title#}</p>
	<br/>
<button type="button"  onclick="gPageIsOkToExit=true; document.location.href='{$my_base_url}{$my_pligg_base}/{$pagename}.php?id={$link_id}';" value="{#PLIGG_Visual_Submit3Errors_Back#}" class="btn">{#PLIGG_Visual_Submit3Errors_Back#}</button>
{/if}

{if $submit_error eq 'long_content'}
	<p class="alert alert-block">{#PLIGG_Visual_Submit3Errors_Long_Content#}</p>
	<br/>
<button type="button"  onclick="gPageIsOkToExit=true; document.location.href='{$my_base_url}{$my_pligg_base}/{$pagename}.php?id={$link_id}';" value="{#PLIGG_Visual_Submit3Errors_Back#}" class="btn">{#PLIGG_Visual_Submit3Errors_Back#}</button>
{/if}

{if $submit_error eq 'long_tags'}
	<p class="alert alert-block">{#PLIGG_Visual_Submit3Errors_Long_Tags#}</p>
	<br/>
<button type="button"  onclick="gPageIsOkToExit=true; document.location.href='{$my_base_url}{$my_pligg_base}/{$pagename}.php?id={$link_id}';" value="{#PLIGG_Visual_Submit3Errors_Back#}" class="btn">{#PLIGG_Visual_Submit3Errors_Back#}</button>
{/if}

{if $submit_error eq 'long_summary'}
	<p class="alert alert-block">{#PLIGG_Visual_Submit3Errors_Long_Summary#}</p>
	<br/>
<button type="button"  onclick="gPageIsOkToExit=true; document.location.href='{$my_base_url}{$my_pligg_base}/{$pagename}.php?id={$link_id}';" value="{#PLIGG_Visual_Submit3Errors_Back#}" class="btn">{#PLIGG_Visual_Submit3Errors_Back#}</button>
{/if}

{if $submit_error eq 'nocategory'}
	<p class="alert alert-block">{#PLIGG_Visual_Submit3Errors_NoCategory#}</p>
	<br/>
<button type="button"  onclick="gPageIsOkToExit=true; document.location.href='{$my_base_url}{$my_pligg_base}/{$pagename}.php?id={$link_id}';" value="{#PLIGG_Visual_Submit3Errors_Back#}" class="btn">{#PLIGG_Visual_Submit3Errors_Back#}</button>
{/if}

{checkActionsTpl location="tpl_pligg_submit_error_3"}

</fieldset>
