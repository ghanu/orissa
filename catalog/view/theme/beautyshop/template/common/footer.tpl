</div>
<div id="footer-container">
 <?php 
$displayCustomFooter =  $this->config->get('customFooter_status');

// Show custom footer
if($displayCustomFooter == 1) {
?>
<?php
// Show about
if ($this->config->get('about_status') == '1') {
  
  // Twitter
  $TWIITER_USERNAME = $this->config->get('twitter_username');
  
  if($TWIITER_USERNAME <> '')
  {
    $TWITTER_HTML = '<a href="http://twitter.com/'.$TWIITER_USERNAME.'" class="soc-img"><img class="fade-image" src="catalog/view/theme/beautyshop/image/twitter_icon.png"></a>';
  }
  else
  {
    $TWITTER_HTML = '';
  }
  
  // Facebook
  $FB_USERNAME = $this->config->get('facebook_id');
  
  if($FB_USERNAME <> '')
  {
    $FB_HTML = '<a href="http://facebook.com/pages/dx/'.$FB_USERNAME.'" class="soc-img"><img class="fade-image" src="catalog/view/theme/beautyshop/image/facebook_icon.png"></a>';
  }
  else
  {
    $FB_HTML = '';
  }
  
  // Skype
  $SKYPE_USERNAME = $this->config->get('skype');
  
  if($SKYPE_USERNAME <> '')
  {
    $SKYPE_HTML = '<a href="skype://'.$SKYPE_USERNAME.'" class="soc-img"><img class="fade-image" src="catalog/view/theme/beautyshop/image/skype_icon.png"></a>';
  }
  else
  {
    $SKYPE_HTML = '';
  }
  
?>
<div class="footer-about">
      <?php
if($this->config->get('about_us_image_status') == '1'){
        echo ' <style type="text/css">.footer-about .text {
	width:435px; } </style>';
	echo '<div class="mini-logo"><img alt ="About" src="'. HTTPS_IMAGE . $this->config->get('about_us_image') . '"/></div>';
}
?>
  <div class="text"><h1><?=$this->config->get('about_header');?></h1>
    <?=html_entity_decode($this->config->get('about_text'));?>	
</div>
  <div class="social">
    <h1><?=$this->config->get('contact_header')?></h1>
    <?=$FB_HTML?>
    <?=$TWITTER_HTML?>
    <?=$SKYPE_HTML?>
    <div class="contact">
      <div class="phone"><?php if ($this->config->get('telephone1')) { echo '<b>Phone:</b> '.$this->config->get('telephone1'); }?><?php if ($this->config->get('telephone2')) { echo ', '.$this->config->get('telephone2'); }?></div>
      <div class="fax"><?php if ($this->config->get('fax')) { echo '<b>Fax:</b> '.$this->config->get('fax'); }?></div>
      <div class="email"><?php if ($this->config->get('email1')) { echo '<a href="mailto:'.$this->config->get('email1').'">'.$this->config->get('email1').'</a>'; }?></div>
      <div class="email"><?php if ($this->config->get('email2')) { echo '<a href="mailto:'.$this->config->get('email2').'">'.$this->config->get('email2').'</a>'; }?></div>
    </div>
  </div>
  <div class="clear"></div>
</div>
<? }
// About end
?>


<? }
// Custom footer end
?>


<div id="footer">
  <?php if ($informations) { ?>
  <div class="column">
    <h3><?php echo $text_information; ?></h3>
    <ul>
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
  <?php } ?>
  <div class="column">
    <h3><?php echo $text_service; ?></h3>
    <ul>
      <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
      <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
    </ul>
  </div>
  <div class="column">
    <h3><?php echo $text_extra; ?></h3>
    <ul>
      <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
      <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
      <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
      <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
    </ul>
  </div>
  <?php
  // TWITTER WIDGET
  if(($this->config->get('twitter_column_status') == '1')&&($displayCustomFooter == 1)) { ?>
  <div class="column">
  <h3><?php echo $this->config->get('twitter_column_header'); ?></h3>
  <script type="text/javascript">
  function format_twitter(twitters) {
var statusHTML = [];
for (var i=0; i<twitters.length; i++){
var username = twitters[i].user.screen_name;
var status = twitters[i].text.replace(/((https?|s?ftp|ssh)\:\/\/[^"\s\<\>]*[^.,;'">\:\s\<\>\)\]\!])/g, function(url) {
return '<a href="'+url+'">'+url+'</a>';
}).replace(/\B@([_a-z0-9]+)/ig, function(reply) {
return reply.charAt(0)+'<a href="http://twitter.com/'+reply.substring(1)+'">'+reply.substring(1)+'</a>';
});
statusHTML.push('<li><span>'+status+'</span> <a href="http://twitter.com/'+username+'/statuses/'+twitters[i].id_str+'">'+'</a></li>');
}
return statusHTML.join('');
}
  </script>
  <script type="text/javascript">
jQuery(document).ready(function($){
$.getJSON('http://api.twitter.com/1/statuses/user_timeline/<?php echo $this->config->get('twitter_username') ; ?>.json?count=<?php echo $this->config->get('twitter_number_of_tweets') ; ?>&callback=?', function(tweets){
$("#twitter_update_list").html(format_twitter(tweets));
});
});
</script>
  
    <ul id="twitter_update_list"></ul>
  </div>
  <? } else {  ?>
  <div class="column">
    <h3><?php echo $text_account; ?></h3>
    <ul>
      <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
    </ul>
  </div>
  <? } ?>
   <?php
if (($this->config->get('facebook_status') == '1')&&($displayCustomFooter == 1)) {
	?>
  <div class="column">
    <h3>FACEBOOK</h3>
    <script type="text/javascript" src="http://static.ak.connect.facebook.com/js/api_lib/v0.4/FeatureLoader.js.php/en_US"></script>
         <script type="text/javascript">FB.init();</script>
         <!-- Change profile_id here to your page -->
         <fb:fan profile_id="<?php echo $this->config->get('facebook_id'); ?>" stream="0" connections="3" logobar="0" width="200" height="120" css="<?php echo HTTPS_SERVER; ?>catalog/view/theme/beautyshop/stylesheet/facebook.css"></fb:fan>
    
    
  </div>
  <? } else { ?>
  
  <style type="text/css">#footer .column  {
	width:25%; } </style>
  <? }?>
</div>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
<div id="powered"><?php echo $powered; ?></div>
<div id="paymenticons"><img src="catalog/view/theme/beautyshop/image/payment.png"></div>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
<div class="clear"></div>
</div>
</div>
</body></html>