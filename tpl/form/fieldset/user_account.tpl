[{assign var="prefix" value=false}]
[{if !$oxcmp_user}]
[{include file="form/inc/input.tpl" label="EMAIL_ADDRESS" field="oxuser__oxusername" type="email" name="lgn_usr" value=$oView->getActiveUsername()}]
[{include file="form/inc/input.tpl" label="PASSWORD" field="oxuser__oxpassword" type="password" name="lgn_pwd" value=""}]
[{include file="form/inc/input.tpl" label="CONFIRM_PASSWORD" field="oxuser__oxusername" type="password" name="lgn_pwd2" value=""}]
[{/if}]
[{include file="form/fieldset/order_newsletter.tpl" blSubscribeNews=true}]