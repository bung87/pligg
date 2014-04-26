<br clear="all" />
<!-- START FOOTER -->
		<!--div id="footer">
			{checkActionsTpl location="tpl_pligg_footer_start"}
        	<span class="subtext"> Copyright &copy; {php} echo date('Y'); {/php} {#PLIGG_Visual_Name#} 
			 
			| <a href="{$URL_advancedsearch}">{#PLIGG_Visual_Search_Advanced#}</a> 
			{if $URL_rss_page}
		
			| <a href="{$URL_rss_page}" target="_blank">
				<img src="{$my_pligg_base}/templates/{$the_template}/images/rss.gif" width="12px" height="12px" align="top" border="0" alt="RSS" /> RSS
			</a>
			
			{/if}
			
			| <a href="{$my_base_url}{$my_pligg_base}/rssfeeds.php">{#PLIGG_Visual_RSS_Feeds#}</a> {checkActionsTpl location="tpl_pligg_footer_end"}</span>
        </div-->
        <div id="footer">
		<div id="footerinner" class="w c rel">
			{*<div id="footer_arrow"></div>*}	
			<div class="l footer_nav">
				<div style="border-right:1px solid #fff;float:left;">
				<!-- <div id="footertitle_1"></div> -->
                    {*
				<ul id="footernav" class="unstyled">
					<li>
						<a href="{$my_base_url}{$my_pligg_base}">-{#PLIGG_Visual_Home#}</a>
						<a href="{$my_base_url}{$my_pligg_base}/page.php?page=contact">-{#contact#}{#us#}</a>
						<a href="{$my_base_url}{$my_pligg_base}/page.php?page=jobs">-{#jobs#}</a>
						<a href="{$my_base_url}{$my_pligg_base}/page.php?page=about">-{#about#}{#PLIGG_Visual_Name#}</a>
					</li>
				</ul>*}
                    <ul id="footernav" class="unstyled">
                        <li>
                            <a href="{$my_base_url}{$my_pligg_base}">-{#PLIGG_Visual_Home#}</a>
                            <a href="#">-{#contact#}{#us#}</a>
                            <a href="#">-{#jobs#}</a>
                            <a href="#">-{#about#}{#PLIGG_Visual_Name#}</a>
                        </li>
                    </ul>
			</div>
			</div>
            {*
			<div class="l footer_nav">
				<div style="border-right:1px solid #fff;">
				<div id="footertitle_2">关注我们</div>
				<p><a href="http://weibo.com/prdoor" target="_blank"><img src="images/weibo_logo.gif" width="30" height="24" style="margin-top:15px;"></a> <a href="http://weibo.com/prdoor" target="_blank" style="vertical-align: bottom;">@{#PLIGG_Visual_Name#}</a></p>
				<p>
					<a id="weixin" class="dropdown-toggle" href="javascript:;"  data-html="true" data-toggle="popover" title="" data-content="<img src=images/qrcode.jpg title=微信扫描二维码关注{#PLIGG_Visual_Name#} alt={#PLIGG_Visual_Name#}微信二维码 style=margin-top:10px;>" data-original-title="{#PLIGG_Visual_Name#}微信二维码"><img src="images/wx_30_24.png" width="30" height="24" style="position: relative;top: -5px;margin-right: 2px;">{#PLIGG_Visual_Name#}</a>
				</p>		
			</div>
			</div>*}
			<div class="l footer_nav">
				<div style="border-right:1px solid #fff;">
					
			<a href="{if $URL_rss_page}{$URL_rss_page}{/if}#" target="_blank" class="rss {if $URL_rss_page}light{/if}">
			</a>
			
		</div></div>
			<!--a id="scroll" href="/index.php#top"></a-->
			<p id="copyright">Copyright &copy; {php} echo date('Y'); {/php} {#PLIGG_Visual_Name#}  All Rights Reserved</p>
		</div>
</div>
<!-- END FOOTER --> 
