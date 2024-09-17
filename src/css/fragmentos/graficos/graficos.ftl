[#assign uniqueId = fragmentEntryLinkNamespace]
<div class="${configuration.habilitarCollapse?then('', 'pt-5')}">
[#if configuration.habilitarCollapse?? && configuration.habilitarCollapse]
    <div class="collapse-graficos d-flex flex-column align-items-center justify-content-center">
				<input type="checkbox" id="collapseToggle-${uniqueId}" class="collapse-checkbox">
        <label for="collapseToggle-${uniqueId}" class="collapse-btn">
<lfr-editable id="BotaoDeOcultacao-Tarefa-${uniqueId}" type="rich-text">Exibir/Ocultar</lfr-editable>
</label>
[/#if]
<div class="graficoContainer ${configuration.graficoEscolhido}-${uniqueId} mb-3 mb-xl-0">
    <figure class="highcharts-figure">
        <div class="tipoGrafico" id="Container${configuration.graficoEscolhido}-${uniqueId}"></div>
        <p class="highcharts-description">
            <lfr-editable id="Descricao${configuration.graficoEscolhido}-${uniqueId}" type="rich-text">Texto De Exemplo</lfr-editable>
        </p>
    </figure>
</div>
[#if configuration.habilitarCollapse?? && configuration.habilitarCollapse]
    </div>
[/#if]
</div>

<script>
    Liferay.on('allPortletsReady', function() {
        var grafico = 'Container' + '${configuration.graficoEscolhido}-${uniqueId}';
        if (grafico === "Containergrafico_stacked_bar-${uniqueId}") {
            Highcharts.chart(grafico, {
                chart: {
                    type: 'bar',
                    events: {
                        load: function () {
                            var chart = this;
                            window.addEventListener('resize', function () {
                                chart.reflow();
                            });
                        }
                    }
                },
                title: {
                    text: ''
                },
                xAxis: {
                    categories: ['January', 'February', 'March', 'April', 'May']
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: ''
                    }
                },
                legend: {
                    reversed: true
                },
                plotOptions: {
                    series: {
                        stacking: 'normal',
                        dataLabels: {
                            enabled: true
                        }
                    }
                },
                series: [{
                    name: 'Motorcycles',
                    data: [74, 27, 52, 93, 1272]
                }, {
                    name: 'Null-emission vehicles',
                    data: [2106, 2398, 3046, 3195, 4916]
                }, {
                    name: 'Conventional vehicles',
                    data: [12213, 12721, 15242, 16518, 25037]
                }],
                responsive: {
                    rules: [{
                        condition: {
                            maxWidth: 600
                        },
                        chartOptions: {
                            legend: {
                                layout: 'horizontal',
                                align: 'center',
                                verticalAlign: 'bottom'
                            }
                        }
                    }]
                }
            });
        }
        if (grafico === "Containergrafico_colunas_descricao-${uniqueId}") {
 Highcharts.chart(grafico, {
                chart: {
                    type: 'column',
                    events: {
                        load: function () {
                            var chart = this;
                            window.addEventListener('resize', function () {
                                chart.reflow();
                            });
                        }
                    }
                },
                title: {
                    text: ''
                },
                subtitle: {
                    text: 'Source: <a href="https://worldpopulationreview.com/world-cities" target="_blank">World Population Review</a>'
                },
                xAxis: {
                    type: 'category',
                    labels: {
                        autoRotation: [-45, -90],
                        style: {
                            fontSize: '13px',
                            fontFamily: 'Verdana, sans-serif'
                        }
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Value'
                    }
                },
                legend: {
                    enabled: false
                },
                tooltip: {
                    pointFormat: 'Value in 2021: <b>{point.y:.1f}</b>'
                },
                series: [{
                    name: 'Currency',
                    colors: [
                        '#9b20d9', '#9215ac', '#861ec9', '#7a17e6', '#7010f9', '#691af3',
                        '#6225ed', '#5b30e7', '#533be1', '#4c46db', '#4551d5', '#3e5ccf',
                        '#3667c9', '#2f72c3', '#277dbd', '#1f88b7', '#1693b1', '#0a9eaa',
                        '#03c69b', '#00f194'
                    ],
                    colorByPoint: true,
                    data: [
                        ['Bitcoin', 200000],
                        ['Dollar', 4.5],
                        ['Euro', 4.85],
                        ['Yien', 20],
                        ['Real', 1]
                    ],
                    dataLabels: {
                        enabled: true,
                        rotation: -90,
                        color: '#FFFFFF',
                        inside: true,
                        verticalAlign: 'top',
                        format: '{point.y:.1f}', // one decimal place
                        y: 10, // 10 pixels down from the top
                        style: {
                            fontSize: '13px',
                            fontFamily: 'Verdana, sans-serif'
                        }
                    }
                }],
                responsive: {
                    rules: [{
                        condition: {
                            maxWidth: 600
                        },
                        chartOptions: {
                            xAxis: {
                                labels: {
                                    rotation: 0
                                }
                            }
                        }
                    }]
                }
            });
        }
        if (grafico === "Containergrafico_area-${uniqueId}") {
            Highcharts.chart(grafico, {
                chart: {
                    type: 'areaspline',
                    events: {
                        load: function () {
                            var chart = this;
                            window.addEventListener('resize', function () {
                                chart.reflow(); // Ajusta o gráfico ao redimensionar a janela
                            });
                        }
                    }
                },
                title: {
                    text: '',
                    align: 'left'
                },
                subtitle: {
                    text: 'Source: <a href="https://www.ssb.no/jord-skog-jakt-og-fiskeri/jakt" target="_blank">SSB</a>',
                    align: 'left'
                },
                legend: {
                    layout: 'vertical',
                    align: 'left',
                    verticalAlign: 'top',
                    x: 120,
                    y: 70,
                    floating: true,
                    borderWidth: 1,
                    backgroundColor: Highcharts.defaultOptions.legend.backgroundColor || '#FFFFFF'
                },
                xAxis: {
                    plotBands: [{
                        from: 2020,
                        to: 2023,
                        color: 'rgba(68, 170, 213, .2)'
                    }]
                },
                yAxis: {
                    title: {
                        text: 'Quantity'
                    }
                },
                tooltip: {
                    shared: true,
                    headerFormat: '<b>Hunting season starting autumn {point.x}</b><br>'
                },
                credits: {
                    enabled: false
                },
                plotOptions: {
                    series: {
                        pointStart: 2000
                    },
                    areaspline: {
                        fillOpacity: 0.5
                    }
                },
                colors: ['#7cb5ec', '#434348', '#90ed7d', '#f7a35c', '#8085e9', '#f15c80', '#e4d354', '#2b908f', '#f45b5b', '#91e8e1'],
                series: [{
                    name: 'Bitcoin',
                    data: [
                        38000, 37300, 37892, 38564, 36770, 36026, 34978, 35657, 35620, 35971,
                        36409, 36435, 34643, 34956, 33199, 31136, 30835, 31611, 30666, 30319,
                        31766, 29278, 27487, 26007
                    ]
                }, {
                    name: 'Real',
                    data: [
                        22534, 23599, 24533, 25195, 25896, 27635, 29173, 32646, 35686, 37709,
                        39143, 36829, 35031, 36202, 35140, 33718, 37773, 42556, 43820, 46445,
                        50048, 52804, 49317, 52490
                    ]
                }, {
                    name: 'Dollar',
                    data: [
                        38000, 37300, 37892, 38564, 36770, 36026, 34978, 35657, 35620, 35971,
                        36409, 36435, 34643, 34956, 33199, 31136, 30835, 31611, 30666, 30319,
                        31766, 29278, 27487, 26007
                    ]
                }, {
                    name: 'Yien',
                    data: [
                        38000, 37300, 37892, 38564, 36770, 36026, 34978, 35657, 35620, 35971,
                        36409, 36435, 34643, 34956, 33199, 31136, 30835, 31611, 30666, 30319,
                        31766, 29278, 27487, 26007
                    ]
                }, {
                    name: 'Euro',
                    data: [
                        38000, 37300, 37892, 38564, 36770, 36026, 34978, 35657, 35620, 35971,
                        36409, 36435, 34643, 34956, 33199, 31136, 30835, 31611, 30666, 30319,
                        31766, 29278, 27487, 26007
                    ]
                }],
                responsive: {
                    rules: [{
                        condition: {
                            maxWidth: 600
                        },
                        chartOptions: {
                            legend: {
                                layout: 'horizontal',
                                align: 'center',
                                verticalAlign: 'bottom'
                            }
                        }
                    }]
                }
            });
        }
    });
</script>