[{block name="header_main"}]
   [{assign var="blFullwidth" value=$oViewConf->getViewThemeParam('blFullwidthLayout')}]
   [{strip}]
   <header id="header">

      <div class="[{if $blFullwidth}]container[{else}]container-fluid[{/if}] hidden-xs">
         <div class="header-box">
            <div class="row">
               <div class="col-xs-5 col-sm-6 col-md-4 logo-col">
                  [{block name="layout_header_logo"}]
                     [{assign var="slogoImg" value=$oViewConf->getViewThemeParam('sLogoFile')}]
                     [{assign var="sLogoWidth" value=$oViewConf->getViewThemeParam('sLogoWidth')}]
                     [{assign var="sLogoHeight" value=$oViewConf->getViewThemeParam('sLogoHeight')}]
                     <a href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]">
                        <img src="[{$oViewConf->getPictureDir()|cat:'wysiwigpro/'|cat:$slogoImg}]" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]" style="[{if $sLogoWidth}]width:auto;max-width:[{$sLogoWidth}]px;[{/if}][{if $sLogoHeight}]height:auto;max-height:[{$sLogoHeight}]px;[{/if}]">
                     </a>
                  [{/block}]
               </div>
               <div class="col-xs-7 col-sm-6 col-md-4 col-md-push-4 menus-col">
                  [{block name="layout_header_top"}]
                     <div class="menu-dropdowns pull-right">
                        [{block name="dd_layout_page_header_icon_menu_languages"}]
                           [{* Language Dropdown*}]
                           [{oxid_include_widget cl="oxwLanguageList" lang=$oViewConf->getActLanguageId() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
                        [{/block}]
                        [{block name="dd_layout_page_header_icon_menu_currencies"}]
                           [{* Currency Dropdown*}]
                           [{oxid_include_widget cl="oxwCurrencyList" cur=$oViewConf->getActCurrency() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
                        [{/block}]

                        [{block name="dd_layout_page_header_icon_menu_account"}]
                           [{if $oxcmp_user || $oView->getCompareItemCount() || $Errors.loginBoxErrors}]
                              [{assign var="blAnon" value=0}]
                              [{assign var="force_sid" value=$oViewConf->getSessionId()}]
                           [{else}]
                              [{assign var="blAnon" value=1}]
                           [{/if}]
                           [{* Account Dropdown *}]
                           [{oxid_include_widget cl="oxwServiceMenu" _parent=$oView->getClassName() force_sid=$force_sid nocookie=$blAnon _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
                        [{/block}]

                     </div>
                  [{/block}]
               </div>
               <div class="col-xs-12 col-sm-12 col-md-4 col-md-pull-4 search-col">
                  [{* TODO hier können wir irgendwas sinnvolles einbauen, aber was? *}]
                  [{* [{include file="widget/header/search.tpl"}] *}]
               </div>
            </div>
         </div>
      </div>

      [{block name="layout_header_bottom"}]
         [{* oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() sWidgetType="header" _parent=$oView->getClassName() nocookie=1 *}]
         [{include file="widget/header/categorylist.tpl"}]
      [{/block}]
   </header>
   [{/strip}]
[{/block}]

[{insert name="oxid_newbasketitem" tpl="widget/minibasket/newbasketitemmsg.tpl" type="message"}]
[{oxid_include_dynamic file="widget/minibasket/minibasketmodal.tpl"}]