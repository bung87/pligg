{if $pagename eq "groups"}
	<div class="well">
<p>{#PLIGG_Visual_Group_Explain#}</p>		
			{if $group_allow eq "1"}
				<div id="create_group">
					<button type="button" title="{#PLIGG_Visual_Submit_A_New_Group#}" onclick="window.location.href='{$URL_submit_groups}'" class="btn btn-primary">{#PLIGG_Visual_Submit_A_New_Group#}</button>
				</div>
			{/if}
		
			<div style="clear:both;"></div>
		
	</div>
{/if}

{if $get.keyword}
    {if $group_display}
		<h2>{#PLIGG_Visual_Search_SearchResults#} '{$search}'</h2>
    {else}
		<h2>{#PLIGG_Visual_Search_NoResults#} '{$search}'</h2>
    {/if}
{/if}

{$group_display}
<div style="clear:both;"></div>
{$group_pagination}