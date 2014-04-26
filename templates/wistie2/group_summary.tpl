<div class="group_container">
	<div class="group_left">
		<div class="group_avatar">
		<a href="{$group_story_url}" title="{$group_name}">
				<img src="{$imgsrc}" alt="{$group_name}"
				class="group_avatar_img" />
			</a>
		</div>
	</div>
	<div class="group_right">
		<div class="group_title">
			{if $pagename eq 'group_story'}
				{$group_name}
			{else}
				<a href="{$group_story_url}">{$group_name}</a>
			{/if}
		</div>
		{if $pagename eq 'group_story'}{checkActionsTpl location="tpl_pligg_group_list_start"}{/if}
		<div class="group_created_by">
			<span class="group_created_by_label">{#PLIGG_Visual_Group_Created_By#}</span> <a
				href="{$submitter_profile_url}">{$group_submitter}</a>
		</div>
		<div class="group_created_on">
			<span class="group_created_on_label">{#PLIGG_Visual_Group_Created_On#}</span>
			{$group_date}
		</div>
		<div class="group_description">{$group_description}</div>
		{#PLIGG_Visual_Group_Member#} : {$group_members}
		{if $pagename eq 'group_story'}
			{checkActionsTpl location="tpl_pligg_group_list_end"}
			{if $user_logged_in neq $group_submitter}
				{if $user_logged_in neq ""}
				<br clear="all" />
				<span class="group_details">
					{if $is_group_member eq 0}
						{if $join_group_url neq '' || $join_group_privacy_url neq ''}
							{if $group_privacy eq 'public'}
							<span class="group_join"><a href="{$join_group_url}" >&nbsp;{#PLIGG_Visual_Group_Join#}</a></span>
							{else}
							<span class="group_join"><a href="{$join_group_privacy_url}" >&nbsp;{#PLIGG_Visual_Group_Join#}</a></span>
							{/if}
						{/if}
					{else}
						{if $is_member_active eq 'active'}
						<span class="group_unjoin"><a href="{$unjoin_group_url}" >&nbsp;{#PLIGG_Visual_Group_Unjoin#}</a></span>
						{/if}
						{if $is_member_active eq 'inactive'}
						<span class="group_withdraw_request"><a href="{$join_group_withdraw}" >&nbsp;{#PLIGG_Visual_Group_Withdraw_Request#}</a></span>
						{/if}	
					{/if}
				</span>	
				{/if}
			{/if}
			{if $is_group_admin eq '1'}
			&nbsp;&nbsp;&nbsp;<span class="group_edit"><a href={$group_edit_url}> {#PLIGG_Visual_Group_Text_edit#}</a></span>
			&nbsp;&nbsp;&nbsp;<span class="group_delete"><a onclick="return confirm('{#PLIGG_Visual_Group_Delete_Confirm#}')" href={$group_delete_url}> {#PLIGG_Visual_Group_Text_Delete#}</a></span>

			&nbsp;&nbsp;&nbsp;
			<span class="group_avatar">&nbsp;<a href="javascript://" onclick="var replydisplay=document.getElementById('image_upload-1').style.display ? '' : 'none';document.getElementById('image_upload-1').style.display = replydisplay;">{#PLIGG_Visual_Group_Avatar_Upload#}</a>
			{if $Avatar_uploaded neq ''}<br/><span>{$Avatar_uploaded}</span>{/if}	
			<span id = "image_upload-1" style="display:none;">
				<fieldset><legend>{#PLIGG_Visual_Profile_UploadAvatar2#}:</legend>
					<form method="POST" enctype="multipart/form-data" name="image_upload_form" action="{$form_action}">
						{$hidden_token_edit_group}
						<input type="file" name="image_file" size="20">
						<input type="hidden" name="idname" value="{$group_id}"/>
						<input type="hidden" name="avatar" value="uploaded"/>
						<input type="hidden" name="avatarsource" value="useruploaded">
						<button type="submit" value="{#PLIGG_Visual_Profile_AvatarUpload#}" name="action" class="submit">{#PLIGG_Visual_Profile_AvatarUpload#}</button><br />
					</form> 
				</fieldset>
			</span>
			{/if}
		{elseif $group_status eq 'disable'}
		<div class='group_approve'>
			<button onclick='document.location="?approve={$group_id}"'
				class='button group_approve_button'>Approve</button>
		</div>
		{/if}
	</div>
</div>