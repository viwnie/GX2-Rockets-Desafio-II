<!DOCTYPE html>
<#include init />
<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">
<head>
    <title>${html_title}</title>
    <meta name="viewport" content="initial-scale=1.0, width=device-width" />
    <@liferay_util["include"] page=top_head_include />
   <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
   <script>
    function applyTheme(theme) {
        document.documentElement.setAttribute('data-theme', theme);
        const isLightTheme = theme === 'light';
        document.getElementById('themeToggle').checked = isLightTheme;
        document.getElementById('themeToggleMobile').checked = isLightTheme;
    }

    function initializeTheme() {
        const savedTheme = localStorage.getItem('theme') || 'light';
        applyTheme(savedTheme);
    }

    function toggleTheme(toggleId) {
        const currentTheme = document.documentElement.getAttribute('data-theme');
        const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
        applyTheme(newTheme);
        localStorage.setItem('theme', newTheme);

        const otherToggle = toggleId === 'themeToggle' ? 'themeToggleMobile' : 'themeToggle';
        document.getElementById(otherToggle).checked = document.getElementById(toggleId).checked;
    }

    function attachThemeToggleEvents() {
        document.getElementById('themeToggle').addEventListener('click', () => toggleTheme('themeToggle'));
        document.getElementById('themeToggleMobile').addEventListener('click', () => toggleTheme('themeToggleMobile'));
    }

    (function() {
        const savedTheme = localStorage.getItem('theme') || 'light';
        document.documentElement.setAttribute('data-theme', savedTheme);
    })();

    document.addEventListener('DOMContentLoaded', () => {
        initializeTheme();
        attachThemeToggleEvents();
    });

    Liferay.on('startNavigate', () => {
        const savedTheme = localStorage.getItem('theme') || 'light';
        document.documentElement.setAttribute('data-theme', savedTheme);
    });

    Liferay.on('endNavigate', () => {
        initializeTheme();
        attachThemeToggleEvents();
    });
</script>
</head>

<body class="${css_class}">
    <@liferay_ui["quick-access"] contentId="#main-content" />
    <@liferay_util["include"] page=body_top_include />

    <div class="d-flex flex-column min-vh-100">
        <@liferay.control_menu />
        <div class="d-flex flex-column flex-fill position-relative" id="wrapper">
            <header id="banner">
                <div class="navbar navbar-classic navbar-top py-3 d-none d-md-flex">
                    <div class="container-fluid container-fluid-max-xl user-personal-bar">
                        <div class="align-items-center autofit-row">
                            <a class="${logo_css_class} align-items-center d-flex logo-md" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
                                <img alt="${logo_description}" class="mr-2" height="0px" src="${site_logo}" />
                                <h1 class="h2 mb-0 titulo-principal">${site_name}</h1>
                            </a>
                            <#assign preferences = freeMarkerPortletPreferences.getPreferences({"portletSetupPortletDecoratorId": "barebone", "destination": "/search"}) />
                            <div class="autofit-col autofit-col-expand d-md-flex d-none">
                                <div class="justify-content-md-end mr-4 navbar-form" role="search">
                                    <div class="buttonLightDark d-flex mr-3">
                                        <input type="checkbox" class="switch__input" id="themeToggle">
                                        <label class="switch__label" for="themeToggle">
                                            <span class="switch__indicator"></span>
                                            <span class="switch__decoration"></span>
                                        </label>
                                    </div>
                                    <@liferay.search_bar default_preferences="${preferences}" />
                                </div>
                            </div>
                            <div class="autofit-col d-md-flex d-none">
                                <@liferay.user_personal_bar />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="navbar navbar-expand-md navbar-links">
                    <div class="container-fluid container-fluid-max-xl">
                        <a class="${logo_css_class} align-items-center d-inline-flex d-md-none logo-xs" href="${site_default_url}" rel="nofollow">
                            <img alt="${logo_description}" class="mr-2" height="0px" src="${site_logo}" />
                            <h2 class="h2 mb-0 titulo-principal">${site_name}</h2>
                        </a>
                        <#include "${full_templates_path}/navigation.ftl" />
                    </div>
                </div>
            </header>

            <section class="flex-fill section-do-body" id="content">
                <@liferay_util["include"] page=content_include />
                ${portletDisplay.recycle()}
                ${portletDisplay.setTitle(the_title)}
                <@liferay_theme["wrap-portlet"] page="portlet.ftl">
                    <@liferay_util["include"] page=content_include />
                </@>
            </section>

            <footer id="footer" role="contentinfo" class="text-center text-black mt-4">
                <div class="container">
                    <section>
                        <div class="row text-center d-flex justify-content-center pt-5">
                            <a class="${logo_css_class} align-items-center d-flex logo-md" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
                                <img alt="${logo_description}" class="mr-2" height="0px" src="${site_logo}" />
                                <h1 class="h2 mb-5 titulo-principal">${site_name}</h1>
                            </a>
                        </div>
                    </section>
                </div>
            </footer>
        </div>
    </div>

    <@liferay_util["include"] page=body_bottom_include />
    <@liferay_util["include"] page=bottom_include />

    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/data.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
</body>
</html>