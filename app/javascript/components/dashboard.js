export { addChild }
export { addAccount }
export { loadingCharts }

const childCamembert = () => {
  const dataChildDiv = document.querySelector("#pie-chart-container");
  const dataChild = dataChildDiv.getAttribute("data-set");
  const dataJson = JSON.parse(dataChild);
  return dataJson;
};

const childLine = () => {
  const dataChildId = document.querySelector("#line-chart-container");
  const dataChildLine = dataChildId.getAttribute("data-set");
  const dataJsonLine = JSON.parse(dataChildLine);
  return dataJsonLine;
};

const addChild = () => {
  const addChildForm = document.querySelector(".child-add-form");
  const btnPlus = document.querySelector("#create-child");

  if (btnPlus) {
    btnPlus.addEventListener("click", () => {
      addChildForm.classList.remove("disable");
      addChildForm.classList.add("active");
      btnPlus.classList.add("disable");
    })
  }
}

const addAccount = () => {
  const addAccountForm = document.querySelector(".account-add-form");
  const btnAddAccount = document.querySelector("#add-account");

  if (btnAddAccount) {
    btnAddAccount.addEventListener("click", () => {
      addAccountForm.classList.remove("disable");
      addAccountForm.classList.add("active");
      btnAddAccount.classList.add("disable");
    })
  }
}

const loadingCharts = () => {
  const json = childCamembert();
  Highcharts.chart('pie-chart-container', {
    chart: {
      plotBackgroundColor: null,
      plotBorderWidth: null,
      plotShadow: false,
      type: 'pie'
    },
    title: {
      text: 'Catégories regardées sur la période'
    },
    tooltip: {
      pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    accessibility: {
      point: {
        valueSuffix: '%'
      }
    },
    plotOptions: {
      pie: {
        allowPointSelect: true,
        cursor: 'pointer',
        dataLabels: {
          enabled: true,
          format: '<b>{point.name}</b>: {point.percentage:.1f} %'
        }
      }
    },
    series: [{
      name: 'Catégorie',
      colorByPoint: true,
      data: [{
        name: 'Educatif',
        y: json.Educatif,
        sliced: true,
        selected: true
        }, {
        name: 'Comédie',
        y: json.Comédie,
        }, {
        name: 'Documentaire',
        y: json.Documentaire,
        }, {
        name: 'Action',
        y: json.Action,
        }, {
        name: 'Fantastique',
        y: json.Fantastique,
        }, {
        name: 'Animation',
        y: json.Animation,
        }, {
        name: 'Aventure',
        y: json.Aventure,
        }]
    }]
  });
  const jsonLine = childLine();
  console.log(jsonLine);
  Highcharts.chart('line-chart-container', {

    chart: {
      type: 'column'
    },

    title: {
      text: 'Minutes passées à regarder des vidéos sur la période'
    },

    subtitle: {
      text: '7 derniers jours'
    },

    yAxis: {
      title: {
        text: 'Temps (en minutes)'
      }
    },

    xAxis: {
      type: 'datetime',
      dateTimeLabelFormats: {
        day: '%e %d'
      },
      categories: [
        '25-Nov',
        '26-Nov',
        '27-Nov',
        '28-Nov',
        '29-Nov',
        '30-Nov',
        '1-Dec',
        '2-Dec',
        '3-Dec'
      ],
      startOnTick: true,
      endOnTick: true,
      showLastLabel: true,
      labels: {
        rotation: -45
      },
      accessibility: {
        rangeDescription: '8 derniers jours'
      }
    },

    legend: {
      layout: 'vertical',
      align: 'right',
      verticalAlign: 'middle'
    },

    plotOptions: {
      series: {
        label: {
          connectorAllowed: false
        },
        pointStart: 0
      }
    },

    series: [{
      name: 'Sidonie',
      data: [jsonLine.Sidonie[0], jsonLine.Sidonie[1], jsonLine.Sidonie[2], jsonLine.Sidonie[3], jsonLine.Sidonie[4], jsonLine.Sidonie[5], jsonLine.Sidonie[6], jsonLine.Sidonie[7]]
    }, {
      name: 'Freya',
      data: [jsonLine.Freya[0], jsonLine.Freya[1], jsonLine.Freya[2], jsonLine.Freya[3], jsonLine.Freya[4], jsonLine.Freya[5], jsonLine.Freya[6], jsonLine.Freya[7]]
    }, {
      name: 'Lukas',
      data: [jsonLine.Lukas[0], jsonLine.Lukas[1], jsonLine.Lukas[2], jsonLine.Lukas[3], jsonLine.Lukas[4], jsonLine.Lukas[5], jsonLine.Lukas[6], jsonLine.Lukas[7]]
    }],

    responsive: {
      rules: [{
        condition: {
          maxWidth: 500
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
};
