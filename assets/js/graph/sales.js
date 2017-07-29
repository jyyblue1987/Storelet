$(function () {
    var processed_json = new Array();
    URL_GET_BEST_PRODUCT_SELLING = BASE_URL + 'graph/graphs/best_selling';
    $.getJSON(URL_GET_BEST_PRODUCT_SELLING, function (data) {
        for (i = 0; i < data.length; i++) {
            processed_json.push([data[i].description, data[i].best_selling_product]);
        }
        Highcharts.chart('chart_view', {
            chart: {
                type: 'column'
            },
            title: {
                text: "Best selling product"
            },
            xAxis: {
                type: 'category',
                allowDecimals: false,
                title: {
                    text: ""
                }
            },
            yAxis: {
                title: {
                    text: "Total"
                }
            },
            plotOptions: {
                series: {
                    borderWidth: 0,
                    dataLabels: {
                        enabled: true,
                        format: '{point.y:,.0f}'
                    }
                }
            },
            plotOptions: {
                series: {
                    borderWidth: 0,
                    dataLabels: {
                        enabled: true,
                        format: '{point.y:.1f}%'
                    }
                }
            },

            tooltip: {
                headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:,.0f}</b> of sales<br/>'
            },

            series: [{
                name: 'Sales',
                colorByPoint: true,
                data: processed_json
            }],

        });
    });
});
