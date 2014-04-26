<!--div style="position:absolute;display:block;background:#fff;padding:10px;margin:10px 0 0 100px;font-size:12px;border:2px solid #000;"-->
<div class="well well-small" style="position:absolute;z-index:3">
<fieldset><legend>{#PLIGG_Visual_Recommend_FormTitle#}<a class="pull-right close" href="#" onclick="$('#emailto-{$link_shakebox_index}').hide();return false;">&times;</a></legend>
	<form name="email_to" method="get" action="{$my_base_url}{$my_pligg_base}/recommend.php">
		{#PLIGG_Visual_Recommend_EnterAddress#}<br>
		{$hidden_token_recommend}
		<div class="input-prepend">
             <span class="add-on"><i class="black icon-envelope"></i></span>
            <input type="text" class="span2" name="email_address_1" size="35" id="email_address_1_{$link_shakebox_index}" value="">
            </div>
		<div class="input-prepend">
              <span class="add-on"><i class="black icon-envelope"></i></span>
           <input type="text" class="span2" name="email_address_2" size="35" id="email_address_2_{$link_shakebox_index}" value="">
            </div>
			<div class="input-prepend">
             <span class="add-on"><i class="black icon-envelope"></i></span>
         <input type="text" class="span2" name="email_address_3" size="35" id="email_address_3_{$link_shakebox_index}" value="">
            </div>
		<br />{#PLIGG_Visual_Recommend_Comment#}<br />
		<textarea name="email_message{$link_shakebox_index}" id="email_message{$link_shakebox_index}" cols="40" rows="5" class="input-block-level">{$Default_Message}</textarea>
{*
		{#PLIGG_Visual_Register_Enter_Number#}<br />				
		<input type="hidden" name="ts_random" value="{$ts_random}" /><br />
		<img src="{$my_pligg_base}/ts_image.php?ts_random={$ts_random}" /><br/>
		<input type="text" size="20" name="ts_code" /><br /><br />		
*}
		<input type="button" name="email_to_submit" value="{#PLIGG_Visual_Recommend_Submit#}" onclick="emailto ({$link_id}, {$link_shakebox_index}, '{$instpath}', 3);" class="btn btn-primary span2">
	</form>
</fieldset>
</div>