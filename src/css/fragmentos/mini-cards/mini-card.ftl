[#assign uniqueId = fragmentEntryLinkNamespace]
<div class="mini-card">
	<div class="container-icone">
		<span class="Icone"></span>
	</div>
	<div class="textoContainer">
		<span class="textoPrincipal" id="textoPrincipal"></span>
	</div>
</div>


<#--  Liferay script  -->


Liferay.on('allPortletsReady', function() {
 async function fetchExchangeRates() {
            try {
                const response = await fetch('https://economia.awesomeapi.com.br/last/'+configuration.fiatIcon);
                const data = await response.json();
							const fiatIcon = configuration.fiatIcon.split('-')[0];
							const exchangeRate = data[fiatIcon + 'BRL'].bid;
							fragmentElement.querySelector(".textoPrincipal").innerText = "R$ "+exchangeRate;
	            fragmentElement.querySelector(".Icone").innerText = fiatIcon;
            } catch (error) {
                console.error('Erro ao buscar cotações:', error);
            }
        }
fetchExchangeRates();
})