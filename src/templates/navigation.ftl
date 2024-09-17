<#if has_navigation && is_setup_complete>
<div class="d-flex align-items-center justify-content-center">
    <div class="buttonLightDark d-flex d-md-none mr-4">
        <input type="checkbox" class="switch__input" id="themeToggleMobile">
        <label class="switch__label mb-0" for="themeToggleMobile">
            <span class="switch__indicator"></span>
            <span class="switch__decoration"></span>
        </label>
    </div>

    <button aria-controls="navigationCollapse" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler navbar-toggler-right hambuguer-personalizado" data-target="#navigationCollapse" data-toggle="liferay-collapse" type="button">
        <span class="navbar-toggler-icon"></span>
    </button>
</div>
    <div class="collapse navbar-collapse" id="navigationCollapse">
        <@liferay.navigation_menu default_preferences="${preferences}" />
            <#assign preferences = freeMarkerPortletPreferences.getPreferences({"portletSetupPortletDecoratorId": "barebone", "destination": "/search"}) />
            <div class="autofit-col autofit-col-expand d-flex d-md-none">
                <div class="justify-content-md-end mr-4 navbar-form search-persolnalizado" role="search">
                    <@liferay.search_bar default_preferences="${preferences}" />
                </div>
            </div>
            <div class="autofit-col d-flex d-md-none">
                <a href="/c/login">Entrar</a>
            </div>
    </div>
</#if>